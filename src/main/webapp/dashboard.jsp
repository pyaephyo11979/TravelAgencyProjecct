<%--
  Created by IntelliJ IDEA.
  User: pyaep
  Date: 26/08/2023
  Time: 02:33 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.*" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css" integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css" integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
    <title>AdminControlPanel</title>
    <style>
        table,td,th{
            border: 1px solid black;
            border-collapse: collapse;
        }
        body{
            max-width: 1500pc;
        }
    </style>
</head>
<body>
<%--<h4 class="text-center display-2">AD Control Panel</h4>--%>
<%-- <div class="row">--%>
<%--     <div class="col-4">--%>
<%--         <div class="card" style="width:310px;" >--%>
<%--             <p class="card-header">AirTicketDB</p>--%>
<%--             <div class="card-body d-flex justify-content-center " style="width:300px;">--%>

<%--                 <a href="flightticket.jsp"><img class="img-fluid card-img" src="assets/flight.jpg" style="width: 100%;"></a>--%>
<%--             </div>--%>
<%--         </div>--%>
<%--     </div>--%>
<%--     <div class="col-4">--%>
<%--         <div class="card" style="width: 310px;" >--%>
<%--             <p class="card-header">BusTicketDB</p>--%>
<%--             <div class="card-body d-flex justify-content-center" style="width:300px;">--%>
<%--                 <a href="busticket.jsp"><img class="img-fluid card-img" src="assets/busticket.jpg" style="width:100%;"></a>--%>
<%--             </div>--%>
<%--         </div>--%>
<%--     </div>--%>
<%--     <div class="col-4">--%>
<%--         <div class="card" style="width: 310px;">--%>
<%--             <p class="card-header">HotelBookingDB</p>--%>
<%--             <div class="card-body d-flex justify-content-center" style="width: 300px;">--%>
<%--                 <a href="hotelbooking.jsp"><img class="img-fluid card-img" src="assets/hotelbooking.jpg" style="width:100%;"></a>--%>
<%--             </div>--%>
<%--         </div>--%>
<%--     </div>--%>
<%-- </div>--%>
<%--<div class="m-2">--%>
<%--   <a class="btn btn-info">Show available flights</a>--%>
<%--</div>--%>
<%--<div class="m-2">--%>
<%--    <a class="btn btn-info">Show available Buses</a>--%>
<%--</div>--%>
<%--<div class="m-2">--%>
<%--    <a class="btn btn-info">Show FlightTickets</a>--%>
<%--</div>--%>
<%--<div class="mt-2 ms-3">--%>
<%--    <a class="btn btn-primary" href="adminaddandremove.jsp">Add Or Remove Admins</a>--%>
<%--</div>--%>
<%HttpSession sec=request.getSession();%>
<div class="container-fluid">
    <header class="row bg-white sticky-top">
        <nav class="navbar navbar-expand">
            <div class="navbar-brand ms-2">Admin</div>
            <div class="flex-fill"></div>
            <ul class="navbar-nav me-2">
                <li class="nav-item"><div class="dropdown">
                    <a data-bs-toggle="dropdown" class="nav-link dropdown fs-4"><i class="fas fa-user-circle"></i></a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>" class="dropdown-item" >Logout</a>
                    </div>
                </div></li>
            </ul>
        </nav>
    </header>
    <section class="container-fluid">
        <div class="row">
            <div class="col-2">
                <div class="list-group mt-2 border-2 text-center ">
                    <span class="list-group-item disabled ">Controls</span>
                    <a   id="homeBtn" style="cursor: pointer;" class="list-group-item text-lg-start text-decoration-none list-group-item-action ">
                        <i class="fas fa-home"></i>
                        <span class="d-none d-lg-inline">Dashboard</span>
                    </a>
                    <a   id="busBtn" style="cursor: pointer" class="list-group-item text-decoration-none text-lg-start text-center list-group-item-action">
                        <i class="fas fa-bus"></i>
                        <span class="d-none d-lg-inline">BUS</span>
                    </a>
                    <a   id="flightBtn" style="cursor: pointer" class="list-group-item text-decoration-none text-lg-start text-center list-group-item-action">
                        <i class="fas fa-plane"></i>
                        <span class="d-none d-lg-inline">Flight</span>
                    </a>
                </div>
                <div class="list-group mt-4 border-2 text-center">
                    <span class="list-group-item disabled">User Management</span>
                    <a  style="cursor: pointer;" id="showFPBtn" class="list-group-item text-center text-lg-start list-group-item-action">
                        <i class="fas fa-plane"></i>
                        <span class="d-none d-lg-inline">Show Flight Passengers</span>
                    </a>
                    <a  style="cursor: pointer;" id="showBPBtn" class="list-group-item text-center text-lg-start list-group-item-action">
                        <i class="fas fa-bus"></i>
                        <span class="d-none d-lg-inline">Show Bus Passengers</span>
                    </a>
                    <a href="#" id="adminManageBtn" style="cursor: pointer;" class="list-group-item text-center text-lg-start list-group-item-action">
                        <i class="fas  fa-screwdriver-wrench"></i>
                        <span class="d-none d-lg-inline">AdminManager</span>
                    </a>
                    <a href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>" id="goHome" class="list-group-item text-center text-lg-sart list-group-item-action">
                        <i class="fas fa-arrow-left"></i>
                        <span class="d-none d-lg-inline">BackToMainPage</span>
                    </a>
                </div>
            </div>
            <div class="col-8">
                <div class="row flex-column flex-lg-row "  id="Dashboard">
                    <div class="row d-flex flex-row ">
                        <span class="fs-2 text-secondary">Quick Stats</span>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <span class="fs-4  d-block">Weekly Visitors</span>
                                    <span class="fs-5 text-primary d-block"><i class="fas fa-line-chart w3-text-amber"></i> 1000</span>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <span class="fs-4  d-block">Monthly Visitors</span>
                                    <span class="fs-5 text-primary d-block"><i class="fas fa-line-chart w3-text-amber"></i> 13000</span>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <span class="fs-4  d-block">Yearly Visitors</span>
                                    <span class="fs-5 text-primary d-block"><i class="fas fa-line-chart w3-text-amber"></i> 1450000</span>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <span class="fs-4  d-block">EarlyAcces Visitors</span>
                                    <span class="fs-5 text-primary d-block"><i class="fas fa-line-chart w3-text-amber"></i> 1M</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-2 mt-2">
                        <div class="col-6">
                            <canvas id="myChart1"></canvas>
                        </div>
                        <div class="col-6">
                            <canvas id="myChart2"></canvas>
                        </div>
                    </div>
                </div>
                <div  id="busDb">
                    <div class="container-fluid">
                        <h2 class="text-center display-3">BusTicketModifier</h2>
                        <form name="addticket" id="addticket" method="post" action="BusTicketAdd" style="width: 500px;">
                            <h2 class="fs-4">Add Bus</h2>
                            <div class="row">
                                <div class="mt-2 form-floating">
                                    <input type="text" name="asdn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterStartDestination</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="aadn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterFinalDestination</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="bn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterBusName</label>
                                </div>
                                <div class=" mt-2">
                                    <input type="date" name="dt" class="form-control" >
                                </div>
                                <div class=" mt-2">
                                    <input type="text" name="pr" class="form-control" placeholder="EnterPrice">
                                </div>
                                <div class="form-floating mt-2">
                                    <input type="text" name="nos" class="form-control" placeholder="EnterAvailableSeats">
                                    <label>EnterAvailableSeats</label>
                                </div>
                            </div>
                            <button type="submit" class="btn mt-2 btn-primary">AddBus</button>
                        </form>
                        <form name="addticket" id="" class="mt-3" method="post" action="BusTicketRemove" style="width:500px;">
                            <h2 class="fs-4">Remove Bus</h2>
                            <div class="row">
                                <div class="mt-2 form-floating">
                                    <input type="text" name="rsdn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterStartDestination</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="radn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterFinalDestination</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="bn" class="form-control" placeholder="EnterStartDestination">
                                    <label >EnterBusName</label>
                                </div>
                                <div class=" mt-2 ">
                                    <input type="date" class="form-control" name="dt">
                                </div>
                            </div>
                            <button type="submit" class="btn mt-2 btn-danger">RemoveBus</button>
                        </form>
                    </div>
                    <div class="container-fluid">
                        <div class="mt-2">
                            <a href="#buses" class="btn mb-1 btn-info" data-bs-toggle="collapse">Show available Buses</a>
                        </div>
                        <div id="buses" class="mt-2 mb-3 collapse">
                            <%
                                Connection c;
                                Statement s;
                                ResultSet result;
                                try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    c=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
                                    s=c.createStatement();
                                    String sql2="select * from bus";
                                    result=s.executeQuery(sql2);
                            %>
                            <table>
                                <tr>
                                    <th>ID</th>
                                    <th>StartDestination</th>
                                    <th>FinalDestination</th>
                                    <th>Date</th>
                                    <th>Busname</th>
                                    <th>AvailableSeats</th>
                                    <th>Price</th>
                                </tr>
                                <%while(result.next()){ %>
                                <tr>
                                    <td><%=result.getString(1)%></td>
                                    <td><%=result.getString(2)%></td>
                                    <td><%=result.getString(3)%></td>
                                    <td><%=result.getString(4)%></td>
                                    <td><%=result.getString(5)%></td>
                                    <td><%=result.getString(6)%></td>
                                    <td><%=result.getString(7)%></td>
                                </tr>
                                <%}%>
                            </table>
                            <%}catch(Exception e){e.printStackTrace();}%>
                        </div>
                </div>
                </div>
                <div  id="flightDb">
                    <div class="container-fluid">
                        <h2 class="text-center display-3">FlightTicketModifier</h2>
                        <form name="addticket" id="addticket" method="post" action="FlightTicketAddServlet" style="width:500px;">
                            <h2 class="fs-4">Add Flight</h2>
                            <div class="row">
                                <div class="mt-2 form-floating">
                                    <input type="text" name="asdn" class="form-control" placeholder="Enter Start Destination">
                                    <label>Enter Start Destination</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="asidn" class="form-control" placeholder="Enter Start Destination ID">
                                    <label>Enter Start Destination ID</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="aadn" class="form-control" placeholder="Enter Start Destination">
                                    <label>Enter Final Destination </label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="aadidn" class="form-control" placeholder="Enter Final Destination">
                                    <label>Enter Final Destination ID</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="fn" placeholder="enter Flight Name" class="form-control" >
                                    <label>Enter Flight Name</label>
                                </div>
                                <div class=" mt-2">
                                    <input type="date" name="dt" class="form-control" >
                                </div>
                                <div class=" mt-2 ">
                                    <input type="time" name="ft" class="form-control" placeholder="EnterFlightTIme">
                                </div>
                                <div class=" mt-2 ">
                                    <input type="text" name="pr" class="form-control" placeholder="EnterPrice">
                                </div>
                                <div class=" mt-2 ">
                                    <input type="text" name="qty" class="form-control" placeholder="EnterAvailableSeats">
                                </div>
                                <div class=" mt-2 ">
                                    <input type="text" name="FNO" class="form-control" placeholder="EnterFlihgtNumber">
                                </div>
                            </div>
                            <button type="submit" class="btn mt-2 btn-primary">AddFlight</button>
                        </form>
                        <form name="removeticket"  class="mt-3 " method="post" action="FlightTicketRemove" style="width:500px;">
                            <h2 class="fs-4">Remove Flight</h2>
                            <div class="row">
                                <div class="mt-2 form-floating">
                                    <input type="text" name="rsidn" class="form-control" placeholder="Enter Final Destination">
                                    <label>Enter Start Destination ID</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="raidn" class="form-control" placeholder="Enter Final Destination">
                                    <label>Enter Final Destination ID</label>
                                </div>
                                <div class="mt-2 form-floating">
                                    <input type="text" name="fn" placeholder="enter Flight Name" class="form-control" >
                                    <label>Enter Flight Name</label>
                                </div>
                                <div class=" mt-2 ">
                                    <input type="date" class="form-control" name="dt">
                                </div>
                                <div class=" mt-2 ">
                                    <input type="time" class="form-control" name="ft">
                                </div>
                            </div>
                            <button type="submit" class="btn mt-2 btn-danger">RemoveFlight</button>
                        </form>
                        <div class="mt-2 ">
                            <a href="#flights" class="btn mb-1 btn-info" data-bs-toggle="collapse">Show available flights</a>
                        </div>
                        <div id="flights" class="mt-2 mb-3 collapse">
                            <%
                                Connection cn;
                                Statement st;
                                ResultSet rset;
                                try{
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    cn=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
                                    st=cn.createStatement();
                                    String sql="select * from flight";
                                    rset=st.executeQuery(sql);
                            %>
                            <table>
                                <tr>
                                    <th>ID</th>
                                    <th>StartDestination</th>
                                    <th>StartDestinationID</th>
                                    <th>FinalDestination</th>
                                    <th>FinalDestinationID</th>
                                    <th>FlightName</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>AvailableSeats</th>
                                    <th>Price</th>
                                </tr>
                                <%while(rset.next()){ %>
                                <tr>
                                    <td><%=rset.getString(1)%></td>
                                    <td><%=rset.getString(2)%></td>
                                    <td><%=rset.getString(3)%></td>
                                    <td><%=rset.getString(4)%></td>
                                    <td><%=rset.getString(5)%></td>
                                    <td><%=rset.getString(6)%></td>
                                    <td><%=rset.getString(7)%></td>
                                    <td><%=rset.getString(8)%></td>
                                    <td><%=rset.getString(9)%></td>
                                    <td><%=rset.getString(10)%></td>
                                </tr>
                                <%}%>
                            </table>
                            <%}catch(Exception e){e.printStackTrace();}%>
                        </div>
                    </div>
                </div>
                <div id="adminManage">
                    <div class="container">
                        <h1 class="text-center display-3">Add or Remove Admin</h1>
                        <div id="addAdm" class=" mt-2" style="width:500px;">
                            <form action="adminAdderServlet" method="post">
                                <h4 class="text-center fs-1">AddAdmin</h4>
                                <div class="form-floating mt-1">
                                    <input type="email" class="form-control" name="usname" placeholder="EnterUsername">
                                    <label>Enter the Username of admin you want to add</label>
                                </div>
                                <div class="form-floating mt-1">
                                    <input type="password" class="form-control" name="psw" placeholder="enterpasword">
                                    <label>Enter Password</label>
                                </div>
                                <button class="btn btn-primary mt-2" type="submit">Add Admin</button>
                            </form>
                        </div>
                        <div id="removeAdm" class="mt-3 " style="width:500px;">
                            <h4 class="text-center fs-2">RemoveAdmin</h4>
                            <form action="adminRemoverServlet" method="post">
                                <div class="form-floating mt-1">
                                    <input type="text" name="usname" placeholder="EnterUsername" class="form-control">
                                    <label>Enter the username of admin you want to remove</label>
                                </div>
                                <button class="btn btn-danger mt-2" type="submit">Remove Admin</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="FP" class="container">
                    <h4 class="display-4 text-center mt-4">Flight Passengers</h4>
                    <%
                        Connection con;
                        Statement stmt;
                        ResultSet rs;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
                            stmt=con.createStatement();
                            String sql="select * from ftclient";
                            rs=stmt.executeQuery(sql);

                    %>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>NRC</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>From</th>
                            <th>To</th>
                            <th>FlightName</th>
                            <th>Date</th>
                            <th>FlightID</th>
                            <th>Price</th>
                            <th>InvoiceNo</th>
                            <th>Passenger</th>
                        </tr>
                        <% while(rs.next()){%>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(9)%></td>
                            <td><%=rs.getString(10)%></td>
                            <td><%=rs.getString(11)%></td>
                            <td><%=rs.getString(12)%></td>
                            <td><%=rs.getString(13)%></td>
                        </tr>
                        <%}%>
                    </table>
                    <%}catch(Exception e){e.printStackTrace();}%>
                </div>
                <div id="BP" class="container">
                    <h4 class="display-4 text-center mt-4">Bus Passengers</h4>
                    <%
                        Connection con1;
                        Statement stmt1;
                        ResultSet rs1;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            con1=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
                            stmt1=con1.createStatement();
                            String sql1="select * from busclient";
                            rs1=stmt1.executeQuery(sql1);

                    %>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>From</th>
                            <th>To</th>
                            <th>BusName</th>
                            <th>Date</th>
                            <th>BusID</th>
                            <th>Price</th>
                            <th>InvoiceNo</th>
                            <th>Passenger</th>
                        </tr>
                        <%while (rs1.next()){%>
                        <tr>
                            <td><%=rs1.getString(1)%></td>
                            <td><%=rs1.getString(2)%></td>
                            <td><%=rs1.getString(3)%></td>
                            <td><%=rs1.getString(4)%></td>
                            <td><%=rs1.getString(5)%></td>
                            <td><%=rs1.getString(6)%></td>
                            <td><%=rs1.getString(7)%></td>
                            <td><%=rs1.getString(8)%></td>
                            <td><%=rs1.getString(9)%></td>
                            <td><%=rs1.getString(10)%></td>
                            <td><%=rs1.getString(11)%></td>
                            <td><%=rs1.getString(12)%></td>
                        </tr>
                        <%}%>
                    </table>
                    <%}catch(Exception e){e.printStackTrace();}%>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js" integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js" integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.js" integrity="sha512-6LKCH7i2+zMNczKuCT9ciXgFCKFp3MevWTZUXDlk7azIYZ2wF5LRsrwZqO7Flt00enUI+HwzzT5uhOvy6MNPiA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.js" integrity="sha512-6HrPqAvK+lZElIZ4mZ64fyxIBTsaX5zAFZg2V/2WT+iKPrFzTzvx6QAsLW2OaLwobhMYBog/+bvmIEEGXi0p1w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script><%@include file="script.js"%></script>
<script>
    const ctx = document.getElementById('myChart1');
    const ctx2 = document.getElementById('myChart2');
    new Chart(ctx,{
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets: [{
                label: 'Total Bus Tickets Sold',
                data: [12, 19, 3, 5, 2, 3],
                borderwidth: 1,
            }]
        },
        options: {
            animations:{
                tension:{
                    duration:1000,
                    easing:'easeInQuad',
                    from:1,
                    to:0,
                    loop:true
                }
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    })
    new Chart(ctx2,{
        type:'bar',
        data:{
            labels:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
            datasets:[{
                label:'Total Flight Tickets Sold',
                data:[12, 19, 3, 5, 2, 3],
                borderwidth:1,
                backgroundColor:[
                    'red',
                    'blue',
                    'green',
                    'yellow',
                    'orange',
                    'purple'
                ],
            }]
        },
        options:{
            scales:{
                y:{
                    beginAtZero:true
                }
            }
        }
    })
</script>
</html>
