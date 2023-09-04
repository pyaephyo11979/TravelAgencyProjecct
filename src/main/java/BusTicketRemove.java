import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "BusTicketRemove", value = "/BusTicketRemove")
public class BusTicketRemove extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        Connection con;
        String SDName=request.getParameter("rsdn");
        String ADName=request.getParameter("radn");
        String BusName=request.getParameter("bn");
        String Date=request.getParameter("dt");
        PreparedStatement stmt;
        Statement stm;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            stmt=con.prepareStatement("delete from bus where sd=? and ad=? and bName=? and date=?");
            String sql="alter table bus auto_increment=1";
            stm=con.createStatement();
            stmt.setString(1,SDName);
            stmt.setString(2,ADName);
            stmt.setString(3,BusName);
            stmt.setString(4,Date);
            int i=stmt.executeUpdate();
            stm.executeUpdate(sql);
            if(i>0){
                pr.println("Deleted Bus Successfully!");
                pr.println("<a href='busticket.jsp'>GoBack..</a>");
            }else{
                pr.println("Bus cannot be deleted.");
                pr.println("<a href='busticket.jsp'>GoBack..</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}