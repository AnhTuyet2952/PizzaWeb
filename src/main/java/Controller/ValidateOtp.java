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


/**
 * Servlet implementation class ValidateOtp
 */
@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateOtp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		try {
			int value=Integer.parseInt(request.getParameter("otp"));
		} catch (NumberFormatException e) {
			request.setAttribute("message","Sai mã OTP");
	       	 ErrorBean eb = new ErrorBean();
	       	 eb.setError((String)request.getAttribute("message"));
	       	 request.setAttribute("errorBean", eb);
	       	 
	       	  String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/EnterOtp.jsp";
	            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	            return;
		}
		int value=Integer.parseInt(request.getParameter("enterOtp"));
		System.out.println("value: "+ value);
		int otp= (int) session.getAttribute("otp");
		System.out.println("otp: "+ otp);
		
		
		RequestDispatcher dispatcher=null;
		
		
		if (value==otp) {
			
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("status", "success");
				session.removeAttribute("otp");
			String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/newPassword.jsp";
            response.sendRedirect(url);
			
		}
		else{
			request.setAttribute("message","Sai mã OTP");
       	 ErrorBean eb = new ErrorBean();
       	 eb.setError((String)request.getAttribute("message"));
       	 request.setAttribute("errorBean", eb);
       	 
       	  String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/EnterOtp.jsp";
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
