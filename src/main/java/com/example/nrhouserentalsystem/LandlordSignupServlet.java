package com.example.nrhouserentalsystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "LandlordSignupServlet", value = "/LandlordSignupServlet")
public class LandlordSignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(); // if nk wujudkan session mcm sir buat

        // tarik value dri form dalam jsp lalu kot javascript bawah tu
        String lUsername = (String) session.getAttribute("landlordUsername");
        String lPassword = (String) session.getAttribute("landlordPassword");
        String lName = (String) session.getAttribute("landlordName");
        String lEmail = (String) session.getAttribute("landlordEmail");
        String lAge = (String) session.getAttribute("landlordAge");
        String lPhoneNo = (String) session.getAttribute("landordPhoneNo");
        String lGender = (String) session.getAttribute("landlordGender");

        //masukkan value ke dlm java class StudentDetails
        //CreateAccount createAccount = new CreateAccount(lUsername,lPassword,lName,lEmail,lAge,lPhoneNo,lGender);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""
            String lUsername = request.getParameter("landlordUsername");
            String lPassword = request.getParameter("landlordPassword");
            String lName = request.getParameter("landlordName");
            String lEmail = request.getParameter("landlordEmail");
            String lAge = request.getParameter("landlordAge");
            String lPhoneNo = request.getParameter("landlordPhoneNo");
            String lGender = request.getParameter("landlordGender");

            //nk testing keluar masuk data pastikan xampp, heroku , database connected

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw"; //ni user dri heroku database
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku

            PreparedStatement st;
            String query="insert into landlord(landlordusername,landlordpassword,landlordname,landlordemail,landlordage,landlordphoneno,landlordgender) values(?,?,?,?,?,?,?)";

            st = conn.prepareStatement(query);
            //paramter tu no column dlm table.sdId1 tu dri nama attribute kat String atas tu
            st.setString(1,lUsername);
            st.setString(2,lPassword);
            st.setString(3,lName);
            st.setString(4,lEmail);
            st.setString(5,lAge);
            st.setString(6,lPhoneNo);
            st.setString(7,lGender);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                out.println("Record insertedd");
                //response.sendRedirect("landlord-login.jsp");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
