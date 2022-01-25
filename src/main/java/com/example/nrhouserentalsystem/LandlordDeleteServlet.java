package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LandlordDeleteServlet", value = "/LandlordDeleteServlet")
public class LandlordDeleteServlet extends HttpServlet {

    private LandlordDeleteDao ld;
    public void init() {
        ld = new LandlordDeleteDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("landlordid"));
        try{
            ld.deleteUser(id);
        }catch (Exception err){
            err.printStackTrace();
        }

        response.sendRedirect("landlord-login.jsp");


    }




}
