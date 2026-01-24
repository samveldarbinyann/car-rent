package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import model.User;

import java.io.IOException;

@WebFilter(urlPatterns = {"/cars", "/customers", "/rentals", "/addCars", "/addCustomers", "/addRentals"})
public class UserAuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        if(servletRequest instanceof HttpServletRequest request) {
            User user = (User) request.getSession().getAttribute("user");
            if(user == null) {
                request.getRequestDispatcher("home").forward(request, servletResponse);
            } else {
                chain.doFilter(servletRequest, servletResponse);
            }
        }
    }
}
