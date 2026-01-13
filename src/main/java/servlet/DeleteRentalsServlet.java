package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.RentalService;

import java.io.IOException;

@WebServlet("/deleteRental")
public class DeleteRentalsServlet extends HttpServlet {
    private RentalService rentalService = new RentalService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        rentalService.deleteRental(id);
        resp.sendRedirect("rentals");
    }
}
