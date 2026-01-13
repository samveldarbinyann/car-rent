package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Car;
import service.CarService;

import java.io.IOException;

@WebServlet("/addCars")
public class AddCarsServlet extends HttpServlet {

    private CarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addCars.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = req.getParameter("year") == null ? 0 : Integer.parseInt(req.getParameter("year"));
        double dailyRate = req.getParameter("dailyRate") == null ? 0 : Double.parseDouble(req.getParameter("dailyRate"));
        String status = req.getParameter("status");

        Car car = new Car();
        car.setBrand(brand);
        car.setModel(model);
        car.setYear(year);
        car.setDailyRate(dailyRate);
        car.setStatus(status);
        carService.addCar(car);
        resp.sendRedirect("cars");
    }
}
