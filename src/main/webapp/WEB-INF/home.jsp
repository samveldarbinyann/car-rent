<%@ page import="model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Car Rental System</title>
    <jsp:include page="/includes/head.jsp"/>
</head>
<%User user = (User) session.getAttribute("user");%>
<body>
<div class="container">
    <div class="header">
        <h1>🚗 Car Rental</h1>
        <div class="flex items-center gap-2">
            <%if (user == null) {%>
                <a href="login" class="btn btn-secondary">Login</a>
                <a href="register" class="btn btn-primary">Register</a>
            <%} else {%>
                <span><%=user.getName() + " " + user.getSurname()%></span>
                <a href="logout" class="btn btn-secondary">Logout</a>
            <%}%>
        </div>
    </div>

    <div class="text-center">
        <p class="subtitle">System for managing your car rental business efficiently.</p>
    </div>

    <div class="nav-cards">
        <a href="cars" class="nav-card">
            <span>🚗 Cars</span>
            <p class="text-muted mt-4">Manage fleet and status</p>
        </a>
        <a href="customers" class="nav-card">
            <span>👥 Customers</span>
            <p class="text-muted mt-4">Client information</p>
        </a>
        <a href="rentals" class="nav-card">
            <span>📋 Rentals</span>
            <p class="text-muted mt-4">Active and past rentals</p>
        </a>
    </div>
</div>
</body>
</html>