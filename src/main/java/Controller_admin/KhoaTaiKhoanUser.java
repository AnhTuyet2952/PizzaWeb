package Controller_admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.UserDAO;
import Model.User;

/**
 * Servlet implementation class KhoaTaiKhoanUser
 */
@WebServlet("/KhoaTaiKhoanUser")
public class KhoaTaiKhoanUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhoaTaiKhoanUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String url = "";
		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectById(userId);
		if(user != null) {
			user.setRole_id(3);
			userDAO.updateRole(user);
			url = "/admin/pages/ui-features/khoamotaikhoan.jsp";	
	   	    response.sendRedirect(request.getContextPath() + url);
		}
	}

}
