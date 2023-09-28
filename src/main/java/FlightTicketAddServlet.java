import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet(name = "FlightTicketAddServlet", value = "/FlightTicketAddServlet")
public class FlightTicketAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String startDestination = request.getParameter("asdn");
        String startDestinationId = request.getParameter("asidn");
        String finalDestination = request.getParameter("aadn");
        String finalDestinationId = request.getParameter("aadidn");
        String flightName = request.getParameter("fn");
        Date date = Date.valueOf(request.getParameter("dt"));
        String flightTime = request.getParameter("ft");
        String price = request.getParameter("pr");
        String availableSeats = request.getParameter("qty");
        String FlightNO = request.getParameter("FNO");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("insert into flight (SD, SDID, AD, ADID, FName, Date, ftime, Price,qty,flight_No) values(?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, startDestination);
            pstmt.setString(2, startDestinationId);
            pstmt.setString(3, finalDestination);
            pstmt.setString(4, finalDestinationId);
            pstmt.setString(5, flightName);
            pstmt.setDate(6, date);
            pstmt.setString(7, flightTime);
            pstmt.setString(8, price);
            pstmt.setString(9, availableSeats);
            pstmt.setString(10, FlightNO);
            int i = pstmt.executeUpdate();
            if(i>0){
                pw.println("Flight is successfully added...");
                pw.println("<a href='dashboard.jsp'>Add More Flights</a>");
            }else{
                pw.println("Something went wrong in adding flight....");
                pw.println("<a href='dashboard.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}