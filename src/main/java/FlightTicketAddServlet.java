import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "FlightTicketAddServlet", value = "/FlightTicketAddServlet")
public class FlightTicketAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String SDName = request.getParameter("asdn");
        String SDidName = request.getParameter("asidn");
        String ADName = request.getParameter("aadn");
        String ADidName = request.getParameter("aadidn");
        String pice= request.getParameter("pr");
        String date=request.getParameter("dt");
        String ftime= String.valueOf(request.getParameter("ft"));
        int qty= Integer.parseInt(request.getParameter("qty"));
        String flightN=request.getParameter("fn");
        int price= Integer.parseInt(pice);
        Connection con;
        PreparedStatement pstmt;
        Statement stmt;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
            String sql="select * from flight where sd=? and sdid=? and ad=? and adid=?";
            pstmt=con.prepareStatement("insert into flight (sd,sdid,ad,adid,FName,date,price,ftime,qty) values(?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1,SDName);
            pstmt.setString(2,SDidName);
            pstmt.setString(3,ADName);
            pstmt.setString(4,ADidName);
            pstmt.setString(5,flightN);
            pstmt.setString(6,date);
            pstmt.setInt(7,price);
            pstmt.setString(8,ftime);
            pstmt.setInt(9,qty);
            int i=pstmt.executeUpdate();
            if(i>0){
                out.println("Flight Added Successfully");
                out.println("<a href='flightticket.jsp'>Go Back</a>");
            }
            else{
                out.println("Flight Not Added");
            }
            pstmt.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}