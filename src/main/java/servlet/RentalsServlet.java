package servlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Rental;
import service.RentalService;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;

@WebServlet(value = "/rentals")
public class RentalsServlet extends HttpServlet {
    private RentalService rentalService = new RentalService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Rental> rentals = rentalService.getAllRentals();
        req.setAttribute("rentals", rentals);
        req.getRequestDispatcher("/rentals.jsp").forward(req, resp);
    }
}
