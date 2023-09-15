import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "FlightMatchingServlet", value = "/FlightMatchingServlet")
public class FlightMatchingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String from=request.getParameter("sdn");
        String to=request.getParameter("adn");
        String flight=request.getParameter("fn");
        String date=String.valueOf(request.getParameter("dt"));
        int qty=Integer.parseInt(request.getParameter("qty"));
        System.out.println(qty);
        ResultSet rs;
        Statement stmt;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            String sql="select * from flight where sd='"+from+"' and ad='"+to+"' and fname='"+flight+"' and date='"+date+"' and qty>="+qty;
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(rs.next()){
                HttpSession session=request.getSession();
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
            }else{
                pr.println("<script>alert('No Flight Found');window.location.href='flightticketBooking.jsp';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}