<%@ page import="model.Rental" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rentals</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp"/>
</head>
<body>
<%List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");%>
<%User user = (User) session.getAttribute("user");%>
<div class="container">
    <div class="header">
        <h1>📋 Rentals</h1>
        <%if (user.getRole() == UserRole.ADMIN) {%>
            <a href="addRentals" class="btn btn-primary">+ Add New Rental</a>
        <%}%>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Car</th>
                <th>Customer</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Total Price</th>
                <th>Status</th>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <th>Actions</th>
                <%}%>
            </tr>
            </thead>
            <tbody>
            <%for (Rental rental : rentals) {%>
            <tr>
                <td><%=rental.getId()%>
                </td>
                <td><%=rental.getCar().getBrand()%> <%=rental.getCar().getModel()%>
                </td>
                <td><%=rental.getCustomer().getName()%> <%=rental.getCustomer().getSurname()%>
                </td>
                <td><%=rental.getStartDate()%>
                </td>
                <td><%=rental.getEndDate()%>
                </td>
                <td>$<%=rental.getTotalPrice()%>
                </td>
                <td>
                            <span class="status status-<%=rental.getStatus()%>">
                                <%=rental.getStatus()%>
                            </span>
                </td>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <td>
                    <div class="actions">
                        <a href="deleteRental?id=<%=rental.getId()%>" class="action-link delete">Delete</a>
                    </div>
                </td>
                <%}%>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>

    <div class="nav-links">
        <a href="./index.jsp" class="btn btn-secondary">← Back to Home</a>
    </div>
</div>
</body>
</html>
