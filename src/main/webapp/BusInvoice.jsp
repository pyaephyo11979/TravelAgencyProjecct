<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>BusInvoice</title>
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
            <h1 class="text-center display-3">BusTicket Invoice</h1>
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
                    <h2 class="fs-5"><%=request.getParameter("nm")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("em")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("ph")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("nrc")%></h2>
                    <h2 class="fs-5"><%=request.getParameter("invoiceNum")%></h2>
                </div>
            </div>
        </div>
        <div class="col-12" style="margin-top:100px;">
            <table>
                <tr>
                    <th>BusName</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Date</th>
                    <th>Price</th>
                </tr>
                <tr>
                    <td><%=request.getParameter("bn")%></td>
                    <td><%=request.getParameter("bsd")%></td>
                    <td><%=request.getParameter("bad")%></td>
                    <td><%=request.getParameter("date")%></td>
                    <td><%=request.getParameter("price")%></td>
                </tr>
            </table>
        </div>
        <div class="col-12 mt-2 container">
            <h4 class="fs-2">Terms and Conditions</h4>
            <ul>
                <li>The Ticket is not refundable.</li>
                <li>Passenger can carry up to 50kg of handheld and lagguage.</li>
                <lI>If there any problems occur,the decision of the TravelRelax is always right.</lI>
            </ul>
        </div>
        <div class="text-end mt-3">
            <button id="pbtn" class="btn btn-secondary">PrintInvoice</button>
            <a class="btn btn-info" id="backbtn" href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>">Continue Browsing</a>
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
    document.getElementById("pbtn").addEventListener("click",function (){
        window.print();
    })
</script>
</html>