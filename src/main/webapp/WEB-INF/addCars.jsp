<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Car</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="/includes/head.jsp" />

</head>
<body>
    <div class="container">
        <div class="form-card">
            <h1>🚗 Add New Car</h1>

            <form action="addCars" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="brand">Brand</label>
                    <input type="text" id="brand" name="brand" required>
                </div>

                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" id="model" name="model" required>
                </div>

                <div class="form-group">
                    <label for="year">Year</label>
                    <input type="number" id="year" name="year" required>
                </div>

                <div class="form-group">
                    <label for="dailyRate">Daily Price ($)</label>
                    <input type="number" id="dailyRate" name="dailyRate" step="0.01" required>
                </div>

                <div class="form-group">
                    <label for="status">Status</label>
                    <select id="status" name="status" required>
                        <option value="AVAILABLE">Available</option>
                        <option value="RENTED">Rented</option>
                        <option value="MAINTENANCE">Maintenance</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Car Image</label>
                    <input type="file" name="image" class="btn btn-secondary" style="width: 100%; border: 1px dashed var(--border-color); padding: 2rem; background: #f8fafc;">
                </div>

                <input type="submit" value="Add Car" class="btn btn-primary">
            </form>
        </div>

        <div class="nav-links">
            <a href="cars" class="btn btn-secondary">← Back to Cars</a>
            <a href="./index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
</body>
</html>
