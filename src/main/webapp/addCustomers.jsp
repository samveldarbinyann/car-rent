<%--
  Created by IntelliJ IDEA.
  User: samve
  Date: 12.01.2026
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
</head>
<body>
<form action="addCustomer" method="post"><br>
    Name: <input type="text" name="name"><br>
    Surname: <input type="text" name="surname"><br>
    License Number: <input type="text" name="licenseNumber"><br>
    Phone Number: <input type="text" name="phone"><br>
    Email: <input type="text" name="email"><br><br>
    <input type="submit" value="Add Customer">
</form>
<br>
<a href="customers">Customers</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
