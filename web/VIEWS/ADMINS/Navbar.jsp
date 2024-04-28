<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<!-- HEADER -->
<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-4 text-success">
            <h3>
                <i class="fas fa-book"></i>
                Ebooks
            </h3>
        </div>

        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0"></form>
        </div>
        <div class="col-md-2">

            <c:if test="${not empty userObj}">
                <a href="#" class="btn btn-success text-white">
                    <i class="fas fa-user"></i> ${userObj.name}</a>
                <a data-toggle="modal" data-target="#exampleModal" class="btn btn-primary text-white">
                    <i class="fas fa-sign-in-alt"></i> Logout</a>
                </c:if>

            <c:if test="${empty userObj}"> 
                <a href="../USERS/Login.jsp" class="btn btn-success">
                    <i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="../USERS/Register.jsp" class="btn btn-primary text-white">
                    <i class="fas fa-user-plus"></i> Register</a>
                </c:if>
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

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
    </div>
</nav>