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

@WebServlet("/addCars")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10, fileSizeThreshold = 1024 * 1024 * 2)
public class AddCarsServlet extends HttpServlet {

    private CarService carService = new CarService();
    private static final String UPLOAD_DIRECTORY = "C:\\Users\\samve\\car-rent\\upload-images\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/addCars.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = req.getParameter("year") == null ? 0 : Integer.parseInt(req.getParameter("year"));
        double dailyRate = req.getParameter("dailyRate") == null ? 0 : Double.parseDouble(req.getParameter("dailyRate"));
        String status = req.getParameter("status");
        Part image = req.getPart("image");
        String fileName = System.currentTimeMillis() + "_" + image.getSubmittedFileName();
        image.write(UPLOAD_DIRECTORY + fileName);

        Car car = new Car();
        car.setBrand(brand);
        car.setModel(model);
        car.setYear(year);
        car.setDailyRate(dailyRate);
        if(status != null){
            car.setStatus(CarStatus.valueOf(status.toUpperCase()));
        }
        car.setPictureName(fileName);
        carService.addCar(car);
        resp.sendRedirect("cars");
    }
}
