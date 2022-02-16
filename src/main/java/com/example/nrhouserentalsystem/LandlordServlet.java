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



@WebServlet(name = "LandlordServlet", value = "/LandlordServlet")
public class LandlordServlet extends HttpServlet {

    private LandlordDao ld;
    public void init() {
        ld = new LandlordDao();
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

        String username = request.getParameter("landlordUsername");
        String password = request.getParameter("landlordPassword");
        String name = request.getParameter("landlordName");
        String email = request.getParameter("landlordEmail");
        int age = Integer.parseInt(request.getParameter("landlordAge"));
        String phoneNo = request.getParameter("landlordPhoneNo");
        String gender = request.getParameter("landlordGender");

        Landlord landlord = new Landlord();


        landlord.setLandlordUsername(username);
        landlord.setLandlordPassword(password);
        landlord.setLandlordName(name);
        landlord.setLandlordEmail(email);
        landlord.setLandlordAge(age);
        landlord.setLandlordPhoneNo(phoneNo);
        landlord.setLandlordGender(gender);

        ld.signup(landlord);
        response.sendRedirect("landlord-login.jsp");
    }

    /*######################################################( LOGIN )#############################################################*/

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = request.getParameter("landlordUsername");
        String password = request.getParameter("landlordPassword");

        try {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            String sql  ="SELECT * from landlord";

            if (conn != null){
                DatabaseMetaData dm = conn.getMetaData();
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product Name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());


                Statement statement = conn.createStatement();
                ResultSet res = statement.executeQuery(sql);

                while (res.next()){
                    if(username.equals(res.getString("landlordusername")) && password.equals(res.getString("landlordpassword")))
                    {


                        Landlord landlord = new Landlord();

                        landlord.setLandlordId(res.getInt(1));
                        landlord.setLandlordUsername(res.getString(2));
                        landlord.setLandlordPassword(res.getString(3));
                        landlord.setLandlordName(res.getString(4));
                        landlord.setLandlordEmail(res.getString(5));
                        landlord.setLandlordAge(res.getInt(6));
                        landlord.setLandlordPhoneNo(res.getString(7));
                        landlord.setLandlordGender(res.getString(8));

                        session.setAttribute("landlordid", res.getInt(1));
                        session.setAttribute("landlord", landlord);
                        response.sendRedirect("landlord-displayHouseList.jsp");


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

        int lId= Integer.parseInt(request.getParameter("landlordid"));
        String username = request.getParameter("landlordusername");
        String lPassword = request.getParameter("landlordpassword");
        String lName = request.getParameter("landlordname");
        String lEmail = request.getParameter("landlordemail");
        int lAge = Integer.parseInt(request.getParameter("landlordage"));
        String lPhoneNo = request.getParameter("landlordPhoneNo");
        String lGender = request.getParameter("landlordgender");

        Landlord landlord = new Landlord();

        landlord.setLandlordId(lId);
        landlord.setLandlordUsername(username);
        landlord.setLandlordPassword(lPassword);
        landlord.setLandlordName(lName);
        landlord.setLandlordEmail(lEmail);
        landlord.setLandlordAge(lAge);
        landlord.setLandlordPhoneNo(lPhoneNo);
        landlord.setLandlordGender(lGender);

        ld.updateUser(landlord);
        session.removeAttribute("landlord");
        session.setAttribute("landlord", landlord);
        response.sendRedirect("landlord-viewProfile.jsp");
    }

    /*######################################################( DELETE )#############################################################*/

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("landlordid"));
        ld.deleteUser(id);
        response.sendRedirect("landlord-login.jsp");
    }
}
