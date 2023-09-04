<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>FlightTicketModify</title>
</head>
<body>
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
                <input type="text" name="qty" class="form-control" placeholder="EnterQuantity">
            </div>
        </div>
        <button type="submit" class="btn mt-2 btn-secondary">AddFlight</button>
    </form>
    <form name="addticket" id="" class="mt-3 " method="post" action="FlightTicketRemove" style="width:500px;">
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
        <button type="submit" class="btn mt-2 btn-secondary">RemoveFlight</button>
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(document).ready(function () {
        $("#addticket").submit(function (event) {
            event.preventDefault();
            var form = $(this);
            var url = form.attr('action');
            $.ajax({
                type: "POST",
                url: url,
                data: form.serialize(),
                success: function (data) {
                    alert(data);
                }
            });
        });
    });
</script>
</html>