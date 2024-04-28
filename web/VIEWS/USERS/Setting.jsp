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
        <title>USER: SETTING</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }

            a:hover {
                text-decoration: none;
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"/>
        </c:if>

        <div class="container">
            <h3 class="text-center">Hello ${userObj.name}</h3>
            <div class="row p-5">
                <div class="col-md-6">
                    <a href="SellBook.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>Sell Old Book</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-6">
                    <a href="EditProfile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h4>Login & Security (Edit Profile)</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-3">
                    <a href="AddressUser.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fas fa-map-marker-alt fa-3x"></i>
                                </div>
                                <h4>Your Address</h4>
                                <p>Edit Address</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-3">
                    <a href="OrderUser.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>My Order</h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-4 mt-3">
                    <a href="HelpLine.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <h4>Help Center</h4>
                                <p>24*7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
        </div>

        <div style="margin-top: 300px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
