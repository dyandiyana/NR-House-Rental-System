package com.example.nrhouserentalsystem;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig
@WebServlet(name = "LAcreateHouseDetailsServlet", value = "/LAcreateHouseDetailsServlet")
public class LAcreateHouseDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        try{
//            HttpSession session = request.getSession();
//
//
//            String sdIDV = (String) session.getAttribute("sdid");
//            String sdhMPV = (String) session.getAttribute("sdName");
//            String SdEmailV = (String) session.getAttribute("sdEmail");
//            String PhoneNumV = (String) session.getAttribute("sdPnum");
//
//            StudentDetails sd = new StudentDetails(sdIDV,sdhMPV,SdEmailV,PhoneNumV);
//            sd.getStudid();
//            sd.getStuname();
//            sd.getEmail();
//            sd.getPhonenum();
//
//
//            out.println("</body></html>");
//        }catch(Exception e){
//            out.println(e);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String sdIDV = (String) session.getAttribute("LAid");
        int landid = Integer.parseInt(sdIDV);


        //picture upload
        Part f=request.getPart("hPic");
        String imageFileName=f.getSubmittedFileName();
        File file = new File("C:/Users/Public/LAB EXERCISE/nonresident/src/main/webapp/images/" + imageFileName);
        System.out.println("my file need upload" + file);

        //agree file upload
//        Part agree =request.getPart("hAgree");
//        String agreeFileName=agree.getSubmittedFileName();
//        File file2 = new File("C:/Users/Public/LAB EXERCISE/nonresident/src/main/webapp/images/" + agreeFileName);
//        System.out.println("my file need upload" + file2);

       try{


           String hName    = request.getParameter("hName");
           Double hMP     = Double.parseDouble(request.getParameter("Pricepm"));
           String hAddress = request.getParameter("hAddress");
           String hloc    = request.getParameter("hloc");
           String hAvailability = request.getParameter("hAvailability");
           int hNoTenants = Integer.parseInt( request.getParameter("NumOfTenant"));
           int hNoRoom = Integer.parseInt(request.getParameter("NumOfRooms"));
           int hNoToilet = Integer.parseInt(request.getParameter("NumOfToilet"));
           int hNoAC = Integer.parseInt(request.getParameter("NumOfAC"));
           boolean hWifi = Boolean.parseBoolean(request.getParameter("hWifi"));
           int hFurniture = Integer.parseInt(request.getParameter("NumOfSofa"));
           int hWM = Integer.parseInt(request.getParameter("NumOfWM"));
           String desc = request.getParameter("Desc");


           try {

               //for picture
               FileOutputStream fos = new FileOutputStream(file);
               InputStream is = f.getInputStream();

               byte[] data=new byte[is.available()];
               is.read(data);
               fos.write(data);
               fos.close();

//               //for agreement file
//               FileOutputStream fos2 = new FileOutputStream(file2);
//               InputStream is2 = f.getInputStream();
//
//               byte[] data2 =new byte[is.available()];
//               is2.read(data2);
//               fos2.write(data2);
//               fos2.close();


           }catch (Exception e){
               e.printStackTrace();
           }


           try {
           Class.forName("org.postgresql.Driver");
               String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
               String user = "gpdkvocjaztxrw"; //ni user dri heroku database
               String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5"; //ni password dri heroku database
           Connection conn = DriverManager.getConnection(dbURL, user, pass);

           PreparedStatement st;
           String query="insert into housedetails(housename,housemonthlyprice,houseaddress,houselocation,housepublishdate,houseavailability,housenotenants,housenoroom,housenotoilet,housenoac,housewifi,housefurniture,housewm,housedescription,housepicname,landlordid) values(?,?,?,?,localtimestamp,?,?,?,?,?,?,?,?,?,?,19)";
           st = conn.prepareStatement(query);
               st.setString(1,hName);
               st.setDouble(2,hMP);
               st.setString(3,hAddress);
               st.setString(4,hloc);
               st.setString(5,hAvailability);
               st.setInt(6,hNoTenants);
               st.setInt(7,hNoRoom);
               st.setInt(8,hNoToilet);
               st.setInt(9,hNoAC);
               st.setBoolean(10,hWifi);
               st.setInt(11,hFurniture);
               st.setInt(12,hWM);
               st.setString(13,desc);
               st.setString(14,imageFileName);


               int row= st.executeUpdate();//return no of row effected

               if(row>0){
                   response.sendRedirect("landlord-displayHouseList.jsp");
               }else{
                   out.println("Record failed");
               }


//           PreparedStatement st3;
//           String query3="insert into houseAgree(houseAgreeName,landlordid) values(?,?)";
//           st3 = conn.prepareStatement(query3);
//           st3.setString(1,agreeFileName);
//           st3.setInt(2,hid);
//
//
//           int row3= st3.executeUpdate();//return no of row effected
//
//
//           if(row3>0){
//               out.println("Record inserted");
//           }else{
//               out.println("Record failed");
//           }
           }catch (Exception e){
               e.printStackTrace();
           }



       }catch (Exception e){
           System.out.println(e);
       }
    }
}
