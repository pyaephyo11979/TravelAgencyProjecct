import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;

import jakarta.servlet.*;

@WebServlet(name = "HotelReservationDB", value = "/HotelReservationDB")
public class HotelReservationDB extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String made_by = "onlineBooking";
        String status = request.getParameter("status");
        Date dateIn =Date.valueOf(request.getParameter("dIn"));
        Date dateOut = Date.valueOf(request.getParameter("dOut"));
        int cID = Integer.parseInt(request.getParameter("cID"));
        PreparedStatement ps;
        Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/hoteldb", "root", "root");
            ps = con.prepareStatement("insert into reservation (date_in,date_out,status,made_by,guest_id) values(?,?,?,?,?)");
            ps.setDate(1, dateIn);
            ps.setDate(2, dateOut);
            ps.setString(3, status);
            ps.setString(4, made_by);
            ps.setInt(5, cID);
            int i = ps.executeUpdate();
            if(i>0){
                pw.println("Reservation made successfully");
                pw.println("<br><a href='hotelbooking.jsp'>Go Back..</a>");
            }
            else {
                pw.println("Reservation failed");
                pw.println("<br><a href='hotelbooking.jsp'>Try Again..</a>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}