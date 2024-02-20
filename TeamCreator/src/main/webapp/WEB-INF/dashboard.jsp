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
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body background="https://cdn.create.vista.com/api/media/small/150618774/stock-photo-panoramic-view-of-soccer-field" style=" background-size: cover;">
    <div class="container">
        <h1 class="display-2 my-3" style=" color: rgb(38, 192, 71) ;">Welcome, ${user.name}!</h1>
        <a href="/logout" style="color: rgb(247, 5, 5);">Log Out</a>
        <table class="table">
            <tr>
                <th>Team Name</th>
                <th>Skill Level</th>
                <th>Game Day</th>
            </tr>
            <c:forEach var="team" items="${teams}">
                <tr>
                    <td><a href="teams/${team.id}"><c:out value="${team.tName}"/></a></td>
                    <td><c:out value="${team.level}"/></td>
                    <td><c:out value="${team.day}"/></td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <a href="/create" class="btn btn-success btn-lg btn-clock">Create</a>
        </div>
    </div>
</body>
</html>