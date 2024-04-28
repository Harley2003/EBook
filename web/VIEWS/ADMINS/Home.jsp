<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN: Home</title>
        <%@include file="AllCSS.jsp" %>
        <style type="text/css">
            a {
                text-decoration: none;
                color: black;
            }

            a:hover {
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="/VIEWS/USERS/Login.jsp" />
        </c:if>

        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="AddBooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i> <br>
                                <h4>Add Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="AllBooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-open fa-3x text-danger"></i> <br>
                                <h4>All Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="OrderBooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box fa-3x text-warning"></i> <br>
                                <h4>Order Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3" style="cursor: pointer">
                    <a data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-sign-out-alt fa-3x text-primary"></i> <br>
                                <h4>Logout</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!--START LOGOUT-->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <h4>Do you want logout?</h4>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="../../logout" type="button" class="btn btn-primary text-white">Logout</a>  
                        </div>
                    </div>
                    <div class="modal-footer"></div>
                </div>
            </div>
        </div>
        <!--END LOGOUT-->

        <div style="margin-top: 510px"><%@include file="../AllComponent/Footer.jsp" %></div>
    </body>
</html>
