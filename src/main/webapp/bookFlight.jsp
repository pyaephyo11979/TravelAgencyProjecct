<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>FlightCheckOut</title>
    <style>
        .fdp{
            border: 1px solid black;
            border-radius: 10px;
            padding: 10px;
            background:linear-gradient(109deg,lightcoral,lightblue);
        }
        body{
            background:linear-gradient(108deg,wheat,snow);
        }
        #fr{
            box-shadow: 0 0 10px black;
        }
    </style>
</head>
<body>
<div class="container">
    <%HttpSession sc=request.getSession();%>
    <div id="fr" class="m-3 fdp  container">
        <form action="FlightCheckoutSevlet" class="row" method="post" >
            <h2 class="text-center fs-2 fw-bold">BookFlight</h2>
        <div class="col-6">
            <div class="form-floating mt-1">
                <input type="text" class="form-control" id="name" name="name" required value="<%=sc.getAttribute("name")%>" placeholder="">
                <label >EnterName</label>
            </div>
            <div class="form-floating mt-2">
                <input type="text" class="form-control" name="sd" required placeholder="" value="<%=request.getParameter("sd")%>">
                <label>EnterStartDestination</label>
            </div>
            <div class="form-floating mt-1">
                <input type="text" class="form-control" id="email" required name="email" value="<%=sc.getAttribute("email")%>" placeholder="">
                <label >EnterEmail</label>
            </div>
            <div>
                <label for="date">Date</label>
                <input type="date" id="date" class="form-control" required name="date" value="<%=request.getParameter("dt")%>">
            </div>
            <div class="mt-1">
                <h2 class="fs-5 fw-bold">Select Payment Method</h2>
                <input type="radio"  value="Kpay" required name="payment"> Kpay
                <input type="radio"  value="Wave" required name="payment"> Wave
                <input type="radio"  value="Visa/Master" required name="payment"> Visa/Master
            </div>
        </div>
        <div class="col-6">
            <div class="form-floating mt-1">
                <input type="text" class="form-control" name="phone" required  placeholder="">
                <label >EnterPhone</label>
            </div>
            <div class="form-floating mt-1">
                <input type="text" class="form-control" name="ad" required placeholder="" value="<%=request.getParameter("ad")%>">
                <label >EnterArrivalDestination</label>
            </div>
            <div class="form-floating mt-1">
                <input type="text" class="form-control" required name="price" value="<%=request.getParameter("price")%>" placeholder="">
                <label>Price</label>
            </div>
            <div class="form-floating mt-1">
                <input type="text" class="form-control" required id="nrc" name="nrc" value="<%=session.getAttribute("nrc")%>" placeholder="">
                <label>EnterNRC</label>
            </div>
        </div>
            <div class="mt-2 text-center">
                <button type="submit" class="btn btn-success">CheckOut</button>
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
    let name=document.getElementById("name");
    let email=document.getElementById("email");
    let nrc=document.getElementById("nrc");
    if(name.value==="null"|| email.value==="null"|| nrc.value==="null"){
        name.value="";
        email.value="";
        nrc.value="";
    }
</script>
</html>