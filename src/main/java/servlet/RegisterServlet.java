package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import model.UserRole;
import service.UserService;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserRole role = UserRole.valueOf(req.getParameter("role"));

        if (userService.getUserByUsername(username) != null) {
            req.getSession().setAttribute("message", "Username already exists!");
            resp.sendRedirect("register");
        } else {
            User user = new User();
            user.setName(name);
            user.setSurname(surname);
            user.setUsername(username);
            user.setPassword(password);
            user.setRole(role);

            userService.addUser(user);
            req.getSession().setAttribute("message", "User registered successfully!");
            resp.sendRedirect("login");
        }
    }
}
