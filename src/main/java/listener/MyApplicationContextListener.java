package listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.annotation.WebServlet;

import java.util.Date;

@WebListener
public class MyApplicationContextListener implements ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Application stopped " + new Date(System.currentTimeMillis()));
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Application started " + new Date(System.currentTimeMillis()));
    }
}
