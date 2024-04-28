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
        <title>ADMIN: Order Books</title>
        <%@include file="AllCSS.jsp" %>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        
        <%
        User u = (User) session.getAttribute("userObj");                     
        %>
        
        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"/>
        </c:if>

        <h3 class="text-center">Hello ${userObj.name}</h3>

        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Payment Type</th>
                </tr>
            </thead>
            <tbody>

                <%
                   OrderBookImpl dao = new OrderBookImpl();
                   List<OrderBook> list = dao.getAllOrderBook();
                   for (OrderBook o : list) {
                %>

                <tr>
                    <th scope="row"><%= o.getIdOrder()%></th>
                    <td><%= o.getUserName()%></td>
                    <td><%= o.getEmail()%></td>
                    <td><%= o.getAddress()%></td>
                    <td><%= o.getPhone()%></td>
                    <td><%= o.getBookName()%></td>
                    <td><%= o.getAuthor()%></td>
                    <td><%= o.getPrice()%></td>
                    <td><%= o.getPaymentType()%></td>
                </tr>

                <%
                   }
                %>
            </tbody>
        </table>

        <div style="margin-top: 625px"><%@include file="../AllComponent/Footer.jsp" %></div>
    </body>
</html>
