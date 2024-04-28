<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<%@page import="MODELS.*" %>
<%@page import="DALS.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER: HELP LINE</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>

        <div class= "conatiner">
            <div class= "row p-5">
                <div class= "col-md-4 offset-md-4 text-center">
                    <div class= "text-success ">
                        <i class="fas fa-phone-square-alt fa-5x"></i>
                    </div>
                    <h3>24*7 Service</h3>
                    <h4>Help Line Number</h4>
                    <h5>+0671 869899023</h5>
                    <a href= "Default.jsp" class= "btn btn-primary" >Home</a>
                </div>
            </div>
        </div>

        <div style="margin-top: 500px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
