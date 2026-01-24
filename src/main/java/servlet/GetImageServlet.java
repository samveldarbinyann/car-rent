package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet("/getImage")
public class GetImageServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "C:\\Users\\samve\\car-rent\\upload-images\\";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imagePath = req.getParameter("imagePath");
        File file = new File(UPLOAD_DIRECTORY + imagePath);
        if(!file.exists()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
            return;
        }

        resp.setContentType("image/jpeg");
        resp.setHeader("Content-Disposition", "inline; filename=" + file.getName());
        ServletOutputStream outputStream = resp.getOutputStream();
        try(InputStream inputStream = Files.newInputStream(Paths.get(file.getAbsolutePath()))){
            IOUtils.copy(inputStream, outputStream);
        }
    }
}
