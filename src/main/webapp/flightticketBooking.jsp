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
<%
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/travelagencydb", "root", "root");
        stmt = con.prepareStatement("select * from flight");
        rs = stmt.executeQuery();
%>
<div class="container">
    <form action="FlightMatchingServlet" style="margin-top:200px;" class="" method="post">
        <h2 class="fs-2 fw-bold text-center">Search Flight</h2>
        <div class="row g-2">
            <div class="col-2">
                <h4>From</h4>
                <select name="sdn" class="form-select">
                    <% while(rs.next()){ %>
                    <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                    <% } rs = stmt.executeQuery(); %>
                </select>
            </div>
            <div class="col-2">
                <h4>To</h4>
                <select name="adn" class="form-select">
                    <% while(rs.next()){ %>
                    <option value="<%=rs.getString(4)%>"><%=rs.getString(4)%></option>
                    <% } rs = stmt.executeQuery(); %>
                </select>
            </div>
            <div class="col-2">
                <h4>SelectFlightName</h4>
                <select name="fn" class="form-select">
                    <% while(rs.next()){ %>
                    <option value="<%=rs.getString(6)%>"><%=rs.getString(6)%></option>
                    <% } rs = stmt.executeQuery(); %>
                </select>
            </div>
            <div class="col-2">
                <h4>SelectDate</h4>
                <input type="date" class="form-control" name="dt" >
            </div>
            <div class=" col-4">
                <h4>Person</h4>
                <div class="row g-2 container">
                    <div class="col-2">
                        <a class="btn bg-white" id="pminus"><i class="fas fa-user-minus"></i></a>
                    </div>
                    <div class="col-4">
                        <input type="text" style="width:90px"  class="ms-1 form-control me1" id="pr" name="qty">
                    </div>
                    <div class="col-2">
                        <a class="btn bg-white" id="pplus"><i class="fas fa-user-plus"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
        <button class="btn mt-2 btn-primary "  type="submit">BookNow</button>
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
console.log(person.value)
</script>
</html>
