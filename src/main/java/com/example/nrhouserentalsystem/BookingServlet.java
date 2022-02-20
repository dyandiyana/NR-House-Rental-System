package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;

@MultipartConfig
@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {

    private BookingDao bd;

    public void init() {
        bd = new BookingDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "create":
                    create(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "agree":
                    agree(request, response);
                    break;
                case "cancel":
                    cancel(request, response);
                    break;
                case "approvedbooking":
                    approvedbook(request, response);
                    break;
                case "verifybooking":
                    verifybook(request, response);
                    break;
                case "rejectbooking":
                    rejectbook(request, response);
                    break;

            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*######################################################( CREATE )#############################################################*/

    private void create(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession();

        int tenantid = Integer.parseInt(request.getParameter("tenantid"));
        int houseid = Integer.parseInt(request.getParameter("houseid"));
        int landlordid  =Integer.parseInt(request.getParameter("landlordid"));


        Tenant tenant = new Tenant();
        House house = new House();
        Landlord landlord = new Landlord();

        tenant.setTenantId(tenantid);
        house.setHouseid(houseid);
        landlord.setLandlordId(landlordid);

        bd.create(tenant, house, landlord);
        response.sendRedirect("tenant-listBooking.jsp");
    }

    /*######################################################( UPDATE )#############################################################*/


    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int bookingId = Integer.parseInt(request.getParameter("bookingid"));

        String appPath = getServletContext().getRealPath("");
        Part f = request.getPart("bookingdepo");
        String host = request.getScheme()+ "://" + request.getHeader("nrhouserental-isp551.herokuapp.com")+"/";
        String imageFileName = f.getSubmittedFileName();
        String urlPathforDB=host + "fileDoc/" + imageFileName;
        String savePath = appPath + "fileDoc" + File.separator + imageFileName;
        new File(appPath + "fileDoc").mkdir();
        f.write(savePath);

//        String appPath2 = getServletContext().getRealPath("");
//        Part fi = request.getPart("bookingagreement");
//        String host2 = request.getScheme()+ "://" + request.getHeader("nrhouserental-isp551.herokuapp.com")+"/";
//        String imageFileName2 = fi.getSubmittedFileName();
//        String urlPathforDB2 =host2 + "fileDoc/" + imageFileName2;
//        String savePath2 = appPath2 + "fileDoc" + File.separator + imageFileName2;
//        new File(appPath2 + "fileDoc").mkdir();
//        f.write(savePath2);

//        bd.update(imageFileName,urlPathforDB,imageFileName2,urlPathforDB2,bookingId);
        bd.update(imageFileName,urlPathforDB,bookingId);
        response.sendRedirect("tenant-listBooking.jsp");
    }

    /*######################################################( UPDATE )#############################################################*/


    private void agree(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int bookingId = Integer.parseInt(request.getParameter("bookingid"));

        String appPath = getServletContext().getRealPath("");
        Part f = request.getPart("agreement");
        String host = request.getScheme()+ "://" + request.getHeader("nrhouserental-isp551.herokuapp.com")+"/";
        String imageFileName = f.getSubmittedFileName();
        String urlPathforDB=host + "fileDoc/" + imageFileName;
        String savePath = appPath + "fileDoc" + File.separator + imageFileName;
        new File(appPath + "fileDoc").mkdir();
        f.write(savePath);

//        String appPath2 = getServletContext().getRealPath("");
//        Part fi = request.getPart("bookingagreement");
//        String host2 = request.getScheme()+ "://" + request.getHeader("nrhouserental-isp551.herokuapp.com")+"/";
//        String imageFileName2 = fi.getSubmittedFileName();
//        String urlPathforDB2 =host2 + "fileDoc/" + imageFileName2;
//        String savePath2 = appPath2 + "fileDoc" + File.separator + imageFileName2;
//        new File(appPath2 + "fileDoc").mkdir();
//        f.write(savePath2);

//        bd.update(imageFileName,urlPathforDB,imageFileName2,urlPathforDB2,bookingId);
        bd.agree(imageFileName,urlPathforDB,bookingId);
        response.sendRedirect("tenant-listBooking.jsp");
    }
    /*######################################################( CANCEL )#############################################################*/

    private void cancel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        int houseid = Integer.parseInt(request.getParameter("houseid"));
        bd.cancelbooking(bookingid,houseid);
        response.sendRedirect("tenant-listBooking.jsp");
    }
    /*######################################################( LANDLORD APPROVE BOOKING )#############################################################*/

    private void approvedbook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        request.setAttribute("thiss", "nrhouserental-isp551.herokuapp.com");
        String appPath = getServletContext().getRealPath("");
        Part f = request.getPart("agreedoc");
        String host = request.getScheme()+ "://" + request.getAttribute("thiss")+"/";
        String imageFileName = f.getSubmittedFileName();
        String urlPathforDB=host + "fileDoc/" + imageFileName;
        String savePath = appPath + "fileDoc" + File.separator + imageFileName;
        new File(appPath + "fileDoc").mkdir();
        f.write(savePath);
        System.out.println(f);

        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        int houseid = Integer.parseInt(request.getParameter("houseid"));
        bd.approvedbooking(bookingid, imageFileName,urlPathforDB, houseid);


        out.println("<script type=\"text/javascript\">");
        out.println("alert('You succesfully approved this booking form!');");
        out.println("location='landlord-displayBookingList.jsp';");
        out.println("</script>");
    }

    /*######################################################( LANDLORD VERIFY DEPOSIT AND AGREEMENT )#############################################################*/

    private void verifybook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.verifybook(bookingid);

        out.println("<script type=\"text/javascript\">");
        out.println("alert('You succesfully verify this agreement and deposit!');");
        out.println("location='landlord-displayBookingList.jsp';");
        out.println("</script>");
    }

    /*######################################################( LANDLORD REJECT DEPOSIT AND AGREEMENT  )#############################################################*/

    private void rejectbook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.rejectbook(bookingid);

        out.println("<script type=\"text/javascript\">");
        out.println("alert('You succesfully reject this agreement and deposit!');");
        out.println("location='landlord-displayBookingList.jsp';");
        out.println("</script>");
    }
}


