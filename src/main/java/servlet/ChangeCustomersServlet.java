package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;
import service.CustomerService;

import java.io.IOException;

@WebServlet("/changeCustomers")
public class ChangeCustomersServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        req.setAttribute("customers", customerService.getCustomerById(id));
        req.getRequestDispatcher("/WEB-INF/changeCustomers.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = customerService.getCustomerById(id);
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String licenseNumber = req.getParameter("licenseNumber");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");

        customer.setName(name);
        customer.setSurname(surname);
        customer.setLicenseNumber(licenseNumber);
        customer.setPhone(phone);
        customer.setEmail(email);
        customerService.updateCustomer(customer);
        resp.sendRedirect("customers");
    }
}
