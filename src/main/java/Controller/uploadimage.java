package Controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Database.UserDAO;
import Model.User;

/**
 * Servlet implementation class uploadimage
 */
@WebServlet("/uploadimage")
@MultipartConfig
public class uploadimage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private UserDAO userDAO;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        userDAO = new UserDAO();
	    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String uploadPath = "D:/AnhTuyet/pizza_web/src/main/webapp/image/";
		    String userId = request.getParameter("userId");
		    String url = "";

		    HttpSession session = request.getSession();
		    User customer = (User) session.getAttribute("customer");
		    // Kiểm tra đăng nhập
		    if (customer == null) {
		        response.sendRedirect(request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp");
		        return;
		    }
		    System.out.println("avatar: "+customer.getAvatar());

		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs();
		    }

		    Part filePart = request.getPart("avatar");
		    String fileName = filePart.getSubmittedFileName();

		    try (InputStream is = filePart.getInputStream()) {
		        Files.copy(is, new File(uploadPath, fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
		    }

		    String newAvatarPath = "image/" + fileName;

		    // Cập nhật thông tin người dùng
		    customer.setAvatar(newAvatarPath);
		    userDAO.updateAvatar(customer);

		    // Cập nhật thông tin người dùng trong session
		    session.setAttribute("customer", customer);

		    url = request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/profile.jsp";
		    response.sendRedirect(url);
	}
	public static void main(String[] args) {
        String path = "D:/AnhTuyet/pizza_web/images/img/";
        File file = new File(path);

        if (file.exists() && file.isDirectory()) {
            System.out.println("Directory exists.");
            File[] files = file.listFiles();
            for (File f : files) {
                System.out.println("File: " + f.getName());
            }
        } else {
            System.out.println("Directory does not exist.");
        }
    }
}
