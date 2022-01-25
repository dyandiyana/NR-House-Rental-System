package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LandlorddeleteServlet", value = "/LandlorddeleteServlet")
public class LandlorddeleteServlet extends HttpServlet {

    private LandlordDao ld;
    public void init() {
        ld = new LandlordDao();
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
