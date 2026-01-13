<%@ page import="model.Car" %>
<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Rental</title>
</head>
<body>
<h1>Add New Rental</h1>

<%List<Car> cars = (List<Car>) request.getAttribute("cars");%>
<%List<Customer> customers = (List<Customer>) request.getAttribute("customers");%>

<form action="addRentals" method="post">
    <label>Customer:</label><br>
    <select name="customerId" required>
        <option value="">Select Customer</option>
        <%for (Customer customer : customers) {%>
        <option value="<%=customer.getId()%>">
            <%=customer.getName()%> <%=customer.getSurname()%> (<%=customer.getEmail()%>)
        </option>
        <%}%>
    </select><br><br>

    <label>Car:</label><br>
    <select name="carId" required>
        <option value="">Select Car</option>
        <%for (Car car : cars) {%>
        <option value="<%=car.getId()%>">
            <%=car.getBrand()%> <%=car.getModel()%> (<%=car.getYear()%>) - $<%=car.getDailyRate()%>/day
        </option>
        <%}%>
    </select><br><br>

    <label>Start Date:</label><br>
    <input type="date" name="startDate" required><br><br>

    <label>End Date:</label><br>
    <input type="date" name="endDate" required><br><br>

    <label>Status:</label><br>
    <select name="status" required>
        <option value="active">Active</option>
        <option value="completed">Completed</option>
        <option value="cancelled">Cancelled</option>
    </select><br><br>

    <input type="submit" value="Create Rental">
</form>

<br>
<a href="rentals">Back to Rentals</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
