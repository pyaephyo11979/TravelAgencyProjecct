import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "USPasswordChangeServlet", value = "/USPasswordChangeServlet")
public class USPasswordChangeServlet extends HttpServlet {
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
        String npsw=request.getParameter("npsw");
        String opsw=request.getParameter("psw");
        String email= (String) sec.getAttribute("email");
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("update user set Password=? where Email=? and Password=?");
            pstmt.setString(1,npsw);
            pstmt.setString(2,email);
            pstmt.setString(3,opsw);
            int i=pstmt.executeUpdate();
            if(i>0){
                pr.println("<script>alert('Password Changed Successfully! Please log back in again!');window.location.href='index.jsp'</script>");
            }else {
                pr.println("<script>alert('Something went Wrong!');window.location.href='index.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}