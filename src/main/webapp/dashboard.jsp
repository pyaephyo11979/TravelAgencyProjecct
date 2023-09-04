<%--
  Created by IntelliJ IDEA.
  User: pyaep
  Date: 26/08/2023
  Time: 02:33 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css" integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css" integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
    <title>AdminControlPanel</title>
</head>
<body>
<h4 class="text-center display-2">AD Control Panel</h4>
 <div class="row">
     <div class="col-4">
         <div class="card" style="width:310px;" >
             <p class="card-header">AirTicketDB</p>
             <div class="card-body d-flex justify-content-center " style="width:300px;">

                 <a href="flightticket.jsp"><img class="img-fluid card-img" src="assets/flight.jpg" style="width: 100%;"></a>
             </div>
         </div>
     </div>
     <div class="col-4">
         <div class="card" style="width: 310px;" >
             <p class="card-header">BusTicketDB</p>
             <div class="card-body d-flex justify-content-center" style="width:300px;">
                 <a href="busticket.jsp"><img class="img-fluid card-img" src="assets/busticket.jpg" style="width:100%;"></a>
             </div>
         </div>
     </div>
     <div class="col-4">
         <div class="card" style="width: 310px;">
             <p class="card-header">HotelBookingDB</p>
             <div class="card-body d-flex justify-content-center" style="width: 300px;">
                 <a href="hotelbooking.jsp"><img class="img-fluid card-img" src="assets/hotelbooking.jpg" style="width:100%;"></a>
             </div>
         </div>
     </div>
 </div>
<div class="mt-2 ms-3">
    <a class="btn btn-primary" href="adminaddandremove.jsp">Add Or Remove Admins</a>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js" integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js" integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="script.js"></script>
</html>
