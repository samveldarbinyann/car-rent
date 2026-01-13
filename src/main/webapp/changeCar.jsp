<%@ page import="model.Car" %><%--
  Created by IntelliJ IDEA.
  User: samve
  Date: 12.01.2026
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Car</title>
</head>
<%Car car = (Car) request.getAttribute("cars");%>
<body>
<form action="changeCar" method="post">
    <input type="hidden" name="id" value="<%=car.getId()%>">
    Brand: <input type="text" name="brand" value="<%=car.getBrand()%>"><br>
    Model: <input type="text" name="model" value="<%=car.getModel()%>"><br>
    Year: <input type="number" name="year" value="<%=car.getYear()%>"><br>
    Daily Price: <input type="number" name="dailyRate" value="<%=car.getDailyRate()%>"><br>
    Status: <input type="text" name="status" value="<%=car.getStatus()%>"><br>
    <input type="submit" value="Change">
</form>
<a href="cars">Back</a>
</body>
</html>
