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
        <title>USER: DETAIL BOOK</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
    </head>
    <body style="background-color: #f7f7f7">

        <%@include file="../AllComponent/Navbar.jsp" %>

        <%
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl();
        BookDetail b = dao.getBookByID(bid);
        %>

        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="../IMAGES/<%= b.getPhotoName()%>" style="width: 100px; height: 150px"/> <br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%= b.getBookName()%></span></h4>
                    <h4>Author Name: <span class="text-success"><%= b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-success"><%= b.getBookCategory()%></span></h4>
                    <br>
                </div>

                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%= b.getBookName()%></h2>

                    <%
                    if ("Old".equals(b.getBookCategory())) {
                    %>
                    <h5 class="text-primary">Contact to Seller</h5>
                    <h5 class="text-primary"><i class="far fa-envelope"></i>
                        Email: <%= b.getEmailUser()%></h5>
                        <%
                            }
                        %>

                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave-alt fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>

                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Return Available</p>
                        </div>

                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>

                    <%
                    if ("Old".equals(b.getBookCategory())) {
                    %>

                    <div class="text-center p-3">
                        <a href="Default.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
                            Continue Shopping</a>
                        <a href="" class="btn btn-danger"><%= b.getPrice()%>
                            <i class="fas fa-dollar-sign"></i></a>
                    </div>

                    <%
                    } else {
                    %>

                    <div class="text-center p-3">
                        <a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
                            Add Cart</a>
                        <a href="" class="btn btn-danger"><%= b.getPrice()%>
                            <i class="fas fa-dollar-sign"></i></a>
                    </div>
                    <%
                        }
                    %>

                </div>

            </div>
        </div>

        <div style="margin-top: 350px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
