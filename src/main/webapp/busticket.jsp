<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>BusModifier</title>
</head>
<body>
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
            <div class=" mt-2">
                <input type="text" name="nos" class="form-control" placeholder="EnterAvailableSeats">
            </div>
        </div>
        <button type="submit" class="btn mt-2 btn-secondary">AddBus</button>
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
        <button type="submit" class="btn mt-2 btn-secondary">RemoveBus</button>
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>