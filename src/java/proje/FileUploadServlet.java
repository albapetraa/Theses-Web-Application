package proje;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 *
 * @author Emree
 */
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FileUploadServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filepart = request.getPart("myFile");
        String filename = filepart.getSubmittedFileName();
        for (Part part : request.getParts()) {
            part.write("C:\\Users\\Emree\\Documents\\NetBeansProjects\\WebApplication2\\web\\upload\\" + filename);
        }
        HttpSession session = request.getSession();
        session.setAttribute("sessionFileUpload", "true");

        File file = new File("C:\\Users\\Emree\\Documents\\NetBeansProjects\\WebApplication2\\web\\upload\\" + filename);
        PDDocument document = PDDocument.load(file);
        PDFTextStripper pdfStripper = new PDFTextStripper();
        pdfStripper.setStartPage(1);
        pdfStripper.setEndPage(15);

        String pages = pdfStripper.getText(document);

        String[] lines = pages.split("\r\n|\r|\n");

        int count = 1;
        String tezOgrenciNo, tezOgrenciOgretimTuru, tezOgrenciAd = null, tezTarih = null, tezTur;
        String tezDanisman = new String();
        ArrayList<String> anahtarlar = new ArrayList<String>();

        ArrayList<String> tezJuriler = new ArrayList<String>();
        ArrayList<String> tezOgrenciler = new ArrayList<String>();
        ArrayList<String> tezOgrenciNolari = new ArrayList<String>();
        ArrayList<String> tezOgrenciOgretimTurleri = new ArrayList<String>();

        String[] aKelimeler = null;
        tezJuriler.add(tezDanisman);

        tezTur = lines[3];
        int indexTezTur = 3;
        Locale TURKISH = new Locale("tr");
        String tezKonu = "";
        int indexOzetBaslangic = 0;
        int indexOzetBitis = 0;
        int indexTezTurIcin = 0;
        for (int i = 0; i < lines.length; i++) {
            String temp = lines[i];

            if (temp.contains("Öğrenci No:")) {
                tezOgrenciNo = temp.substring(temp.lastIndexOf(":") + 2);
                tezOgrenciOgretimTuru = String.valueOf(tezOgrenciNo.charAt(5));
                tezOgrenciOgretimTurleri.add(tezOgrenciOgretimTuru);
                tezOgrenciNolari.add(tezOgrenciNo);
                System.out.println(count + " " + tezOgrenciNo + " Ogretim Türü: " + tezOgrenciOgretimTuru + ".Öğretim");
            }
            if (temp.contains("Adı Soyadı:")) {
                tezOgrenciAd = temp.substring(temp.lastIndexOf(":") + 2);
                tezOgrenciAd = tezOgrenciAd.toUpperCase(TURKISH);
                tezOgrenciler.add(tezOgrenciAd);
                System.out.println(count + " " + tezOgrenciAd);
            }
            if (temp.contains("Tezin Savunulduğu Tarih:")) {
                tezTarih = temp.substring(temp.lastIndexOf(":") + 2);
                System.out.println(count + " " + tezTarih);
            }
            if (temp.contains("Danışman, Kocaeli Üniv.")) {
                temp = lines[i - 1];
                tezDanisman = temp.substring(temp.lastIndexOf(":") + 1);
                System.out.println(count + " " + tezDanisman);
            }
            if (temp.contains("Jüri Üyesi, Kocaeli Üniv.")) {
                temp = lines[i - 1];
                String tezJuri = temp.substring(temp.lastIndexOf(":") + 1);
                tezJuriler.add(tezJuri);
                System.out.println(count + " " + tezJuri);
            }
            if (temp.contains("Anahtar kelimeler:")) {

                indexOzetBitis = i;
                String anahtar = temp.substring(temp.lastIndexOf(":") + 2);
                aKelimeler = anahtar.split(",");
                for (int j = 0; j < aKelimeler.length; j++) {
                    String string = aKelimeler[j];
                    anahtarlar.add(string);

                }
                String[] a2 = lines[i + 1].split(",");
                for (int j = 0; j < a2.length; j++) {
                    String string = a2[j];
                    anahtarlar.add(string);

                }
                System.out.println(count + " " + aKelimeler[0] + " " + aKelimeler[1]);
            }
            if (temp.contains("ÖZET")) {
                indexOzetBaslangic = i;
            }
            if (temp.contains("BİLGİSAYAR MÜHENDİSLİĞİ BÖLÜMÜ") && indexTezTurIcin < 2) {
                if (indexTezTurIcin == 1) {
                    tezTur = lines[i + 1];
                }
                indexTezTurIcin++;
            }

        }
        for (int i = 0; i < 300; i++) {
            String temp = lines[i];
            if (temp.compareTo(tezOgrenciler.get(0)) == 0) {
                for (int j = indexTezTur + 1; j < i; j++) {

                    String string = lines[j];
                    tezKonu += string + " ";
                }
                break;
            }
        }
        String tezOzet = "";
        for (int i = indexOzetBaslangic + 1; i < indexOzetBitis; i++) {
            String temp = lines[i];
            tezOzet += temp;
        }

        System.out.println("*******TEZ OZET********");
        System.out.println(tezOzet);
        System.out.println("*******TEZ OZETBİTİŞ********");

        tezJuriler.set(0, tezDanisman);
        for (int i = 0; i < tezJuriler.size(); i++) {
            String line = tezJuriler.get(i);
            System.out.println("TEZ JURİ: " + line);
        }
        System.out.println("TEZ TUR: " + tezTur);
        System.out.println("TEZ KONU: " + tezKonu);
        String tezUserId = String.valueOf(session.getAttribute("sessionUserId"));
        System.out.println("BAKK: " + tezUserId);
        DBConnection conn = new DBConnection();
        conn.getConnect();
        conn.tezleriEkle1(tezUserId, tezTur, tezKonu, tezTarih, tezOzet, anahtarlar, filename);
        String tezId = conn.tezIdAl(tezKonu);
        conn.tezleriEkle2(tezId, tezDanisman);
        for (int i = 0; i < tezJuriler.size(); i++) {
            String string = tezJuriler.get(i);
            conn.tezleriEkle3(tezId, string);
        }
        for (int i = 0; i < tezOgrenciler.size(); i++) {
            String ogrAd = tezOgrenciler.get(i);
            String ogrNo = tezOgrenciNolari.get(i);
            String ogrTur = tezOgrenciOgretimTurleri.get(i);
            conn.tezleriEkle4(tezId, ogrAd, ogrNo, ogrTur);
        }
        for (int i = 0; i < anahtarlar.size(); i++) {
            String string = anahtarlar.get(i);
            if (!string.equals("9")) {
                conn.tezleriEkle5(tezId, string);

            }

        }
        document.close();

        response.sendRedirect("upload.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
