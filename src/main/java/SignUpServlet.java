import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class SignUpServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr;
        PreparedStatement pstmt;
        FileInputStream fis=null;
        String name=request.getParameter("nm");
        String email=request.getParameter("em");
        String nrc=request.getParameter("nrc");
        Date date=Date.valueOf(request.getParameter("bd"));
        String psw=request.getParameter("psw");
        HttpSession session=request.getSession();
        ResultSet rs;
        Statement stmt;
        Connection con;
        Date signUpDate=Date.valueOf(java.time.LocalDate.now());
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("insert into user (name,nrc,birthdate,email,password,signUpDate) values (?,?,?,?,?,?)");
            HttpSession sec=request.getSession(true);
            pstmt.setString(1,name);
            pstmt.setString(2,nrc);
            pstmt.setDate(3,date);
            pstmt.setString(4,email);
            pstmt.setString(5,psw);
            pstmt.setDate(6,signUpDate);
            int i=pstmt.executeUpdate();
            if(i>0){
                String sql="select*from user where email='"+email+"'and password='"+psw+"'";
                stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
                while(rs.next()){
                sec.setAttribute("name",rs.getObject(2));
                sec.setAttribute("nrc",rs.getObject(3));
                sec.setAttribute("email",rs.getObject(6));
                response.sendRedirect("index.jsp?name="+rs.getObject(2)+"&valid=1");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}