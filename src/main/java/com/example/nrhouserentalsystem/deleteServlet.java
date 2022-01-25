package com.example.nrhouserentalsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import com.example.nrhouserentalsystem.landlordDao;

import static java.lang.System.out;

@WebServlet("/")
public class deleteServlet extends HttpServlet {

    private landlordDao ld;
    public void init() {
        ld = new landlordDao();
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


    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ld.deleteUser(id);
        response.sendRedirect("list");
    }



}
