import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.util.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.MessagingException;

@WebServlet(name = "FlightCheckoutSevlet", value = "/FlightCheckoutSevlet")
public class FlightCheckoutServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        PrintWriter pr=response.getWriter();
        String name=request.getParameter("name");
        String nrc=request.getParameter("nrc");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String sd=request.getParameter("sd");
        String FNO= session.getAttribute("fno").toString();
        int qty= (int) session.getAttribute("qty");
        String ad=request.getParameter("ad");
        String fn= (String) session.getAttribute("fn");
        Date dt=Date.valueOf(request.getParameter("date"));
        int np=Integer.parseInt(request.getParameter("price"));
        int invoiceNum = (int)Math.floor(Math.random()*(999999-100000+1)+100000);
        int fid= (int) session.getAttribute("fid");
        int tp=np*qty;
        String price=request.getParameter("price");
        PreparedStatement pstmt;
        Statement stmt;
        ResultSet rs;
        String sql;
        Connection con;
        //Email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session sec = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("pyaephyohlaing2kk3@gmail.com", "snqidcodnhfbpghl");
                    }
                });

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
            pstmt = con.prepareStatement("insert into ftclient(name,nrc,email,sd,ad,FName,Date,TPrice,fid,Ph,InvoiceNo,person,flight_No) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, name);
            pstmt.setString(2, nrc);
            pstmt.setString(3, email);
            pstmt.setString(4, sd);
            pstmt.setString(5, ad);
            pstmt.setString(6, fn);
            pstmt.setDate(7, dt);
            pstmt.setString(8, price);
            pstmt.setInt(9, fid);
            pstmt.setString(10, phone);
            pstmt.setInt(11, invoiceNum);
            pstmt.setInt(12, qty);
            pstmt.setString(13, FNO);
            int i = pstmt.executeUpdate();

            if (i > 0) {
                Message message = new MimeMessage(sec);
                message.setFrom(new InternetAddress("pyaephyohlaing2kk3@gmail.com"));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                message.setSubject("Booking Confirmation");
                message.setContent("<style> table,th,tr,td{ border: 1px solid black; border-collapse: collapse; } </style><h1>Booking Confirmation</h1><br><h3>Dear " + name + ",</h3><br><p>Thank you for your order! Your ticket booking has been confirmed.</p><br><table><tr><th>FlightName</th><th>From</th><th>To</th><th>DepartureTime</th><th>Date</th><th>Price</th><th>InvoiceNumber</th><th>FLightNumber</th></tr><tr><td>"+fn+"</td><td>"+sd+"</td><td>"+ad+"</td><td>"+session.getAttribute("ft")+"</td><td>"+dt+"</td><td>"+price+"</td><td>"+invoiceNum+"</td><td>"+FNO+"</td></tr></table>", "text/html");
                Transport.send(message);
                sql = "select*from ftclient where Name='" + name + "' and Fid='" + fid + "'";
                String sql2 = "select*from flight where id=" + fid;
                Statement stm2 = con.createStatement();
                ResultSet rs2 = stm2.executeQuery(sql2);
                int afqty = 0;
                while (rs2.next()) {
                    afqty = rs2.getInt(9) - qty;
                }
                PreparedStatement pstmt1 = con.prepareStatement("update flight set qty=? where id=?");
                pstmt1.setInt(2, fid);
                pstmt1.setInt(1, afqty);
                pstmt1.executeUpdate();
                stmt = con.createStatement();
                rs = stmt.executeQuery(sql);
                //email

                while (rs.next()) {
                    int pid = rs.getInt(1);
                    PreparedStatement psm = con.prepareStatement("select*from ftclient where id=? and InvoiceNo=?");
                    psm.setInt(1, pid);
                    psm.setInt(2, invoiceNum);
                    ResultSet r = psm.executeQuery();
                    int pri = 0;
                    while (r.next()) {
                        pri = Integer.parseInt(r.getString(11));
                    }
                    String nm = rs.getString(2);
                    String nc = rs.getString(3);
                    String em = rs.getString(5);
                    String ph = rs.getString(4);
                    String sD = rs.getString(6);
                    String aD = rs.getString(7);
                    String fN = session.getAttribute("fn").toString();
                    String dT = String.valueOf(rs.getDate(9));
                    int ivn = rs.getInt(12);
                    response.sendRedirect("FlightInvoice.jsp?name=" + nm + "&nrc=" + nc + "&email=" + em + "&phone=" + ph + "&sd=" + sD + "&ad=" + aD + "&fn=" + fN + "&dt=" + dT + "&tp=" + price + "&ivn=" + ivn+"&qty="+qty+"&fno="+FNO);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}