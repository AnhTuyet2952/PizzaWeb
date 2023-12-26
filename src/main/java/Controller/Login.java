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
import Database.UserDAO;
import Model.User;
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
		
		UserDAO test =  new UserDAO();
		 User user = test.selectByUsernamePassword(username, password);
        System.out.println("nguoi dung: "+ username);
	
		String url="";


        if(user!=null) {
        	 HttpSession session = request.getSession();
        	 session.setMaxInactiveInterval(30*60);
        	if(user.getRole_id()==1) {
        		 
        		 session.setAttribute("customer", user);
               	 session.setAttribute("admin", user);
                	url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
               	 response.sendRedirect(request.getContextPath() + url);
                   
        	}else {
            	
                if(user!=null) {
               	 session.setAttribute("customer", user);
               	 url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
               	 response.sendRedirect(request.getContextPath() + url);
                   
               	 
                }
           }
       	
       	 
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