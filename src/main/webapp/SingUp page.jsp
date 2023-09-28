<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>SingUp Account</title>
    <style>
        body{
            background-color:whitesmoke;
        }
        #signUpForm{
            background-color: wheat;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 0 10px 0 black;
            width: 500px;
            min-height: 800px;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="SignUpServlet" class="container text-center" id="signUpForm" method="post" enctype="multipart/form-data">
        <h2 class="fs-3 text-black ">SignUp <i class="fas fa-user-plus"></i></h2>
    <div class="container text-center">
            <div class="mt-2 form-floating">
                <input type="text" required name="nm" class="form-control" placeholder="en">
                <label class="text-black">EnterName</label>
            </div>
            <div class="mt-2 form-group">
                <label class="text-black" style="text-align: start; background-color: white;" for="bn">EnterYourBirthday</label>
                <input type="date" required class="form-control " id="bn" placeholder="choosebirthday" name="bd">
            </div>
            <div class="mt-2 form-floating">
                <input type="password" class="form-control" name="psw" placeholder="" >
                <label class="text-black">Enter Password</label>
            </div>
            <div class="mt-2 form-floating">
                <input type="email" required name="em" class="form-control" placeholder="en">
                <label class="text-black">EnterEmail</label>
            </div>
            <div class="mt-2 form-floating">
                <input type="text"  pattern="^([0-9]{1,2})\/([A-Z][a-z]|[A-Z][a-z][a-z])([A-Z][a-z]|[A-Z][a-z][a-z])([A-Z][a-z]|[A-Z][a-z][a-z])\([N,P,E]\)[0-9]{6}$" class="form-control " name="nrc" required placeholder="">
                <label class="text-black" >EnterNRCNo(Eg:11/SATANA(N)123456)</label>
            </div>
        <div class="mt-2 text-center">
            <button type="submit" class="btn btn-primary">Create Account</button>
        </div>
    </div>
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