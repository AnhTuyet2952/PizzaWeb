package Controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class ChangeLanguage
 */
@WebServlet("/changeLanguage")
public class ChangeLanguage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String language = request.getParameter("lang");
        request.getSession().setAttribute("language", language);
        response.sendRedirect(request.getHeader("Referer"));
//        System.out.println("Language parameter: " + request.getParameter("lang"));

    }
    
}

