<%@ page import="model.Car" %>
<%@ page import="model.CarStatus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Car</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp" />
</head>
<body>
    <%Car car = (Car) request.getAttribute("cars");%>
    <div class="container">
        <div class="form-card">
            <h1>✏️ Edit Car</h1>

            <form action="changeCar" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<%=car.getId()%>">

                <% if (car.getPictureName() != null && !car.getPictureName().isEmpty()) { %>
                    <div class="form-group text-center">
                        <label>Current Image</label>
                        <img src="getImage?imagePath=<%= car.getPictureName()%>" width="200" style="border-radius: 8px; margin-top: 0.5rem;"/>
                    </div>
                <% } %>

                <div class="form-group">
                    <label for="image">Change Image</label>
                    <input type="file" id="image" name="image" class="btn btn-secondary" style="width: 100%; border: 1px dashed var(--border-color); padding: 1rem; background: #f8fafc;">
                </div>

                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" id="brand" name="brand" value="<%=car.getBrand()%>" required>
                </div>

                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" id="model" name="model" value="<%=car.getModel()%>" required>
                </div>

                <div class="form-group">
                    <label for="year">Year</label>
                    <input type="number" id="year" name="year" value="<%=car.getYear()%>" required>
                </div>

                <div class="form-group">
                    <label for="dailyRate">Daily Price ($)</label>
                    <input type="number" id="dailyRate" name="dailyRate" value="<%=car.getDailyRate()%>" step="0.01" required>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="AVAILABLE" <%= car.getStatus() == CarStatus.AVAILABLE ? "selected" : "" %>>Available</option>
                        <option value="RENTED" <%= car.getStatus() == CarStatus.RENTED ? "selected" : "" %>>Rented</option>
                        <option value="MAINTENANCE" <%= car.getStatus() == CarStatus.MAINTENANCE ? "selected" : "" %>>Maintenance</option>
                    </select>
                </div>

                <input type="submit" value="Update Car" class="btn btn-primary">
            </form>
        </div>

        <div class="nav-links">
            <a href="cars" class="btn btn-secondary">← Back to Cars</a>
            <a href="./index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
