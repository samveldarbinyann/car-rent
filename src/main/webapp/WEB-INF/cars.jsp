<%@ page import="model.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.UserRole" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cars</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp"/>
</head>
<body>
<%List<Car> cars = (List<Car>) request.getAttribute("cars");%>
<%User user = (User) session.getAttribute("user");%>
<div class="container">
    <div class="header">
        <h1>🚗 Cars</h1>
        <%if (user.getRole() == UserRole.ADMIN) {%>
            <a href="addCars" class="btn btn-primary">+ Add New Car</a>
        <%}%>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Year</th>
                <th>Daily Rate</th>
                <th>Status</th>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <th>Actions</th>
                <%}%>
            </tr>
            </thead>
            <tbody>
            <%for (Car car : cars) {%>
            <tr>
                <td><%= car.getId() %>
                </td>
                <td>
                    <% if (car.getPictureName() != null && !car.getPictureName().isEmpty()) { %>
                        <img src="getImage?imagePath=<%= car.getPictureName()%>" width="80" style="border-radius: 4px; object-fit: cover; aspect-ratio: 16/9;"/>
                    <% } else { %>
                        <div style="width: 80px; height: 45px; background: #f1f5f9; display: flex; align-items: center; justify-content: center; border-radius: 4px; font-size: 10px; color: #94a3b8;">No Image</div>
                    <% } %>
                </td>
                <td><%= car.getBrand() %>
                </td>
                <td><%= car.getModel() %>
                </td>
                <td><%= car.getYear() %>
                </td>
                <td>$<%= car.getDailyRate() %>/day</td>
                <td>
                            <span class="status status-<%= car.getStatus().toString().toLowerCase() %>">
                                <%= car.getStatus() %>
                            </span>
                </td>
                <%if (user.getRole() == UserRole.ADMIN) {%>
                <td>
                    <div class="actions">
                        <a href="changeCar?id=<%=car.getId()%>" class="action-link">Edit</a>
                        <a href="deleteCar?id=<%= car.getId() %>" class="action-link delete">Delete</a>
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
