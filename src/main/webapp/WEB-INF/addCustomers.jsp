<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Customer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp" />
</head>
<body>
    <div class="container">
        <div class="form-card">
            <h1>👤 Add New Customer</h1>

            <form action="addCustomers" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="surname">Surname</label>
                    <input type="text" id="surname" name="surname" required>
                </div>

                <div class="form-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <input type="submit" value="Add Customer" class="btn btn-primary">
            </form>
        </div>

        <div class="nav-links">
            <a href="customers" class="btn btn-secondary">← Back to Customers</a>
            <a href="./index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
