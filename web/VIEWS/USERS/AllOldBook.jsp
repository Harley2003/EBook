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
        <title>USER: ALL OLD BOOK</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <style type="text/css">
            .crd-ho:hover {
                background-color: rgb(252,247,247);
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7">

        <%
       BookDAOImpl dao = new BookDAOImpl();
        %>
        
        <%@include file="../AllComponent/Navbar.jsp" %>

        <!-- Start Old Book -->
        <div class="container-fluid">
            <div class="row mt-5 p-3">

                <%
                List <BookDetail> list3 = dao.getOldBook();
                for (BookDetail b3 : list3) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b3.getPhotoName()%>" style="height: 150px; width: 100px"
                                 class="img-thumbnail"/>
                            <p><%= b3.getBookName()%></p>
                            <p><%= b3.getAuthor()%></p>
                            <p>Categories: <%= b3.getBookCategory()%></p>
                            <div class="row">
<!--                                <a href="" class="btn btn-danger btn-sm ml-5"><i class="fas fa-cart-plus"></i>
                                    Add Cart</a>-->
                                <a href="DetailBook.jsp?bid=<%= b3.getBookID()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-5">
                                    <%=b3.getPrice()%> <i class="fas fa-dollar-sign"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
        </div>
        <!-- End Old Book -->

        <div style="margin-top: 350px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>
    </body>
</html>
