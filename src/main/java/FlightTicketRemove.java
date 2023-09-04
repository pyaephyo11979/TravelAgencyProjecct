import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "FlightTicketRemove", value = "/FlightTicketRemove")
public class FlightTicketRemove extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String sdid=request.getParameter("rsidn");
        String adid=request.getParameter("raidn");
        String date=request.getParameter("dt");
        String fName=request.getParameter("fn");
        PreparedStatement pstmt,pstmt2;
        Statement stm;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("delete from flight where sdid=? and adid=? and date=? and FName=? ");
            String sql="alter table flight AUTO_INCREMENT=1";
            pstmt.setString(1,sdid);
            pstmt.setString(2,adid);
            pstmt.setString(3,date);
            pstmt.setString(4,fName);
            int i= pstmt.executeUpdate();
            stm=con.createStatement();
            stm.executeUpdate(sql);
            if(i>0){
                pr.println("Flight Deleted Successfully");
                pr.println("<a href='flightticket.jsp'>Go Back</a>");
            }else{
                pr.println("Flight cannot be deleted");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}