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
        <title>ADMIN: Edit Book</title>
        <%@include file="AllCSS.jsp" %>
    </head>
    <body style="background-color: #f0f2f2">
        <%@include file="Navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 mt-2">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Edit Books</h4>   

                            <%
                            int id = Integer.parseInt(request.getParameter("ID")); 
                            BookDAOImpl dao = new BookDAOImpl();
                            BookDetail b = dao.getBookByID(id);
                            %>

                            <form action="<c:url value= '/editbook' />" method="post">
                                <input type="hidden" name="idEdit" value="<%= b.getBookID()%>">
                                
                                <div class= "form-group">
                                    <label for= "exampLeInputEmail1" ">Book Name* </label> <input
                                        name= "bname" type= "text" class= "form-control"
                                        id="exampLeInputEmail1" aria-describedby= "emailHelp"
                                        value="<%= b.getBookName()%>">
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleInputEmail1">Author Name*</label> <input
                                        name= "author" type= "text" class= "form-control"
                                        id= "exampleInputEmail1" aria-describedby= =="emailHelp"
                                        value="<%= b.getAuthor()%>">
                                </div>

                                <div class= "form-group">
                                    <label for= "exampleInputPassword1": ">Price* </label> <input
                                        name= "price" type= "number" class= "form-control"
                                        id= "exampleInputPassword1"
                                        value="<%= b.getPrice()%>">
                                </div>

                                <div class= "form-group">
                                    <label for= "inputstate">Book Status</label> <select
                                        id= "inputState" name= "bstatus" class= "form-control">
                                        <%
                                        if ("Active".equals(b.getStatus())) {                             
                                        %>
                                        <option value= "Active">Active</option>
                                        <option value= "Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value= "Inactive">Inactive</option>
                                        <option value= "Active">Active</option>                       
                                        <%
                                          }              
                                        %>
                                    </select>
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
