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
        <title>EBook: Home</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <style type="text/css">
            .back-img {
                background: url("../IMAGES/book.jpg");
                height: 50vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }

            .crd-ho:hover {
                background-color: rgb(252,247,247);
            }
        </style>
    </head>
    <body style="background-color: #f7f7f7">
        <%
        User u = (User) session.getAttribute("userObj");
        BookDAOImpl dao = new BookDAOImpl();
        %>

        <%@include file="../AllComponent/Navbar.jsp" %>

        <div class="container-fluid back-img">
            <h2 class="text-center text-danger">EBook Management System</h2>
        </div>

        <!-- Start Recent Book -->
        <div class="container">
            <h3 class="text-center">Recent Book</h3>
            <div class="row">

                <%
                List <BookDetail> list1 = dao.getRecentBook();
                for (BookDetail b1 : list1) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b1.getPhotoName()%>" style="height: 200px; width: 150px"
                                 class="img-thumbnail"/>
                            <p><%= b1.getBookName()%></p>
                            <p><%= b1.getAuthor()%></p>

                            <%
                                if (b1.getBookCategory().equals("Old")) {
                            %>

                            <p>Categories: <%= b1.getBookCategory()%></p>
                            <div class="row">
                                <a href="DetailBook.jsp?bid=<%= b1.getBookID()%>" class="btn btn-success btn-sm ml-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1">
                                    <%=b1.getPrice()%> <i class="fas fa-dollar-sign"></i>
                                </a>
                            </div>

                            <%
                              } else {
                            %>

                            <p>Categories: <%= b1.getBookCategory()%></p>
                            <div class="row">
                                
                                <%
                                if (u == null) {
                                %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm ml-1">
                                    <i class="fas fa-cart-plus"></i> Add Cart</a>
                                <%
                                    } else {
                                %>
                                <a href="../../cart?bid=<%= b1.getBookID()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ml-1">
                                    <i class="fas fa-cart-plus"></i> Add Cart</a>
                                <%
                                    }
                                %>
                                
                                <a href="DetailBook.jsp?bid=<%= b1.getBookID()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1">
                                    <%=b1.getPrice()%> <i class="fas fa-dollar-sign"></i>
                                </a>
                            </div>

                            <%
                            }
                            %>

                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>

            <div class="text-center mt-3">
                <a href="AllRecentBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
        <!-- End Recent Book -->
        <hr>
        <!-- Start New Book -->
        <div class="container">
            <h3 class="text-center">New Book</h3>
            <div class="row">

                <%
                List <BookDetail> list2 = dao.getNewBook();
                for (BookDetail b2 : list2) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b2.getPhotoName()%>" style="height: 200px; width: 150px"
                                 class="img-thumbnail"/>
                            <p><%= b2.getBookName()%></p>
                            <p><%= b2.getAuthor()%></p>
                            <p>Categories: <%= b2.getBookCategory()%></p>
                            <div class="row">
                                
                                <%
                                if (u == null) {
                                %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm ml-1">
                                    <i class="fas fa-cart-plus"></i> Add Cart</a>
                                <%
                                    } else {
                                %>
                                <a href="../../cart?bid=<%= b2.getBookID()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ml-1">
                                    <i class="fas fa-cart-plus"></i> Add Cart</a>
                                <%
                                    }
                                %>
                                
                                <a href="DetailBook.jsp?bid=<%= b2.getBookID()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1">
                                    <%=b2.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
            <div class="text-center mt-3">
                <a href="AllNewBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>
        </div>
        <!-- End New Book -->
        <hr>
        <!-- Start Old Book -->
        <div class="container">
            <h3 class="text-center">Old Book</h3>
            <div class="row">

                <%
                List <BookDetail> list3 = dao.getOldBook();
                for (BookDetail b3 : list3) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b3.getPhotoName()%>" style="height: 200px; width: 150px"
                                 class="img-thumbnail"/>
                            <p><%= b3.getBookName()%></p>
                            <p><%= b3.getAuthor()%></p>
                            <p>Categories: <%= b3.getBookCategory()%></p>
                            <div class="row">
                                <a href="DetailBook.jsp?bid=<%= b3.getBookID()%>" class="btn btn-success btn-sm ml-4">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1">
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

            <div class="text-center mt-3">
                <a href="AllOldBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
        <!-- End Old Book -->

        <%@include file="../AllComponent/Footer.jsp" %>
    </body>
</html>
