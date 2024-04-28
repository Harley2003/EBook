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
        <title>ADMIN: All Books</title>
        <%@include file="AllCSS.jsp" %>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>

        <!--../ thì sẽ bị lùi lại và mất đi-->
        <c:if test="${empty userObj}">
            <c:redirect url="/VIEWS/USERS/Login.jsp" />
        </c:if>

        <h3 class="text-center">Hello Admin</h3>

        <c:if test="${not empty succMsg}">
            <h5 class="text-center text-success">${succMsg}</h5>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty failMsg}">
            <h5 class="text-center text-success">${failMsg}</h5>
            <c:remove var="failMsg" scope="session"/>
        </c:if> 

        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Book Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                BookDAOImpl dao = new BookDAOImpl();
                List <BookDetail> list = dao.getAllBook();
                for (BookDetail b : list) {
                %>
                <tr>
                    <th scope="row"><%= b.getBookID()%></th>
                    <td><img src="../IMAGES/<%= b.getPhotoName()%>" style="width: 50px; height: 50px"/></td>
                    <td><%= b.getBookName()%></td>
                    <td><%= b.getAuthor()%></td>
                    <td><%= b.getPrice()%></td>
                    <td><%= b.getBookCategory()%></td>
                    <td><%= b.getStatus()%></td>
                    <td>
                        <a href="EditBooks.jsp?ID=<%= b.getBookID()%>" class="btn btn-sm btn-primary">
                            <i class="fas fa-edit"></i>
                            Edit</a>
                        <a href="../../deletebook?ID=<%= b.getBookID()%>" class="btn btn-sm btn-danger">
                            <i class="fas fa-trash-alt"></i>
                            Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div style="margin-top: 610px"><%@include file="../AllComponent/Footer.jsp" %></div>
    </body>
</html>
