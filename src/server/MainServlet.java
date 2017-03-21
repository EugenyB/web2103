package server;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by yevge on 21.03.2017.
 */
@WebServlet(name = "MainServlet", urlPatterns = {"*.html"})
public class MainServlet extends HttpServlet {
    List<String> strings;

    @Override
    public void init() throws ServletException {
        super.init();
        strings = new ArrayList<>();
        Properties properties = new Properties();
        try {
            properties.load(new FileReader("props.ini"));
            String filename = properties.getProperty("filename");
            BufferedReader reader = new BufferedReader(new FileReader(filename));
            String line;
            while ((line=reader.readLine())!=null) {
                strings.add(line);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("list", strings);
        request.setAttribute("name", "Qwerty");
        request.getRequestDispatcher("/hello.jsp").forward(request,response);
    }
}
