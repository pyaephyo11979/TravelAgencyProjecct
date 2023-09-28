<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/css/bootstrap.min.css" integrity="sha512-Z/def5z5u2aR89OuzYcxmDJ0Bnd5V1cKqBEbvLOiUNWdg9PQeXVvXLI90SE4QOHGlfLqUnDNVAYyZi8UwUTmWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" integrity="sha512-1cK78a1o+ht2JcaW6g8OXYwqpev9+6GqOkz9xmBN9iUUhIndKtxwILGWYOSibOKjLsEdjyjZvYDq/cZwNeak0w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body{
            background-image: url("assets/ftbg.jpg");
            background-size:cover;
            background-repeat:no-repeat;
        }
    </style>
    <!-- Include your CSS and JavaScript libraries here -->
    <title>FlightBooking</title>
</head>
<body>
<%HttpSession sec=request.getSession();%>
<div class="header mt-2 ms-1 sticky-top text-left">
    <a href="index.jsp?name=<%=sec.getAttribute("name")%>&valid=<%=sec.getAttribute("valid")%>" style="width:40px; height: 40px; padding: 10px;" class="btn rounded-circle text-center btn-secondary"><i class="fas fa-home"></i></a>
</div>
<%
    Connection con = null;
    PreparedStatement stmt,stmt1 = null;
    ResultSet rs,rs1;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
        stmt = con.prepareStatement("select distinct SD from flight");
        stmt1=con.prepareStatement("select distinct AD from flight");
        rs = stmt.executeQuery();
%>
<div class="container">
    <form action="FlightMatchingServlet" style="margin-top:200px;" class="" method="post">
        <h2 class="fs-2 fw-bold text-center">Search Flight</h2>
        <div class="row g-2">
            <div class="col-3">
                <h4>From</h4>
                <select name="sdn"   id="sd" class="form-select">
                    <% while(rs.next()){ %>
                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                    <% } rs1 = stmt1.executeQuery(); %>
                </select>
            </div>
            <div class="col-3">
                <h4>To</h4>
                <select name="adn" id="ad"  class="form-select">
                    <% while(rs1.next()){ %>
                    <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
                    <% }  %>
                </select>
            </div>
            <div class="col-2">
                <h4>SelectDate</h4>
                <input type="date" id="date" class="form-control" name="dt" >
            </div>
            <div class="col-4">
                <h4>Passenger</h4>
                <div class="input-group rounded-3  container" style="width:fit-content; ">
                    <a class="btn input-group-text bg-white" id="pminus"><i class="fas fa-user-minus"></i></a>
                    <input type="text" style="width:70px;"   class="form-control" id="pr" name="qty">
                    <a class="btn input-group-text bg-white" id="pplus"><i class="fas fa-user-plus"></i></a>
                </div>
            </div>
        </div>
        <div class="text-center">
        <button class="btn mt-2 btn-primary "  type="submit">SearchFlight</button>
        </div>
    </form>
</div>
<%
        rs.close();
        stmt.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.1/js/bootstrap.bundle.min.js" integrity="sha512-ToL6UYWePxjhDQKNioSi4AyJ5KkRxY+F1+Fi7Jgh0Hp5Kk2/s8FD7zusJDdonfe5B00Qw+B8taXxF6CFLnqNCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js" integrity="sha512-uKQ39gEGiyUJl4AI6L+ekBdGKpGw4xJ55+xyJG7YFlJokPNYegn9KwQ3P8A7aFQAUtUsAQHep+d/lrGqrbPIDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.js" integrity="sha512-+k1pnlgt4F1H8L7t3z95o3/KO+o78INEcXTbnoJQ/F2VqDVhWoaiVml/OEHv9HsVgxUaVW+IbiZPUJQfF/YxZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" integrity="sha512-A7AYk1fGKX6S2SsHywmPkrnzTZHrgiVT7GcQkLGDe2ev0aWb8zejytzS8wjo7PGEXKqJOrjQ4oORtnimIRZBtw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    let pplus=document.getElementById('pplus');
    let pminus=document.getElementById('pminus');
    let person=document.getElementById('pr');
    let prs=1;
    person.value=prs;
    pplus.addEventListener('click',()=>{
        prs+=1;
        person.value=prs;
    });

    pminus.addEventListener('click',()=>{
        let error=person.value<=1;
        if(!error){
            prs-=1;
            person.value=prs;
        }
    })
    let today = new Date().toISOString().split('T')[0];
    let date=document.getElementById('date');
    date.setAttribute('min',today);
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
