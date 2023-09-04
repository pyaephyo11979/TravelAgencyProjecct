import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "BusTicketAdd", value = "/BusTicketAdd")
public class BusTicketAdd extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String SDName=request.getParameter("asdn");
        String ADName=request.getParameter("aadn");
        String BusName=request.getParameter("bn");
        String Date=request.getParameter("dt");
        int price=Integer.parseInt(request.getParameter("pr"));
        PreparedStatement stmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            stmt=con.prepareStatement("insert into bus (sd,ad,date,bname,price) values (?,?,?,?,?)");
            stmt.setString(1,SDName);
            stmt.setString(2,ADName);
            stmt.setString(3,Date);
            stmt.setString(4,BusName);
            stmt.setInt(5,price);
            int i= stmt.executeUpdate();
            if(i>0){
                pr.println("Added Bus Successfully!");
                pr.println("<a href='busticket.jsp'>GoBack..</a>");
            }else{
                pr.println("There is an error adding bus");
                pr.println("<a href='busticket.jsp'>GoBack..</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}