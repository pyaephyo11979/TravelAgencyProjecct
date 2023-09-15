import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "USNameChangeServlet", value = "/USNameChangeServlet")
public class USNameChangeServlet extends HttpServlet {
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
        PreparedStatement pstmt;
        HttpSession sec=request.getSession();
        String NName=request.getParameter("nna");
        String pass=request.getParameter("psw");
        String email= (String) sec.getAttribute("email");
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("update user set Name=? where Email=? and Password=?");
            pstmt.setString(1,NName);
            pstmt.setString(2,email);
            pstmt.setString(3,pass);
            int i=pstmt.executeUpdate();
            if(i>0){
                pr.println("<script>alert('NameChangesSuccessfully');window.location.href='index.jsp?name="+sec.getAttribute("name")+"&valid=1'</script>");
            }else{
                pr.println("<script>alert('password Wrong!');window.location.href='index.jsp';");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}