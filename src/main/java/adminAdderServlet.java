import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "adminAdderServlet", value = "/adminAdderServlet")
public class adminAdderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String adminName = request.getParameter("usname");
        String adminPassword = request.getParameter("psw");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt= con.prepareStatement("insert into admin values(?,?)");
            pstmt.setString(1, adminName);
            pstmt.setString(2, adminPassword);
            int i = pstmt.executeUpdate();
            if(i>0){
                pw.println("Admin is successfully added...");
                pw.println("<a href='dashboard.jsp'>Add More Admins</a>");
            }else{
                pw.println("Something went wrong in adding admin....");
                pw.println("<a href='dashboard.jsp'>Try Again</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}