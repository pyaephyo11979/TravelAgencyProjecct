import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "feedbackServlet", value = "/feedbackServlet")
public class feedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/dbName", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String message=request.getParameter("message");
        PreparedStatement pstmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("insert into feedback values (?,?,?)");
            pstmt.setString(1,name);
            pstmt.setString(2,email);
            pstmt.setString(3,message);
            int i=pstmt.executeUpdate();
            if(i>0){
                pr.println("<script>alert('Thanks for your feedback!');window.location.href='index.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}