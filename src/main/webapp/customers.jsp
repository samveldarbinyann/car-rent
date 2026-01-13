<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers</title>
</head>
<body>
<%List<Customer> customers = (List<Customer>) request.getAttribute("customers");%>
<h1>Customers</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Surname</th>
        <th>License Number</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    <%for (Customer customer : customers) {%>
    <tr>
        <td><%=customer.getId()%></td>
        <td><%=customer.getName()%></td>
        <td><%=customer.getSurname()%></td>
        <td><%=customer.getLicenseNumber()%></td>
        <td><%=customer.getPhone()%></td>
        <td><%=customer.getEmail()%></td>
        <td><a href="deleteCustomers?id=<%=customer.getId()%>">Delete | <a href="changeCustomers?id=<%=customer.getId()%>">Change</a></a></td>
    </tr>
    <%}%>
</table>
<br>
<a href="addCustomer">Add Customer</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
