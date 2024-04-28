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
        <title>USER: ALL RECENT BOOK</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <style type="text/css">
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

        <div class="container-fluid">
            <div class="row mt-5 p-3">
                <%
               List <BookDetail> list1 = dao.getAllRecentBook();
               for (BookDetail b1 : list1) {
                %>
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b1.getPhotoName()%>" style="height: 150px; width: 100px"
                                 class="img-thumbnail"/>
                            <p><%= b1.getBookName()%></p>
                            <p><%= b1.getAuthor()%></p>

                            <%
                                if (b1.getBookCategory().equals("Old")) {
                            %>

                            <p>Categories: <%= b1.getBookCategory()%></p>
                            <div class="row">
                                <a href="DetailBook.jsp?bid=<%= b1.getBookID()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-5">
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

                                <a href="DetailBook.jsp?bid=<%= b1.getBookID()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-5">
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
        </div>

        <div style="margin-top: 400px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>

    </body>
</html>
