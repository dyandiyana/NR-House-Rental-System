package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

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


        Part f = request.getPart("payreceipt");

        int payId = Integer.parseInt(request.getParameter("payId"));

        md.update(f,payId);
        response.sendRedirect("tenant-listPayment.jsp");
    }
}
