package com.example.nrhouserentalsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {

    private AdminDao ad;
    public void init() {
        ad = new AdminDao();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
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
                case "delete":
                    deleteUser(request, response);
                    break;
                case "update":
                   updateUser(request, response);
                    break;
                case "removetenant":
                    removet(request,response);
                    break;
                case "removelandlord":
                    removel(request,response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }


    }


    /*######################################################( SINGNUP )#############################################################*/

    private void signup(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("adminusername");
        String Password = request.getParameter("adminpassword");
        String Name = request.getParameter("adminname");
        String Email = request.getParameter("adminemail");

        Admin admin = new Admin();

        admin.setUsername(username);
        admin.setPassword(Password);
        admin.setFullname(Name);
        admin.setEmail(Email);


        ad.signup(admin);
        response.sendRedirect("admin-login.jsp");
    }


    /*######################################################( LOGIN )#############################################################*/


    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String password = request.getParameter("adminpassword");
        String username = request.getParameter("adminusername");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from admin";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(username.equals(res.getString("adminusername")) && password.equals(res.getString("adminpassword")))
                    {

                        session.setAttribute("adminid", res.getInt(1));
                        session.setAttribute("adminusername", res.getString(2));
                        session.setAttribute("adminpassword", res.getString(3));
                        session.setAttribute("adminname", res.getString(4));
                        session.setAttribute("adminemail", res.getString(5));

                        response.sendRedirect("Admin-listhouse.jsp");


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
        int id = Integer.parseInt(request.getParameter("adminid"));
        String username = request.getParameter("adminusername");
        String password = request.getParameter("adminpassword");
        String name = request.getParameter("adminname");
        String email = request.getParameter("adminemail");
        Admin admin = new Admin();

        admin.setId(id);
        admin.setUsername(username);
        admin.setPassword(password);
        admin.setFullname(name);
        admin.setEmail(email);
        ad.updateUser(admin);


        session.removeAttribute("adminid");
        session.removeAttribute("adminusername");
        session.removeAttribute("adminpassword");
        session.removeAttribute("adminname");
        session.removeAttribute("adminemail");

        session.setAttribute("adminid", id);
        session.setAttribute("adminusername", username);
        session.setAttribute("adminpassword", password);
        session.setAttribute("adminname", name);
        session.setAttribute("adminemail",email);


        response.sendRedirect("admin-viewProfile.jsp");
    }



    /*######################################################( DELETE )#############################################################*/

   private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("adminid"));
        ad.deleteUser(id);
        response.sendRedirect("admin-login.jsp");
    }

    /*######################################################( REMOVE )#############################################################*/

    private void removet(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("tenantid"));
        ad.removet(id);
        response.sendRedirect("admin-listtenant.jsp");
    }

    /*######################################################( REMOVE )#############################################################*/

    private void removel(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("tenantid"));
        ad.removel(id);
        response.sendRedirect("admin-listlandlord.jsp");
    }













}
