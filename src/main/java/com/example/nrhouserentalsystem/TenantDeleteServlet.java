package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TenantDeleteServlet", value = "/TenantDeleteServlet")
public class TenantDeleteServlet extends HttpServlet {

    private TenantDeleteDao td;
    public void init() {
        td = new TenantDeleteDao();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        int id = Integer.parseInt(request.getParameter("tenantid"));
        try{
            td.deleteUser(id);
        }catch (Exception err){
            err.printStackTrace();
        }

        response.sendRedirect("tenant-login.jsp");


    }
}
