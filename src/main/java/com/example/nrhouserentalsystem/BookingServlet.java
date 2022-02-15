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
                case "delete":
                    delete(request, response);
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

        int id = Integer.parseInt(request.getParameter("tenantid"));
        int houseid = Integer.parseInt(request.getParameter("houseid"));


        Tenant tenant = new Tenant();
        House house = new House();

        tenant.setTenantId(id);
        house.setHouseid(houseid);

        bd.create(tenant, house);
        response.sendRedirect("tenant-listBooking.jsp");
    }

    /*######################################################( UPDATE )#############################################################*/


    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {


        Part f = request.getPart("bookingdepo");
        Part fi = request.getPart("bookingagreement");
        int bookingId = Integer.parseInt(request.getParameter("bookingid"));


        bd.update(f, fi, bookingId);
        response.sendRedirect("tenant-listBooking.jsp");
    }
    /*######################################################( DELETE )#############################################################*/

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bd.deletebooking(bookingid);
        response.sendRedirect("tenant-listBooking.jsp");
    }
}


