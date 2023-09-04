<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css" integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1 class="text-center display-4"> Please Login to Continue to Control Panel </h1>
<div class="d-flex justify-content-center mt-2">
    <form name="login" class="form mt-4" action="ViewServlet" method="get" style="width:400px;">
        <div class="form-floating mt-2">
            <input type="email" name="usname" class="form-control" placeholder="Enter username">
            <label>Enter Username</label>
        </div>
        <div class="form-floating mt-2">
            <input type="password" name="psw" class="form-control" placeholder="Enter Password">
            <label>Enter Password</label>
        </div>
        <div class="mt-2">
            <button style="width: 70px;" type="submit" class="btn rounded-3 btn-primary">Login</button>
        </div>
    </form>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js" integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="script.js"></script>
</html>