package com.example.nrhouserentalsystem;

import org.w3c.dom.Text;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.*;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;


@WebServlet(name = "TenantServlet", value = "/TenantServlet")
public class TenantServlet extends HttpServlet {

    private TenantDao td;
    public void init() {
        td = new TenantDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "signup":
                    signup(request, response);
                    break;
                case "login":
                    login(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }

    }
    /*######################################################( SINGNUP )#############################################################*/

    private void signup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String username = request.getParameter("tenantusername");
        String password = request.getParameter("tenantpassword");
        String name = request.getParameter("tenantname");
        String email = request.getParameter("tenantemail");
        int age = Integer.parseInt(request.getParameter("tenantage"));
        String phoneNo = request.getParameter("tenantphoneno");
        String gender = request.getParameter("tenantgender");

        Tenant tenant = new Tenant();


        tenant.setTenantUsername(username);
        tenant.setTenantPassword(password);
        tenant.setTenantName(name);
        tenant.setTenantEmail(email);
        tenant.setTenantAge(age);
        tenant.setTenantPhoneNo(phoneNo);
        tenant.setTenantGender(gender);

        td.signup(tenant);
        response.sendRedirect("tenant-login.jsp");
    }

    /*######################################################( LOGIN )#############################################################*/

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = request.getParameter("tenantusername");
        String password = request.getParameter("tenantpassword");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from tenant";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(username.equals(res.getString("tenantusername")) && password.equals(res.getString("tenantpassword")))
                    {


                        Tenant tenant = new Tenant();

                        tenant.setTenantId(res.getInt(1));
                        tenant.setTenantUsername(res.getString(2));
                        tenant.setTenantPassword(res.getString(3));
                        tenant.setTenantName(res.getString(4));
                        tenant.setTenantEmail(res.getString(5));
                        tenant.setTenantAge(res.getInt(6));
                        tenant.setTenantPhoneNo(res.getString(7));
                        tenant.setTenantGender(res.getString(8));

                        session.setAttribute("tenantid", tenant.getTenantId());
                        session.setAttribute("tenant", tenant);
                        response.sendRedirect("tenant-homepage.jsp");


                    }else{
                        out.println("User not exist");
                    }
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    /*######################################################( UPDATE )#############################################################*/


    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        HttpSession session = request.getSession();

        int lId= Integer.parseInt(request.getParameter("tenantid"));
        String username = request.getParameter("tenantusername");
        String lPassword = request.getParameter("tenantpassword");
        String lName = request.getParameter("tenantname");
        String lEmail = request.getParameter("tenantemail");
        int lAge = Integer.parseInt(request.getParameter("tenantage"));
        String lPhoneNo = request.getParameter("tenantphoneno");
        String lGender = request.getParameter("tenantgender");

        Tenant tenant = new Tenant();

        tenant.setTenantId(lId);
        tenant.setTenantUsername(username);
        tenant.setTenantPassword(lPassword);
        tenant.setTenantName(lName);
        tenant.setTenantEmail(lEmail);
        tenant.setTenantAge(lAge);
        tenant.setTenantPhoneNo(lPhoneNo);
        tenant.setTenantGender(lGender);
        td.updateUser(tenant);

        session.removeAttribute("tenant");
        session.setAttribute("tenant", tenant);
        response.sendRedirect("tenant-viewProfile.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("tenantid"));
        td.deleteUser(id);
        response.sendRedirect("tenant-login.jsp");
    }
}
