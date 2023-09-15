<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        body{
            background-color: whitesmoke;
            max-height: 1000px;
        }
        #loginForm{
            background:wheat;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px 0 black;
            width: 500px;
            min-height: 400px;
            margin-top:60px;
            margin-bottom: 200px;
        }
    </style>
    <title>Login</title>
</head>
<body>
<div class="container-fluid ">
    <div class="text-center" id="loginForm">
    <form class="text-center  container"  action="LoginServlet" method="post">
        <div class="text-center" >
            <h3 class="fs-2 p-2 text-black">Login<i class="fas fa-user"></i></h3>
        <div class="form-floating mt-3">
            <input type="email" name="usname" placeholder="" class="form-control">
            <label >Enter Username or Email</label>
        </div>
        <div class="form-floating mt-2">
            <input type="password" name="pass" placeholder="" class="form-control">
            <label >Enter Password</label>
        </div>
            <button type="submit" class="btn mt-3 btn-primary">Login</button>
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
</html>