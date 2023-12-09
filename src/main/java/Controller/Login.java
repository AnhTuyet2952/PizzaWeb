package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.ErrorBean;
import Database.CustomerDAO;
import Database.UsersDAO;
import Model.Customer;
import Model.Users;
import util.PasswordEncryption;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Login() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("login.jsp");
		dispatcher.forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = PasswordEncryption.toSHA1(password);
		boolean check_error=false;

		//kiem tra password
		if(password == null || password.trim().length()==0){
			check_error = true;
			request.setAttribute("e_password", "chua nhap mat khau");
		}
		
		UsersDAO userDAO =  new UsersDAO();
		Users user = userDAO.selectByUsernamePassword(username, password);
	
		String url="";


        if(user!=null) {
       	 HttpSession session = request.getSession();
       	 session.setAttribute("admin", user);
       	 url = "/admin/index.jsp";
       	 response.sendRedirect(request.getContextPath() + url);
           
       	 
        }else {
        	 CustomerDAO test =  new CustomerDAO();
    		 Customer customer = test.selectByUsernamePassword(username, password);


             if(customer!=null) {
            	 HttpSession session = request.getSession();
            	 session.setAttribute("customer", customer);
            	 url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
            	 response.sendRedirect(request.getContextPath() + url);
                
            	 
             }else {
            	 request.setAttribute("Error", "ten dang nhap hoac mat khau chua chinh xac!");
            	 ErrorBean eb = new ErrorBean();
            	 eb.setError((String)request.getAttribute("Error"));
            	 request.setAttribute("errorBean", eb);
            	 
            	 url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp";
                 response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
                 return;
             }
        }
		
		
		
       
	}

}