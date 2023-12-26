package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.ErrorBean;
import Database.UserDAO;
import Model.User;
import util.PasswordEncryption;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		        HttpSession session = request.getSession();
		        String id = (String) session.getAttribute("customerId");
		        
				String password = request.getParameter("password");

				password = PasswordEncryption.toSHA1(password);
				
				UserDAO customerDAO = new UserDAO();
				User customer = customerDAO.selectById(id);
				System.out.println(customer);
				String url="";
				if(customer!=null) {
					customer.setPassword(password);
					customerDAO.update(customer);
					 url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
		        	 response.sendRedirect(request.getContextPath() + url);
				}else {
					 request.setAttribute("Error", "mat khau chua chinh xac!");
					 ErrorBean eb = new ErrorBean();
		        	 eb.setError((String)request.getAttribute("Error"));
		        	 request.setAttribute("errorBean", eb);
		        	 url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changePassword.jsp";
		             response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
		             return;
		        	
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}