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
    <title>View</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body background=" https://www.strategy-business.com/media/image/44600252_thumb5_690x400.jpg " style=" background-size: cover;">
    <div class="container">
        <h1 class="display-2 my-3" style="color: rgb(218, 152, 66);"><c:out value="${team.tName}"/></h1>
            <a href="/dashboard" style="color: rgb(102, 27, 201);">Dashboard</a> 
        <hr>
        <br>
        <br>
        <br>
        <p>Added By: <c:out value="${team.user.name}"/></p>
        <p>Skill Level: <c:out value="${team.level}"/></p>
        <p>Game Day: <c:out value="${team.day}"/></p>
        <hr>
            <c:if test="${userId==team.user.id}">
                <a href="/teams/${team.id}/edit" class="btn btn-primary">Edit</a>
                <form action="/teams/${team.id}" method="POST">
                    <input type="hidden" name="_method" value="delete" />
                    <input class="btn btn-danger" type="submit" value="Delete" />
                </form>
            </c:if>
    </div>
</body>
</html>