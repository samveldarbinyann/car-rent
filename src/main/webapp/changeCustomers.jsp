<%@ page import="model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: samve
  Date: 12.01.2026
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Customer</title>
</head>
<%Customer customer = (Customer) request.getAttribute("customers");%>
<body>
<form action="changeCustomers" method="post"><br>
    <input type="hidden" name="id" value="<%=customer.getId()%>"><br>
    Name: <input type="text" name="name" value="<%=customer.getName()%>"><br>
    Surname: <input type="text" name="surname" value="<%=customer.getSurname()%>"><br>
    License Number: <input type="text" name="licenseNumber" value="<%=customer.getLicenseNumber()%>"><br>
    Phone Number: <input type="text" name="phone" value="<%=customer.getPhone()%>"><br>
    Email: <input type="text" name="email" value="<%=customer.getEmail()%>"><br><br>
    <input type="submit" value="Change Customer">
</form>
<a href="customers">Customers</a>
</body>
</html>
