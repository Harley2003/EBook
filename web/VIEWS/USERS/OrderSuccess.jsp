<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER: ORDER SUCCESS</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>
        <div class= "container text-center mt-3">
            <i class="fas fa-check-circle fa-5x text-success"></i>
            <h1>Thank You</h1>
            <h2>Your Order Successfully</h2>
            <h5>With in 7 Days Your Product will be Delivered In your Adress </h5>
            <a href= "Default.jsp" class= "btn btn-primary mt-3">Home</a> 
            <a href= "OrderUser.jsp" class= "btn btn-danger mt-3">View Order</a>
        </div>
        <div style="margin-top: 460px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
