<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp"/>
</head>
<body>
<%List<Customer> customers = (List<Customer>) request.getAttribute("customers");%>
<%User user = (User) session.getAttribute("user");%>
<div class="container">
    <div class="header">
        <h1>👥 Customers</h1>
        <%if (user.getRole() == UserRole.ADMIN) {%>
            <a href="addCustomers" class="btn btn-primary">+ Add New Customer</a>
        <%}%>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>License Number</th>
                <th>Phone</th>
                <th>Email</th>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <th>Actions</th>
                <%}%>
            </tr>
            </thead>
            <tbody>
            <%for (Customer customer : customers) {%>
            <tr>
                <td><%=customer.getId()%>
                </td>
                <td><%=customer.getName()%>
                </td>
                <td><%=customer.getSurname()%>
                </td>
                <td><%=customer.getLicenseNumber()%>
                </td>
                <td><%=customer.getPhone()%>
                </td>
                <td><%=customer.getEmail()%>
                </td>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <td>
                    <div class="actions">
                        <a href="changeCustomers?id=<%=customer.getId()%>" class="action-link">Edit</a>
                        <a href="deleteCustomers?id=<%=customer.getId()%>" class="action-link delete">Delete</a>
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
