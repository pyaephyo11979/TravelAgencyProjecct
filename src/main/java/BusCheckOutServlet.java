import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.*;

@WebServlet(name = "BusCheckOutServlet", value = "/BusCheckOutServlet")
public class BusCheckOutServlet extends HttpServlet {
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
        HttpSession sc=request.getSession();
        PrintWriter pw = response.getWriter();
        String name = request.getParameter("ne");
        String email=request.getParameter("em");
        String phone=request.getParameter("ph");
        String nrc=request.getParameter("nrc");
        String price=request.getParameter("price");
        Date date=Date.valueOf(request.getParameter("date"));
        String bsd=request.getParameter("bsd");
        String bad=request.getParameter("bad");
        int nos= (int) sc.getAttribute("ppl");
        int sno= (int) sc.getAttribute("sno");
        int ns=sno-nos;
        String bn=request.getParameter("bnm");
        int bid= (int) sc.getAttribute("bid");
        int invoiceNum = (int)Math.floor(Math.random()*(999999-100000+1)+100000);
        PreparedStatement pstmt;
        ResultSet rs;
        int i;
        Connection con;
        //forEmail
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
            pstmt=con.prepareStatement("insert into busclient(name,email,Ph,bid,sd,ad,bname,date,tprice,invoiceNum,ppls) values(?,?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1,name);
            pstmt.setString(2,email);
            pstmt.setString(3,phone);
            pstmt.setInt(4,bid);
            pstmt.setString(5,bsd);
            pstmt.setString(6,bad);
            pstmt.setString(7,bn);
            pstmt.setDate(8,date);
            pstmt.setString(9,price);
            pstmt.setInt(10,invoiceNum);
            pstmt.setInt(11,nos);
            i=pstmt.executeUpdate();
            Message message = new MimeMessage(sec);
            message.setFrom(new InternetAddress("pyaephyohlaing2kk3@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Booking Confirmation");
            message.setContent("<style> table,th,tr,td{ border: 1px solid black; border-collapse: collapse; } </style><body><h1>Booking Confirmation</h1><br><h3>Dear " + name + ",</h3><br><p>Thank you for your order! Your ticket booking has been confirmed.</p><br><table style='border:2px solid black; border-collapse:collapse;'><tr><th>BusName</th><th>From</th><th>To</th><th>Date</th><th>Price</th><th>InvoiceNo.</th></tr><tr><td>"+bn+"</td><td>"+bsd+"</td><td>"+bad+"</td><td>"+date+"</td><td>"+price+"</td><td>"+invoiceNum+"</td></tr></table></body>", "text/html");
            Transport.send(message);
            if(i>0) {
                String sql="select*from busclient where name='"+name+"' and bid='"+bid+"'";
                PreparedStatement pstmt2=con.prepareStatement("update bus set sno=? where id=?");
                pstmt2.setInt(1,ns);
                pstmt2.setInt(2,bid);
                pstmt2.executeUpdate();
                pstmt2.close();
                Statement stmt=con.createStatement();
                rs=stmt.executeQuery(sql);
                while (rs.next()){
                    String nm=rs.getString(2);
                    String em=rs.getString(4);
                    String ph=rs.getString(3);
                    String bsd1=rs.getString(5);
                    String bad1=rs.getString(6);
                    String bn1=rs.getString(7);
                    String date1=rs.getString(8);
                    String price1=rs.getString(10);
                    sc.setAttribute("nm",nm);
                    sc.setAttribute("em",em);
                    sc.setAttribute("ph",ph);
                    sc.setAttribute("bsd",bsd1);
                    sc.setAttribute("bad",bad1);
                    sc.setAttribute("bn",bn1);
                    sc.setAttribute("date",date1);
                    sc.setAttribute("price",price1);
                    response.sendRedirect("BusInvoice.jsp?nm="+nm+"&em="+em+"&ph="+ph+"&bsd="+bsd1+"&bad="+bad1+"&bn="+bn1+"&date="+date1+"&price="+price1+"&invoiceNum="+invoiceNum+"&nrc="+nrc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}