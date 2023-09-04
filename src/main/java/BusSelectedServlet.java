import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "BusCheckOutServlet", value = "/BusCheckOutServlet")
public class BusCheckOutServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String bid=request.getParameter("bid");
        HttpSession sc=request.getSession();
        PreparedStatement pstmt;
        Statement stmt;
        String sql;
        ResultSet rs;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            sql="select*from bus where id='" + bid + "'";
            stmt = con.createStatement();
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                String bsd=rs.getString(2);
                String bad=rs.getString(3);
                String 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}