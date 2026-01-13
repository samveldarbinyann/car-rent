<%@ page import="model.Car" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cars</title>
</head>

<body>
<%List<Car> cars = (List<Car>) request.getAttribute("cars");%>
<h1>Cars</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Year</th>
        <th>Daily Rate</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <%for (Car car : cars) {%>
    <tr>
        <td><%= car.getId() %>
        </td>
        <td><%= car.getBrand() %>
        </td>
        <td><%= car.getModel() %>
        </td>
        <td><%= car.getYear() %>
        </td>
        <td><%= car.getDailyRate() %>
        </td>
        <td><%= car.getStatus() %>
        </td>
        <td><a href="deleteCar?id=<%= car.getId() %>">Delete | <a href="changeCar?id=<%=car.getId()%>">Change</a></a>
        </td>
    </tr>
    <%}%>
</table>
<br>
<a href="addCars">Add Car</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
