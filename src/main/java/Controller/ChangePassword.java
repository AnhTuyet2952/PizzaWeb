package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.ErrorBean;
import Database.UserDAO;
import Model.User;
import util.PasswordEncryption;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangePassword() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		
		String password = request.getParameter("password");
		System.out.println("pw"+password);
		String newPassword = request.getParameter("newPassword");
	
		password = PasswordEncryption.toSHA1(password);
		newPassword = PasswordEncryption.toSHA1(newPassword);
		
		
		UserDAO customerDAO = new UserDAO();
		User customer = customerDAO.selectById(user_id);
		String url="";
		ErrorBean eb = new ErrorBean();
		
		if(customer==null) {
			eb.setError("Vui long dang nhap de sua thong tin ca nhan");
			url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
		}else
		System.out.println(customer);
				if(customer!=null) {
			customer.setPassword(newPassword);
			customerDAO.update(customer);
			 url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
        	 response.sendRedirect(request.getContextPath() + url);
		}else {
			 request.setAttribute("Error", "mat khau chua chinh xac!");
			 
        	 eb.setError((String)request.getAttribute("Error"));
        	 request.setAttribute("errorBean", eb);
        	 url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changePassword.jsp";
             response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
             return;
        	
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
