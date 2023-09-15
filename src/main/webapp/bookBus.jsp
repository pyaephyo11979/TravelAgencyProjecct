<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        table,th,td{
            border: 1px solid darkgoldenrod;
            border-collapse: collapse;
        }
        th{
            font-weight: bolder;
        }
        td{
            font-weight:bold;
        }
        table{
            background:linear-gradient(45deg, rgba(220, 215, 148, 0.86), rgba(252, 252, 252, 0.84));

        }
        th,td{
            padding: 10px;
        }
        body{
            background-image: url("assets/buschobg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
    <title>BUS</title>
</head>
<body>
<%
    Connection con;
    String id=request.getParameter("id");
    String sd=request.getParameter("sd");
    String ad=request.getParameter("ad");
    String sql;
    Statement stmt;
    ResultSet rs;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
        sql="select*from bus where sd='"+sd+"' and ad='"+ad+"'";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        HttpSession sec=request.getSession();
        int qty= (int) sec.getAttribute("ppl");
%>
<div class="container mt-4">
    <form action="BusSelectedServlet" style="margin-top:140px; " class="container  " method="post">
    <table class="mt-4 container">
        <tr>
            <th colspan="6">Bus Matches Your Requirements</th>
        </tr>
        <tr>
            <th>StartDestination</th>
            <th>ArrivalDestination</th>
            <th>BusName</th>
            <th>Date</th>
            <th>Price</th>
            <th>Check</th>
        </tr>
        <% while (rs.next()){
            int pP=Integer.parseInt(rs.getString(7));
            int price=pP*qty;
        %>
        <tr>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=price%></td>
            <td><input type="checkbox" name="bid" value="<%=rs.getString(1)%>">Buy</td>
        </tr>
        <%}%>
        <tr>
            <td colspan="6"><input type="submit" class="btn btn-info" value="BuyNow"></td>
        </tr>
    </table>
    </form>
</div>
<%
    }catch (Exception e){
        e.printStackTrace();
    }
%>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>