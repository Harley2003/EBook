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
        <title>USER: SELL BOOK</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"/>
        </c:if>


        <div class="container mt-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1">Sell Old Book</h5>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-success">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"/>
                            </c:if>    

                            <form action="<c:url value= '/addoldbook' />" method="post" enctype="multipart/form-data">
                                <input type="hidden" value="${userObj.email}" name="nameUser"/>
                                <div class= "form-group">
                                    <label for= "exampLeInputEmail1" ">Book Name* </label> <input
                                        name= "bname" type= "text" class= "form-control"
                                        id="exampLeInputEmail1" aria-describedby= "emailHelp">
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleInputEmail1">Author Name*</label> <input
                                        name= "author" type= "text" class= "form-control"
                                        id= "exampleInputEmail1" aria-describedby= =="emailHelp">
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleInputPassword1": ">Price* </label> <input
                                        name= "price" type= "number" class= "form-control"
                                        id= "exampleInputPassword1">
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleFormControlFile1">Upload Photo</label> <input
                                        name= "bimg" type= "file" class= "form-control-file"
                                        id="exampleFormControlFile1">
                                </div>

                                <button type= "submit" class= "btn btn-primary">Sell Book</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 300px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
