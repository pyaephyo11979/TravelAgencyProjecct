import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String usname=request.getParameter("usname");
        String psw=request.getParameter("pass");
        Connection con;
        PreparedStatement pstmt;
        Statement stmt;
        String sql;
        ResultSet rs;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            sql="select*from user where email='"+usname+"'and password='"+psw+"'";
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next()){
                String valid="1";
               String name= (String) rs.getObject(2);
               String nrc= (String) String.valueOf(rs.getObject(3));
               String email= (String) rs.getObject(6);
               HttpSession session=request.getSession(true);
               session.setAttribute("name",name);
               session.setAttribute("nrc",nrc);
               session.setAttribute("email",email);
               session.setAttribute("valid",valid);
               response.sendRedirect("index.jsp?name="+name+"&valid="+valid);
            }else {
                RequestDispatcher rd=request.getRequestDispatcher("LoginPage.jsp");
                pr.println("<h2 class='text-cener' style='color:red; text-align:center;'>Username Or Password Incorrect!</h2>");
                rd.include(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}