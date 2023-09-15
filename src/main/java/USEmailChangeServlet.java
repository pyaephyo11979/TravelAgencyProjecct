import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "USEmailChangeServlet", value = "/USEmailChangeServlet")
public class USEmailChangeServlet extends HttpServlet {
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
        HttpSession sec=request.getSession();
        PreparedStatement pstmt;
        String nem=request.getParameter("nem");
        String psw=request.getParameter("psw");
        String email= (String) sec.getAttribute("email");
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("update user set Email=? where Email=? and Password=?");
            pstmt.setString(1,nem);
            pstmt.setString(2,email);
            pstmt.setString(3,psw);
            int i=pstmt.executeUpdate();
            if(i>0){
                pr.println("<script>alert('Email Changed Successfully! Please log back in again!');window.location.href='index.jsp'</script>");
            }else {
                pr.println("<script>alert('Something went Wrong!');window.location.href='index.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}