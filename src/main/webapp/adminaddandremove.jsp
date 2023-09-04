<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>AddORRemoveAdmin</title>
</head>
<body style="max-width: 1920px;">
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
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>