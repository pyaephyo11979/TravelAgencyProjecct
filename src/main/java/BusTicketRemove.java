import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet(name = "BusTicketRemove", value = "/BusTicketRemove")
public class BusTicketRemove extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String startDestination = request.getParameter("rsdn");
        String finalDestination = request.getParameter("radn");
        String busName = request.getParameter("bn");
        Date date = Date.valueOf(request.getParameter("dt"));
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("delete from bus where sd=? and AD=? and BName=? and date=?");
            pstmt.setString(1, startDestination);
            pstmt.setString(2, finalDestination);
            pstmt.setString(3, busName);
            pstmt.setDate(4, date);
            int i=pstmt.executeUpdate();
            if(i>0){
                pw.println("Bus is successfully removed...");
                pw.println("<a href='dashboard.jsp'>Remove More Buses</a>");
            }else{
                pw.println("Bus is not removed...");
                pw.println("<a href='dashboard.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}