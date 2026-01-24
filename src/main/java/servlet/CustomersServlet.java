package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;
import model.User;
import service.CustomerService;

import java.io.IOException;
import java.util.List;

@WebServlet("/customers")
public class CustomersServlet extends HttpServlet {

    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<Customer> customers = customerService.getAllCustomers();
            req.setAttribute("customers", customers);
            req.getRequestDispatcher("/WEB-INF/customers.jsp").forward(req, resp);
    }
}
