<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>BusTicketCheckout</title>
    <style>
        body{
            background:linear-gradient(108deg,aquamarine,blueviolet);
        }
        #fr{
            background:linear-gradient(108deg,wheat,whitesmoke);
            border-radius: 10px;
            border:2px solid black;
            margin-top:120px;
        }
    </style>
</head>
<body>
<%
    HttpSession ss=request.getSession();
%>
<div>
    <div>

        <form id="fr" action="BusCheckOutServlet" method="post" class="container">
            <h2 class="text-center mt-4">Order Your Bus Ticket<i class="fas fa-bus"></i></h2>
            <div class="row mt-4 container">
                <div class="col-6">
                    <div class="form-floating mt-2">
                        <input type="text" required name="ne" id="ne"  value="<%=ss.getAttribute("name")%>" class="form-control" placeholder="">
                        <label>Enter Name</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" name="em" required id="em" value="<%=ss.getAttribute("email")%>" class="form-control" placeholder="">
                        <label>Enter Email</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" required pattern="^([0-9]{1,2})\/([A-Z][a-z]|[A-Z][a-z][a-z])([A-Z][a-z]|[A-Z][a-z][a-z])([A-Z][a-z]|[A-Z][a-z][a-z])\([N,P,E]\)[0-9]{6}$" name="nrc" id="nrc" value="<%=ss.getAttribute("nrc")%>" class="form-control" placeholder="">
                        <label>Enter NRC</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" name="price" required  class="form-control " placeholder="" value="<%=request.getParameter("price")%>">
                        <label>Price</label>
                    </div>
                    <div class="form-date mt-2">
                        <input type="date" name="date" required  value="<%=ss.getAttribute("date")%>" class="form-control">
                    </div>
                    <div class="mt-2">
                        <h4 class="fs-5 mb-2">Select Your Payment Method</h4>
                        <input type="radio" required name="payment" value="kpay">KPay
                        <input type="radio" required name="payment" value="wave">Wave
                        <input type="radio" required name="payment" value="Visa/Master">Visa/Master
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-floating mt-2">
                        <input type="text" name="bsd" required value="<%=request.getParameter("bsd")%>" class="form-control" placeholder="">
                        <label>Start Destination</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" name="bad" required value="<%=request.getParameter("bad")%>" class="form-control" placeholder="">
                        <label>Arrival Destination</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" name="bnm" required value="<%=request.getParameter("bname")%>" class="form-control" placeholder="">
                        <label>Enter Bus Name</label>
                    </div>
                    <div class="form-floating mt-2">
                        <input type="text" name="ph" required   class="form-control" placeholder="">
                        <label>Enter PhoneNumber</label>
                    </div>
                </div>
                <div class="text-center">
                <input type="submit" class="btn mt-3 mb-3 btn-info" value="BookNow">
                </div>
            </div>
        </form>
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
  let name=document.getElementById("ne");
  let email=document.getElementById("em");
  let nrc=document.getElementById("nrc");
  if(name.value==="null" || email.value==="null" || nrc.value==="null"){
      name.value="";
      email.value="";
      nrc.value="";
  }
</script>
</html>