<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>FlightSelect</title>
    <style>
        table,td,th{
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
        body{
            background-color: wheat;
        }
        #bg{
            padding:40px;
        }
        #flightCard{
            margin-top:20px;
            margin-bottom: 10px;
            box-shadow: 15px 12px 20px 5px rgba(0,0,0,0.2);
        }
        .ht{
            background-color: wheat;
        }
    </style>
</head>
<body>
<h4 class="text-center sticky-top ht display-3">Flights  Matches Your Requirements</h4>
<%
    HttpSession sec=request.getSession();
    String sd=request.getParameter("sd");
    String ad=request.getParameter("ad");
    String date=request.getParameter("dt");
    PreparedStatement pstmt;
    Connection con;
    ResultSet rs;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
        pstmt=con.prepareStatement("select * from flight where SD=? and AD=? and Date=?");
        pstmt.setString(1,sd);
        pstmt.setString(2,ad);
        pstmt.setString(3,date);
        rs=pstmt.executeQuery();

%>
<div id="bg" class="container d-flex flex-column justify-content-center">
    <% while (rs.next()){ int ip=Integer.parseInt(rs.getString(10)); int qty= (int) sec.getAttribute("qty"); int price=ip*qty; %>
    <div class="card  rounded-3" id="flightCard" style="width:800px;">
        <div class="card-body container row" style="">
            <div class="col-2">
                <p class=" fw-bold">From <i class="fas fa-plane-departure"></i></p><br>
                <p><%=rs.getString(2)%></p>
            </div>
            <div class="col-2">
                <br>
                <i class="fas fa-arrow-right"></i>
            </div>
            <div class="col-2">
                <p class=" fw-bold">To <i class="fas fa-plane-arrival"></i></p><br>
                <p><%=rs.getString(4)%></p>
            </div>
            <div class="col-2">
                <p class=" fw-bold">FlightName</p><br>
                <p><%=rs.getString(6)%></p>
            </div>
            <div class="col-2">
                <p class=" fw-bold">Departure Time <i class="fas fa-clock"></i></p><br>
                <p><%=rs.getString(8)%></p>
            </div>
            <div class="col-2">
                <p class="text-success fw-bold fs-5"><%=price%> MMK</p><br>
                <a class="btn btn-primary" href="FlightSelectServlet?fid=<%=rs.getString(1)%>">Select</a>
            </div>
<%--                <table>--%>
<%--                    <tr>--%>
<%--                        <th>From</th>--%>
<%--                        <th>To</th>--%>
<%--                        <th>FlightName</th>--%>
<%--                        <th>Departure Date</th>--%>
<%--                        <th>Departure Time</th>--%>
<%--                        <th>Price</th>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td> <%=rs.getString(2)%> </td>--%>
<%--                        <td> <%=rs.getString(4)%> </td>--%>
<%--                        <td> <%=rs.getString(6)%> </td>--%>
<%--                        <td> <%=rs.getString(7)%> </td>--%>
<%--                        <td> <%=rs.getString(8)%> </td>--%>
<%--                        <td> <%=price%> </td>--%>
<%--                        <td ><a class="btn btn-primary" href="FlightSelectServlet?fid=<%=rs.getString(1)%>">Select</a></td>--%>
<%--                    </tr>--%>
<%--                </table>--%>
        </div>
    </div>
        <% } %>
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