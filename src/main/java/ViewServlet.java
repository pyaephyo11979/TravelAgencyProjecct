import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.sql.*;
import java.sql.DriverManager;

@WebServlet(name = "ViewServlet", value = "/ViewServlet")
public class ViewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pr=response.getWriter();
        String name=request.getParameter("usname");
        String password=request.getParameter("psw");
        Connection con;
        Statement stmt;
        ResultSet rs;
        boolean result=false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
            String sql="select*from admin where username='"+name+"'and password='"+password+"'";
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            while (rs.next()){
                result=true;
            }
            stmt.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        if(result){
            response.sendRedirect("dashboard.jsp");
        }else {
            RequestDispatcher rp=request.getRequestDispatcher("admin.jsp");
            pr.println("<p class='text-center w3-text-red' color='red'>Invalid Username or Password!</p>");
            rp.include(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}