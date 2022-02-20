package com.example.nrhouserentalsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;

@MultipartConfig
@WebServlet(name = "MonthlyPaymentServlet", value = "/MonthlyPaymentServlet")
public class MonthlyPaymentServlet extends HttpServlet {

    private MonthlyPaymentDao md;
    public void init() {
        md = new MonthlyPaymentDao();
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
                case "update":
                    update(request, response);
                    break;
                case "createPay":
                    createPay(request, response);
                    break;
                case "rentComplete":
                    rentComplete(request, response);
                    break;
                case "verifyPay":
                    verifyPay(request, response);
                    break;
                case "rejectPay":
                    rejectPay(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /*######################################################( UPDATE )#############################################################*/


    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {


        request.setAttribute("thiss", "nrhouserental-isp551.herokuapp.com");
        String appPath = getServletContext().getRealPath("");
        Part f = request.getPart("payreceipt");
        String host = request.getScheme()+ "://" + request.getAttribute("thiss")+"/";
        String imageFileName = f.getSubmittedFileName();
        String urlPathforDB=host + "fileDoc/" + imageFileName;
        String savePath = appPath + "fileDoc" + File.separator + imageFileName;
        new File(appPath + "fileDoc").mkdir();
        f.write(savePath);

        int payId = Integer.parseInt(request.getParameter("payId"));

        md.update(imageFileName,urlPathforDB,payId);
        response.sendRedirect("tenant-listPayment.jsp");
    }

    private void createPay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


    try{
        Double Rent = Double.parseDouble(request.getParameter("rent"));
        String Month = request.getParameter("month");
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        Date duedate = Date.valueOf(request.getParameter("duepay"));
//
//        String startDateStr = request.getParameter("duedate");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date startDate = (Date) sdf.parse(startDateStr);
//        System.out.println(startDate);
        MonthlyPayment mp = new MonthlyPayment();

        mp.setPayDueDate(duedate);
        mp.setPayPrice(Rent);
        mp.setMonth(Month);


        md.createPay(mp,bookingid);
            } catch (Exception e) {
                e.printStackTrace();
            }
        out.println("<script type=\"text/javascript\">");
        out.println("alert('You succesfully create!');");
        out.println("location='landlord-viewPayment.jsp';");
        out.println("</script>");
    }

    private void rentComplete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {

        try {
            int bookingid = Integer.parseInt(request.getParameter("bookingid"));
            int hid = Integer.parseInt(request.getParameter("hid"));

            md.rentComplete(bookingid, hid);
            response.sendRedirect("landlord-listPayment.jsp");
        } catch (Exception e) {
        e.printStackTrace();
       }
    }

    private void verifyPay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {


        int payId = Integer.parseInt(request.getParameter("payId"));


        md.verifyPay(payId);
        response.sendRedirect("landlord-viewPayment.jsp");
    }

    private void rejectPay(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException, ParseException {


        int payId = Integer.parseInt(request.getParameter("payId"));


        md.rejectPay(payId);
        response.sendRedirect("landlord-viewPayment.jsp");
    }
}
