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
        h4{
            color: white;
            text-shadow:3px 5px 4px black;
        }
    </style>
</head>
<body>
<%HttpSession sec=request.getSession();%>
<div class="header mt-2 ms-1 sticky-top text-left">
    <a href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>" style="width:40px; height: 40px; padding: 10px;" class="btn rounded-circle text-center btn-secondary"><i class="fas fa-home"></i></a>
</div>
<div class="container-fluid">
    <%
        Connection con;
        ResultSet rs,rs1;
        Statement st,st1;
        String sql;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb","root","root");
            st=con.createStatement();
            st1=con.createStatement();
            sql="select distinct SD from bus";
            rs=st.executeQuery(sql);

    %>
    <div style="margin-top:220px; " class=" container">
        <form method="post" action="BusMatchingServlet">
            <div class="row m-auto container">
                <div class="">
                    <h2 style="color: white;" id="ht" class="display-4">Search Bus</h2>
                </div>
                <div class="col-3 mt-2">
                    <h4>From</h4>
            <select name="sdn" id="sd" class="form-select">
                <% while (rs.next()){%>
                <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                <%} rs1=st1.executeQuery("select distinct AD from bus");%>
            </select>
            </div>
                <div class="col-3 mt-2">
                    <h4>To</h4>
            <select name="adn" id="ad" class="form-select">
                <% while (rs1.next()){%>
                <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                <% } %>
            </select>
            </div>
                <div class="col-3 mt-2">
                    <h4>Date</h4>
                    <input type="date" id="date" name="dt" min="2023-08-01" class="form-control">
                </div>
                <div class="col-3 mt-2">
                    <h4>Number of Passengers</h4>
                    <div class="input-group rounded-3  container" style="width:fit-content; ">
                        <a class="btn input-group-text bg-white" id="minus"><i class="fas fa-user-minus"></i></a>
                        <input type="text" style="width:70px;"   class="form-control" id="nop" name="nop">
                        <a class="btn input-group-text bg-white" id="plus"><i class="fas fa-user-plus"></i></a>
                    </div>
                </div>
            </div>

            <div class="text-center mt-2">
                <input type="submit" value="Search Bus" class="btn btn-primary">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
    let date=document.getElementById("date");
    let today=new Date().toISOString().split('T')[0];
    date.setAttribute("min",today);
    $(document).ready(()=>{
        $('#sd').change(()=>{
            let sd=$('#sd').val();
            $('#ad').children().each(function () {
                if($(this).val()===sd){
                    $(this).hide();
                }else{
                    $(this).show();
                }
            })
        })
        $('#ad').change(()=>{
            let ad=$('#ad').val();
            $('#sd').children().each(function () {
                if($(this).val()===ad){
                    $(this).hide();
                }else{
                    $(this).show();
                }
            })
        })
    })
</script>
</html>