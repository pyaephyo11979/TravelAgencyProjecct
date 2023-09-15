import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet(name = "BusTicketAdd", value = "/BusTicketAdd")
public class BusTicketAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String startDestination = request.getParameter("asdn");
        String finalDestination = request.getParameter("aadn");
        String busName = request.getParameter("bn");
        String date = request.getParameter("dt");
        String price = request.getParameter("pr");
        String availableSeats = request.getParameter("nos");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("insert into bus (SD, AD, Date, BName, Price,sno) values(?,?,?,?,?,?)");
            pstmt.setString(1, startDestination);
            pstmt.setString(2, finalDestination);
            pstmt.setString(4, busName);
            pstmt.setString(3, date);
            pstmt.setString(5, price);
            pstmt.setString(6, availableSeats);
            int i = pstmt.executeUpdate();
            if(i>0){
                pw.println("Bus is successfully added...");
                pw.println("<a href='dashboard.jsp'>Add More Buses</a>");
            }else{
                pw.println("Something went wrong in adding bus....");
                pw.println("<a href='dashboard.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}