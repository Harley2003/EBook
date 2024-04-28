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
        <title>USER: ORDER USER</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">
        <%@include file="../AllComponent/Navbar.jsp" %>
        
        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"/>
        </c:if>
        
        <div class="container mt-5 p-1">
            <h3 class="text-center text-primary">Your Order</h3>
            <table class="table table-striped">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                    User u = (User) session.getAttribute("userObj");                     
                    OrderBookImpl dao = new OrderBookImpl();
                    List<OrderBook> list = dao.getOrderBook(u.getEmail());
                    for (OrderBook o : list) {
                    %>

                    <tr>
                        <th scope="row"><%= o.getIdOrder()%></th>
                        <td><%= o.getUserName()%></td>
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
        </div>

        <div style="margin-top: 600px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
