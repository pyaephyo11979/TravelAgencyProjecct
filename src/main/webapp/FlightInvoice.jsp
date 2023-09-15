<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>FlightInvoice</title>
    <style>
        table{
            width:1000px;
            height:120px;
            text-align:center;
        }
        table,tr,th,td{
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<% HttpSession sec=request.getSession(); %>
<div class="" style="width:100%; background:linear-gradient(108deg,lightblue,lightgreen);">
    <h1 class="fs-3 text-white p-2">TravelRelaxCo.ltd</h1>
</div>
<div class="container">
    <div class="row">
        <div class="col-12 mt-2">
            <h1 class="text-center display-3">FlightTicket Invoice</h1>
        </div>
        <div class="col-12 mt-3">
            <div class="row">
                <div class="col-2">
                        <h2 class="fs-5">Name:</h2>
                        <h2 class="fs-5">Email:</h2>
                        <h2 class="fs-5">Phone:</h2>
                        <h2 class="fs-5">NRC:</h2>
                    <h2 class="fs-5">InvoiceNo:</h2>
                </div>
                <div class="col-4">
                    <h2 class="fs-5"><%=request.getParameter("name")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("email")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("phone")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("nrc")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("ivn")%></h2>
                </div>
            </div>
        </div>
        <div class="col-12 " style="margin-top:160px;">
        <table>
            <tr>
               <th>FlightName</th>
                <th>From</th>
                <th>To</th>
                <th>DepatureTime</th>
                <th>Date</th>
                <th>Price</th>
                <th>FlightNumber</th>
                <th>Passengers</th>
            </tr>
            <tr>
                <td><%=request.getParameter("fn")%></td>
                <td><%=request.getParameter("sd")%></td>
                <td><%=request.getParameter("ad")%></td>
                <td><%=sec.getAttribute("ft")%></td>
                <td><%=request.getParameter("dt")%></td>
                <td><%=request.getParameter("tp")%></td>
                <td><%=request.getParameter("fno")%></td>
                <td><%=request.getParameter("qty")%></td>
            </tr>
        </table>
        </div>
        <div style="margin-top:150px;" class="col-12 container">
            <h4 class="fs-2">Terms and Conditions</h4>
            <ul>
                <li>Passenger must be at the airport 2 hours before the flight time.</li>
                <li>The Ticket is not refundable.</li>
                <li>Passenger can carry up to 20kg of handheld and lagguage.</li>
                <lI>If there any problems occur,the decision of the TravelRelax is always right.</lI>
            </ul>
        </div>
        <div class="text-end mt-3">
            <button id="pbtn" class="btn btn-secondary">PrintInvoice</button>
            <a id="backbtn" class="btn btn-info" href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>">Continue Browsing</a>
        </div>
    </div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    document.getElementById("pbtn").addEventListener("click", function () {
        window.print();
    })
</script>
</html>