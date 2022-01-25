package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteServlet", value = "/AdminDeleteServlet")
public class AdminDeleteServlet extends HttpServlet {

    private AdminDeleteDao ad;
    public void init() {
        ad = new AdminDeleteDao();
    }



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int id = Integer.parseInt(request.getParameter("adminid"));
        try{
            ad.deleteUser(id);
        }catch (Exception err){
            err.printStackTrace();
        }

        response.sendRedirect("admin-login.jsp");

    }
}
