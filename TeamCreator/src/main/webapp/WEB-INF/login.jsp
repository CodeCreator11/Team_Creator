<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark"></html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body background=" https://media.istockphoto.com/id/471624095/photo/soccer-field-grass-goal.jpg?s=612x612&w=0&k=20&c=akOrRWhmEBvkUd9PAjFrPhjApB4kFtXklDi4DIm30ZM=" style="background-size: cover;">
    <div class="contanier">
        <h1></h1>
        <h3></h3>
        <div class="row">
            <div class="col">
                <h2 class="display-3" style="color: rgb(64, 167, 90); margin-left: 10px;">Register</h2>
                <div class="card shadow">
                    <div class="card-body" style="background-color:  grey;">
                        <form:form action="/register" method="POST" modelAttribute="newUser">
                        <div class="mb-3">
                            <form:label path="name" class="form-label">User Name</form:label>
                            <form:input path="name" class="form-control"/>
                            <form:errors path="name" class=" form-text text-warning"/>
                        </div>
                        <div class="mb-3">
                            <form:label path="email" class="form-label">Email</form:label>
                            <form:input path="email" class="form-control"/>
                            <form:errors path="email" class="form-text text-warning"/>
                        </div>
                        <div class="mb-3">
                            <form:label path="password" class="form-label">Password</form:label>
                            <form:input path="password" class="form-control" type="password"/>
                            <form:errors path="password" class="form-text text-warning"/>
                        </div>
                        <div class="mb3">
                            <form:label path="confirm" class="form-label">Confirm Password</form:label>
                            <form:input path="confirm" class="form-control" type="password"/>
                            <form:errors path="confirm" class="form-text text-warning"></form:errors>
                        </div>
                        <div  class="text-end">
                            <button type="submit" class="btn btn-success">Register</button>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col">
                <h2 class="display-2" style="color: rgb(64, 167, 90);">Login</h2>
                <div class="card shadow">
                    <div class="card-body" style=" background-color: grey;">
                        <form:form action="/login" method="POST" modelAttribute="newLogin">
                            <div class="mb-3">
                                <form:label path="email" class="form-label">Email</form:label>
                                <form:input path="email" class="form-control"/>
                                <form:errors path="email" class="form-text text-warning"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="password" class="form-label">Password</form:label>
                                <form:input path="password" class="form-control" type="password"/>
                                <form:errors path="password" class="form-text text-warning"/>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-success">  Login </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>