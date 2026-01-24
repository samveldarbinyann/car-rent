<%@ page import="model.Car" %>
<%@ page import="model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Rental</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp" />
</head>
<body>
    <%List<Car> cars = (List<Car>) request.getAttribute("cars");%>
    <%List<Customer> customers = (List<Customer>) request.getAttribute("customers");%>

    <div class="container">
        <div class="form-card">
            <h1>📝 Add New Rental</h1>

            <form action="addRentals" method="post">
                <div class="form-group">
                    <label for="customerId">Customer</label>
                    <select id="customerId" name="customerId" required>
                        <option value="">Select Customer</option>
                        <%for (Customer customer : customers) {%>
                        <option value="<%=customer.getId()%>">
                            <%=customer.getName()%> <%=customer.getSurname()%> (<%=customer.getEmail()%>)
                        </option>
                        <%}%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="carId">Car</label>
                    <select id="carId" name="carId" required>
                        <option value="">Select Car</option>
                        <%for (Car car : cars) {%>
                        <option value="<%=car.getId()%>">
                            <%=car.getBrand()%> <%=car.getModel()%> (<%=car.getYear()%>) - $<%=car.getDailyRate()%>/day
                        </option>
                        <%}%>
                    </select>
                </div>

                <div class="date-group">
                    <div class="form-group">
                        <label for="startDate">Start Date</label>
                        <input type="date" id="startDate" name="startDate" required>
                    </div>

                    <div class="form-group">
                        <label for="endDate">End Date</label>
                        <input type="date" id="endDate" name="endDate" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="active">Active</option>
                        <option value="completed">Completed</option>
                        <option value="cancelled">Cancelled</option>
                    </select>
                </div>

                <input type="submit" value="Create Rental" class="btn btn-primary">
            </form>
        </div>

        <div class="nav-links">
            <a href="rentals" class="btn btn-secondary">← Back to Rentals</a>
            <a href="./index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
