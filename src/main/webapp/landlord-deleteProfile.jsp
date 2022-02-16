<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>


<html>
    <head>
        <title>HOUSE RENTAL SYSTEM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>


    <%
        String landlordusername = request.getParameter("landlordusername");


        try
        {

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-34-194-171-47.compute-1.amazonaws.com:5432/dcb70s908sasfa"; //ni url dri heroku database
            String user = "gpdkvocjaztxrw";
            String pass = "dceb52b9fa471dce9048a701a0f88b7d4dee9e9ca420a48101baa31d0e68def5";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            Statement stmt = conn.createStatement();
            String sql = "delete from landlord where landlordusername='engku'";
            PreparedStatement st = conn.prepareStatement(sql);


            stmt.execute(sql);

            out.println("Your Requested Data Is Deleted");
            conn.close();

        }

        catch (Exception e)
        {
            out.println("Error: " + e.toString());

        }



    %>

    <jsp:forward page="landlord-login.jsp">
        <jsp:param name="test" value="test"/>
    </jsp:forward>
    </body>

</html>


