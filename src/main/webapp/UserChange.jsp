<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>UserPanel</title>
</head>
<body>
<div class="container">
    <div class="row container">
        <div class="col-4 mt-4">
            <h4>ChangeName</h4>
            <form action="USNameChangeServlet" method="post">
                <div class="form-floating mt-2">
                    <input type="text" name="nna" placeholder="" class="form-control">
                    <label>EnterNewUsername</label>
                </div>
                <div class="form-floating mt-2">
                    <input type="password" name="psw" placeholder="" class="form-control">
                    <label>EnterPassword</label>
                </div>
                <div class="mt-2 text-center">
                    <button type="submit" class="btn btn-primary">ChangeName</button>
                </div>
            </form>
        </div>
        <div class="col-4 mt-4">
            <h4>ChangePassword</h4>
            <form action="USPasswordChangeServlet" method="post">
                <div class="form-floating mt-2">
                    <input type="password" name="npsw" placeholder="" class="form-control">
                    <label>EnterNewPassword</label>
                </div>
                <div class="form-floating mt-2">
                    <input type="password" name="psw" placeholder="" class="form-control">
                    <label>EnterOldPassword</label>
                </div>
                <div class="mt-2 text-center">
                    <button type="submit" class="btn btn-primary">Change</button>
                </div>
            </form>
        </div>
        <div class="col-4 mt-4">
            <h4>ChangeEmail</h4>
            <form method="post" action="USEmailChangeServlet">
                <div class="form-floating mt-2">
                    <input type="email" name="nem" placeholder="" class="form-control">
                    <label>EnterNewEmail</label>
                </div>
                <div class="form-floating mt-2">
                    <input type="password" name="psw" placeholder="" class="form-control">
                    <label>EnterPassword</label>
                </div>
                <div class="mt-2 text-center">
                    <input type="submit" class="btn btn-primary" value="ChangeEmail">
                </div>
            </form>
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
</html>