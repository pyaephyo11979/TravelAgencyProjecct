import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "BusMatchingServlet", value = "/BusMatchingServlet")
public class BusMatchingServlet extends HttpServlet {
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
        String from=request.getParameter("sdn");
        String to=request.getParameter("adn");
        int nop=Integer.parseInt(request.getParameter("nop"));
        Date dt=Date.valueOf(request.getParameter("dt"));
        Statement stmt;
        PreparedStatement pstmt;
        String sql;
        ResultSet rs;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
                sql = "select * from bus where SD='" + from + "' and AD='" + to + "' and Date='" +dt+ "' and sno>='"+nop+"'";
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    int id = rs.getInt(1);
                    String sd = rs.getString(2);
                    int sno=rs.getInt(6);
                    String ad = rs.getString(3);
                    String date = rs.getString(4);
                    String bn = rs.getString(5);
                    int ip = Integer.parseInt(rs.getString(7));
                    int price = ip * nop;
                    session.setAttribute("bid", id);
                    session.setAttribute("bsd", sd);
                    session.setAttribute("bad", ad);
                    session.setAttribute("date", date);
                    session.setAttribute("ppl",nop);
                    session.setAttribute("bn", bn);
                    session.setAttribute("sno",sno);
                    session.setAttribute("bprice", price);
                    response.sendRedirect("bookBus.jsp?id=" + id + "&sd=" + sd + "&ad=" + ad + "&date=" + date + "&bn=" + bn + "&price=" + price);
                }else {
                    pr.println("<script>alert('No Bus Available');window.location.href='busticketbooker.jsp';</script>");
                }
        } catch (Exception e) {
            pr.println("<h1 style='font-size:70px; color:red; text-align:center;'>Error 404!</h1>");
            e.printStackTrace();
        }
    }
}