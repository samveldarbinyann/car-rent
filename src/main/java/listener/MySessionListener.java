package listener;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import java.util.Date;

@WebListener
public class MySessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session created " + new Date(System.currentTimeMillis()) + " for session id: " + se.getSession().getId());
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("Session destroyed " + new Date(System.currentTimeMillis()) + " for session id: " + se.getSession().getId());
    }
}
