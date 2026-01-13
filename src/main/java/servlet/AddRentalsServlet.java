package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Car;
import model.Customer;
import model.Rental;
import service.CarService;
import service.CustomerService;
import service.RentalService;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/addRentals")
public class AddRentalsServlet extends HttpServlet {
    private CarService carService = new CarService();
    private CustomerService customerService = new CustomerService();
    private RentalService rentalService = new RentalService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Car> cars = carService.searchAvailableCars();
        List<Customer> customers = customerService.getAllCustomers();
        
        req.setAttribute("cars", cars);
        req.setAttribute("customers", customers);
        req.getRequestDispatcher("addRentals.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int carId = Integer.parseInt(req.getParameter("carId"));
            int customerId = Integer.parseInt(req.getParameter("customerId"));
            String startDateStr = req.getParameter("startDate");
            String endDateStr = req.getParameter("endDate");
            String status = req.getParameter("status");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(startDateStr);
            Date endDate = sdf.parse(endDateStr);

            Car car = carService.getCarById(carId);
            Customer customer = customerService.getCustomerById(customerId);

            Rental rental = new Rental();
            rental.setCar(car);
            rental.setCustomer(customer);
            rental.setStartDate(startDate);
            rental.setEndDate(endDate);
            rental.setStatus(status);

            rentalService.totalPrice(rental);
            rentalService.createRental(rental);

            resp.sendRedirect("rentals");
        } catch (Exception e) {
            throw new ServletException(e.getMessage(), e);
        }
    }
}




