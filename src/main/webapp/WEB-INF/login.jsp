<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Car Rental</title>
    <jsp:include page="/includes/head.jsp"/>
</head>
<body>
<div class="container">
    <div class="form-card">
        <h1 class="text-center">Login</h1>
        <p class="text-muted text-center mt-4">Welcome back! Please enter your details.</p>

        <%String message = (String) session.getAttribute("message"); %>
        <%if (message != null && !message.isEmpty()) {%>
            <div style="background: #fee2e2; color: #991b1b; padding: 0.75rem; border-radius: 4px; margin-bottom: 1.5rem; font-size: 0.875rem;">
                <%=message%>
            </div>
            <%session.removeAttribute("message");%>
        <%}%>

        <form action="login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="••••••••" required>
            </div>
            <input type="submit" value="Sign In" class="btn btn-primary" style="width: 100%">
        </form>

        <div class="text-center mt-4">
            <p class="text-muted" style="font-size: 0.875rem;">
                Don't have an account? <a href="register" style="color: var(--primary-color); font-weight: 600; text-decoration: none;">Register</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
