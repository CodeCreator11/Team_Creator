<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- c:out ; c:forEach etc. -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Formatting (dates) -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- form:form -->
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!-- for rendering errors on PUT routes -->
                <%@ page isErrorPage="true" %>
                    <!DOCTYPE html>
                    <html lang="en" data-bs-theme="dark">

                    </html>

                    <head>
                        <meta charset="UTF-8">
                        <title>Teams Creator</title>
                        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
                        <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
                        <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
                        <script type="text/javascript" src="/js/app.js"></script>
                        <!-- change to match your file/naming structure -->
                    </head>

                    <body background=" https://howardahmansonjr.com/wp-content/uploads/2023/08/AdobeStock_631233452-1-660x371.jpeg" style="background-size: cover;">
                        <div>
                            <img src="/images/logo.png" style="padding: 20px; margin-left: 730px;" alt="logo">
                        </div>
                        <h1 style="text-align: center;margin-top: 5px;">Teams Creator</h1>
                        <h3 style="text-align: center">Create your own soccer team and share it with the world!</h3>
                        <div style="text-align: center;">
                            <a href="/" class="btn btn btn-info" >Enter</a>
                        </div>
                        <div>
                            <h5 style="text-align: end;">By Sophie & Papi</h5>
                        </div>
                    </body>

                    </html>