<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Cars</title>
</head>
<body>

<form action="addCars" method="post">
    Brand: <input type="text" name="brand"><br>
    Model: <input type="text" name="model"><br>
    Year: <input type="number" name="year"><br>
    Daily Price: <input type="number" name="dailyRate"><br>
    Status: <select name="status">
    <option value="AVAILABLE">Available</option>
    <option value="RENTED">Rented</option>
    <option value="MAINTENANCE">Maintenance</option>
</select><br><br>
    <input type="submit" value="Add Car">
</form>
<br>
<a href="cars">Cars</a><br>
<a href="index.jsp">Back to Home Page</a>
</body>
</html>
