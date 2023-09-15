import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet(name = "FlightTicketRemove", value = "/FlightTicketRemove")
public class FlightTicketRemove extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String startDestinationId = request.getParameter("rsidn");
        String finalDestinationId = request.getParameter("raidn");
        String flightName = request.getParameter("fn");
        String date = request.getParameter("dt");
        String flightTime = request.getParameter("ft");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("delete from flight where SDID=? and adid=? and FName=? and Date=? and ftime=?");
            pstmt.setString(1, startDestinationId);
            pstmt.setString(2, finalDestinationId);
            pstmt.setString(3, flightName);
            pstmt.setString(4, date);
            pstmt.setString(5, flightTime);
            int i=pstmt.executeUpdate();
            if(i>0){
                pw.println("Flight is successfully removed...");
                pw.println("<a href='dashboard.jsp'>Remove More Flights</a>");
            }else{
                pw.println("Flight is not removed...");
                pw.println("<a href='dashboard.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}