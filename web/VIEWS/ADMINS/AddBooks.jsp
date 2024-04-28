<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN: Add Books</title>
        <%@include file="AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        
        <%@include file="Navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="/VIEWS/USERS/Login.jsp" />
        </c:if>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 mt-2">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Add Books</h4>

                            <c:if test="${not empty succMsg}">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failMsg}">
                                <p class="text-center text-success">${failMsg}</p>
                                <c:remove var="failMsg" scope="session"/>
                            </c:if>    

                            <form action="<c:url value= '/addbook' />" method="post" enctype="multipart/form-data">
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
                                    <label for= "inputstate">Book Categories</label> <select
                                        id= "inputState" name= "btype" class= "form-control">
                                        <option selected>--select--</option>
                                        <option value= "New">New Book</option>
                                    </select>
                                </div>

                                <div class= "form-group">
                                    <label for= "inputstate">Book Status</label> <select
                                        id= "inputState" name= "bstatus" class= "form-control">
                                        <option selected>--select--</option>
                                        <option value= "Active">Active</option>
                                        <option value= "Inactive">Inactive</option>
                                    </select>
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleFormControlFile1">Upload Photo</label> <input
                                        name= "bimg" type= "file" class= "form-control-file"
                                        id="exampleFormControlFile1">
                                </div>

                                <button type= "submit" class= "btn btn-primary">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 510px"><%@include file="../AllComponent/Footer.jsp" %></div>
    </body>
</html>
