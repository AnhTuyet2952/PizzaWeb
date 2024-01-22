package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.group.interceptors.MessageDispatchInterceptorMBean;

import Beans.ErrorBean;
import Database.UserDAO;
import Model.User;
import util.Email;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
	
		
		UserDAO customerDAO = new UserDAO();
		User customer = customerDAO.selectByEmail2(email);
		System.out.println(customerDAO.selectByEmail(email));
		if(customer!=null) {
			HttpSession mySession = request.getSession();
			mySession.setAttribute("customerId", customer.getUserId());
			
			int otpvalue = 0;
			
			
			if(email!=null || !email.equals("")) {
				// sending otp
				Random rand = new Random();
				otpvalue = rand.nextInt(1255650);

				String to = email;// change accordingly
				// Get the session object
				Email.sendEmail(email, "Mã OTP của bạn: " + otpvalue, "Xin chào");
				System.out.println("message sent successfully");
				request.setAttribute("otp", otpvalue);
				
				mySession.setAttribute("otp",otpvalue); 
				mySession.setAttribute("email",email); 
				request.setAttribute("message","Mã OTP đã được gửi tới email của bạn!");
				String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/EnterOtp.jsp";
	             response.sendRedirect(url);
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				
				
				//request.setAttribute("status", "success");
			}
		}
		else {
			 request.setAttribute("Error", "Email đăng ký không tồn tại, vui lòng nhập lại email khác!");
        	 ErrorBean eb = new ErrorBean();
        	 eb.setError((String)request.getAttribute("Error"));
        	 request.setAttribute("errorBean", eb);
        	 
        	 String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/forgotPassword.jsp";
             response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
             return;
		}
		
		
	}
	

}