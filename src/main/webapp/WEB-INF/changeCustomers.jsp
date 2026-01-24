<%@ page import="model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp" />
</head>
<body>
    <%Customer customer = (Customer) request.getAttribute("customers");%>
    <div class="container">
        <div class="form-card">
            <h1>✏️ Edit Customer</h1>

            <form action="changeCustomers" method="post">
                <input type="hidden" name="id" value="<%=customer.getId()%>">

                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%=customer.getName()%>" required>
                </div>

                <div class="form-group">
                    <label for="surname">Surname</label>
                    <input type="text" id="surname" name="surname" value="<%=customer.getSurname()%>" required>
                </div>

                <div class="form-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" value="<%=customer.getLicenseNumber()%>" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" value="<%=customer.getPhone()%>" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%=customer.getEmail()%>" required>
                </div>

                <input type="submit" value="Update Customer" class="btn btn-primary">
            </form>
        </div>

        <div class="nav-links">
            <a href="customers" class="btn btn-secondary">← Back to Customers</a>
            <a href="./index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
