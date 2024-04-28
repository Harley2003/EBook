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
        <title>USER: ADDRESS USER</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>

        <div class= "container mt-5">
            <div class="row">
                <div class= "col-md-4 offset-md-4">
                    <div class= "card">
                        <div class= "card-body">
                            <h3 class="text-center text-success">Add Address</h3>
                            <form action="<c:url value= '/' />" method="">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" class="form-control" id="inputPassword4">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Landmark</label>
                                        <input type="text" class="form-control" id="inputEmail4">
                                    </div>
                                </div> 

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" class="form-control" id="inputPassword4">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputEmail4">State</label>
                                        <input type="text" class="form-control" id="inputEmail4">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="inputPassword4">Zip</label>
                                        <input type="text" class="form-control" id="inputPassword4">
                                    </div>
                                </div>

                                <div class= "text-center">
                                    <button class= "btn btn-warning text-white">Add Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 400px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
