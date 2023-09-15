<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.css"
          integrity="sha512-azoUtNAvw/SpLTPr7Z7M+5BPWGOxXOqn3/pMnCxyDqOiQd4wLVEp0+AqV8HcoUaH02Lt+9/vyDxwxHojJOsYNA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.css"
          integrity="sha512-KOWhIs2d8WrPgR4lTaFgxI35LLOp5PRki/DxQvb7mlP29YZ5iJ5v8tiLWF7JLk5nDBlgPP1gHzw96cZ77oD7zQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <title>BusTicket</title>
    <style>
        body{
            background-image: url("assets/bbookbg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        #ht{
            text-shadow:3px 5px 4px black;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <%
        Connection con;
        ResultSet rs;
        Statement st;
        String sql;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
            st=con.createStatement();
            sql="select * from bus";
            rs=st.executeQuery(sql);

    %>
    <div style="margin-top:320px; " class=" container">
        <form method="post" action="BusMatchingServlet">
            <div class="row m-auto container">
                <div class="">
                    <h2 style="color: white;" id="ht" class="display-4">Search Bus</h2>
                </div>
                <div class="col-3 mt-2">
            <select name="sdn" class="form-select">
                <% while (rs.next()){%>
                <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                <%} rs=st.executeQuery(sql);%>
            </select>
            </div>
                <div class="col-3 mt-2">
            <select name="adn" class="form-select">
                <% while (rs.next()){%>
                <option value="<%=rs.getString(3)%>"><%=rs.getString(3)%></option>
                <% } %>
            </select>
            </div>
                <div class="col-3 mt-2">
                    <input type="date" name="dt" class="form-control">
                </div>
                <div class="col-3 mt-2">
                    <div class="row">
                        <div class="col-4">
                            <a id="minus" class="btn bg-white"><i class="fas fa-user-minus"></i></a>
                        </div>
                        <div class="col-4">
                            <input type="text" name="nop" id="nop" class="form-control" >
                        </div>
                        <div class="col-4">
                            <a id="plus" class="btn bg-white"><i class="fas fa-user-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-2">
                <input type="submit" value="Search" class="btn btn-primary">
            </div>
        </form>
    </div>
    <%
        }
        catch (Exception e){
            e.printStackTrace();
        }
        %>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.js"
        integrity="sha512-DPUu8AASCK4LgK2+PG3ACvGh55Rd8IriP7IowJC2oI+rUb7I0Mh1l4+jO8uZQf7Y5goe919rdWG3mT8rw2kxzw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js"
        integrity="sha512-Ktf+fv0N8ON+ALPwyuXP9d8usxLqqPL5Ox9EHlqxehMM+h1wIU/AeVWFJwVGGFMddw/67P+KGFvFDhZofz2YEg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    var plus=document.getElementById("plus");
    var minus=document.getElementById("minus");
    var nop=document.getElementById("nop");
    var i=1;
    nop.value=i;
    plus.addEventListener("click",function (){
        i++;
        nop.value=i;
    });
    minus.addEventListener("click",function (){
        if(i>1){
            i--;
            nop.value=i;
        }
    });
</script>
</html>