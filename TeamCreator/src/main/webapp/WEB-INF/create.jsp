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
    <title>Create</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body background=" https://www.gofieldops.com/wp-content/uploads/2021/11/soccer.jpg" style=" background-size: cover;">
    <div class="container">
        <h1 class="display-2 my-3">New Team</h1>
        <div>
            <a href="/dashboard" style="color: rgb(102, 27, 201);">Dashboard</a>
        </div>
        <div class="card-shadow">
            <div class="card-body">
                <form:form action="/teams" modelAttribute="team" method="POST">
                    <div class="mb-3">
                        <form:label path="tName" class="form-label">Team Name</form:label>
                        <form:input path="tName" class="form-control" type="text" />
                        <form:errors path="tName" class="form-text-warning"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="level" class="form-label">Skill Level (1-5)</form:label>
                        <form:input path="level" class="form-control" type="number" />
                        <form:errors path="level" class="form-text-warning"/>
                    </div>
                    <div class="mb-3">
                        <form:label path="day" class="form-label">Game Day</form:label>
                        <form:textarea path="day" class="form-control"/>
                        <form:errors path="day" class="form-text-warning"/>
                    </div>
                    <div class="mb-3">
                        <form:errors path="user" class="error"/>
                        <form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-dark">Submit</button>
                    </div>
                </form:form>
            </div>
        </div>

    </div>
</body>
</html>