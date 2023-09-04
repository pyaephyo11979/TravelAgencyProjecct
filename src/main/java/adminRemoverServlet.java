import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "adminRemoverServlet", value = "/adminRemoverServlet")
public class adminRemoverServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String name=request.getParameter("usname");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("delete from admin where username=?");
            pstmt.setString(1, name);
            int i=pstmt.executeUpdate();
            if(i>0){
                pw.println("Admin is successfully removed...");
                pw.println("<a href='adminaddandremove.jsp'>Remove More Admins</a>");
            }else{
                pw.println("Admin is not removed...");
                pw.println("<a href='adminaddandremove.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}