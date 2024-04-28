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
        <title>USER: ALL NEW BOOK</title>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <%@include file="../AllComponent/AllCSS.jsp"%>
        <style type="text/css">
            .crd-ho:hover {
                background-color: rgb(252,247,247);
            }

            /* toast */
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            /* toast */
        </style>
    </head>
    <body style="background-color: #f7f7f7">

        <%
        BookDAOImpl dao = new BookDAOImpl();
        User u = (User) session.getAttribute("userObj");
        %>

        <%@include file="../AllComponent/Navbar.jsp" %>

        <c:if test="${not empty succMsg}">
            <div id="toast"><h5>${succMsg}</h5></div>
                    <c:remove var="succMsg" scope="session"/>
                </c:if>

        <c:if test="${not empty failMsg}">
            <div id="toast"><h5>${failMsg}</h5></div>
                    <c:remove var="failMsg" scope="session"/>
                </c:if>

        <!-- Start New Book -->
        <div class="container-fluid">
            <div class="row mt-5 p-3">

                <%
                List <BookDetail> list2 = dao.getAllNewBook();
                for (BookDetail b2 : list2) {
                %>

                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img src="../IMAGES/<%= b2.getPhotoName()%>" style="height: 150px; width: 100px"
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
                                
                                <a href="DetailBook.jsp?bid=<%= b2.getBookID()%>" class="btn btn-success btn-sm ml-5">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-5">
                                    <%=b2.getPrice()%> <i class="fas fa-dollar-sign"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>

            </div>
        </div>
        <!-- End New Book -->
        <div style="margin-top: 350px">
            <%@include file="../AllComponent/Footer.jsp" %>
        </div>

        <script type="text/javascript">
            showToast();
            function showToast(content)
            {
                $('#toast').addClass("display");
                $('#toast').html(content);
                setTimeout(() => {
                    $("#toast").removeClass("display");
                }, 2000)
            }
        </script>
    </body>
</html>
