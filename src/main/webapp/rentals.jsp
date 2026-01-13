<%@ page import="model.Rental" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rentals</title>
</head>
<body>
<%List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");%>
<h1>Rentals</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Car</th>
        <th>Customer</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <%for (Rental rental : rentals) {%>
    <tr>
        <td><%=rental.getId()%>
        </td>
        <td><%=rental.getCar().getBrand()%>
        </td>
        <td><%=rental.getCustomer().getName()%>
        </td>
        <td><%=rental.getStartDate()%>
        </td>
        <td><%=rental.getEndDate()%>
        </td>
        <td><%=rental.getTotalPrice()%>
        </td>
        <td><%=rental.getStatus()%>
        </td>
        <td><a href="deleteRental?id=<%=rental.getId()%>">Delete</a></td>
        <%}%>
    </tr>
</table>
<br>
<a href="addRentals">Add Rental</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
