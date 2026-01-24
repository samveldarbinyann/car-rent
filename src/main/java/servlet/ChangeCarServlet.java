package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Car;
import model.CarStatus;
import service.CarService;

import java.io.IOException;

@WebServlet("/changeCar")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 2)
public class ChangeCarServlet extends HttpServlet {
    private CarService carService = new CarService();
    private static final String UPLOAD_DIRECTORY = "C:\\Users\\samve\\car-rent\\upload-images\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("cars", carService.getCarById(id));
        req.getRequestDispatcher("/WEB-INF/changeCar.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Car car = carService.getCarById(id);
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        double dailyRate = Double.parseDouble(req.getParameter("dailyRate"));
        String status = req.getParameter("status");

        Part imagePart = req.getPart("image");
        if (imagePart != null && imagePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
            imagePart.write(UPLOAD_DIRECTORY + fileName);
            car.setPictureName(fileName);
        }

        car.setBrand(brand);
        car.setModel(model);
        car.setYear(year);
        car.setDailyRate(dailyRate);
        car.setStatus(CarStatus.valueOf(status.toUpperCase()));
        carService.updateCar(car);
        resp.sendRedirect("cars");
    }
}
