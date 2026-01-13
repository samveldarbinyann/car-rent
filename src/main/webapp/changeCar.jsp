<%@ page import="model.Car" %>
<%@ page import="model.CarStatus" %><%--
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
    Status: Status:
    <select name="status">
        <option value="AVAILABLE" <%= car.getStatus() == CarStatus.AVAILABLE ? "selected" : "" %>>Available</option>
        <option value="RENTED" <%= car.getStatus() == CarStatus.RENTED ? "selected" : "" %>>Rented</option>
        <option value="MAINTENANCE" <%= car.getStatus() == CarStatus.MAINTENANCE ? "selected" : "" %>>Maintenance</option>
    </select><br><br>
    <input type="submit" value="Change">
</form>
<a href="cars">Back</a>
</body>
</html>
