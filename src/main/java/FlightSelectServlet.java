import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "FlightSelectServlet", value = "/FlightSelectServlet")
public class FlightSelectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fid = request.getParameter("fid");
        PreparedStatement pstmt;
        HttpSession session=request.getSession();
        int qty=Integer.parseInt(session.getAttribute("qty").toString());
        ResultSet rs;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt=con.prepareStatement("select * from flight where ID=?");
            pstmt.setString(1,fid);
            rs=pstmt.executeQuery();
            while (rs.next()){
                session.setAttribute("fid",rs.getInt(1));
                session.setAttribute("sd",rs.getString(2));
                session.setAttribute("ad",rs.getString(4));
                session.setAttribute("fn",rs.getString(6));
                session.setAttribute("dt",rs.getString(7));
                session.setAttribute("ft",rs.getString(8));
                session.setAttribute("qty",qty);
                session.setAttribute("fno",rs.getString(11));
                int np=Integer.parseInt(rs.getString(10));
                int tp=np*qty;
                session.setAttribute("price",rs.getString(10));
                response.sendRedirect("bookFlight.jsp?fid="+rs.getInt(1)+"&sd="+rs.getString(2)+"&ad="+rs.getString(4)+"&fn="+rs.getString(6)+"&dt="+rs.getString(7)+"&ft"+rs.getString(8)+"&price="+tp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/dbName", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}