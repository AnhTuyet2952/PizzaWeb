package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.ErrorBean;
import Database.UserDAO;
import Model.User;

/**
 * Servlet implementation class ChangeInformation
 */
@WebServlet("/changeInformation")
public class ChangeInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangeInformation() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession sesion  = request.getSession();
		String id = request.getParameter("user_id");
		System.out.println("id: "+id);
		String username = request.getParameter("username");
		String sexual = request.getParameter("gender");
		System.out.println("gender: "+sexual);
		String birthday = request.getParameter("birthday");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		 java.util.Date date=null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");

		String url="";
		String error = "";
		ErrorBean eb = new ErrorBean();
		
		
		UserDAO customerDAO = new UserDAO();
		User customer = customerDAO.selectById(id);
		if(customer==null) {
			eb.setError("Vui long dang nhap de sua thong tin ca nhan!");
			url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
		}else
		
	
		 if(customerDAO.selectByUsername(username)&&!customer.getUsername().equals(username)) {
			eb.setError("ten dang nhap da ton tai, vui long chon ten dang nhap khac!");
			request.setAttribute("name", "");
			request.setAttribute("errorBean", eb);
			error+=eb.getError();
			url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changeInformation.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;

		 }else
		 if(username.length()>25) {
			 eb.setError("ten dang nhap khong duoc qua 25 ky tu!");
				request.setAttribute("name", "");
				request.setAttribute("errorBean", eb);
				error+=eb.getError();
				url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changeInformation.jsp";
	            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	            return;
		 }else
		 if(customerDAO.selectByEmail(email)&&!customer.getEmail().equals(email)) {
				eb.setError("ten email da ton tai, vui long chon email khac!");
				request.setAttribute("name", "");
				request.setAttribute("errorBean", eb);
				error+=eb.getError();
				url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changeInformation.jsp";
	            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	            return;

			}
		//kiem tra sdt co hop le khong
		
		
		if((phoneNumber.length()!=10)||!phoneNumber.startsWith("0")) {
			error+="số điện thoại nhập vào không hợp lệ, vui lòng nhập bắt đầu từ số 0 và gồm 10 chữ số!";
			request.setAttribute("Error", error);
			eb = new ErrorBean();
       	    eb.setError((String)request.getAttribute("Error"));
       	    request.setAttribute("errorBean", eb);
       	    url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changeInformation.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
		}
        try {
            // Chuyển chuỗi thành đối tượng Date
             date =dateFormat.parse(birthday);
             java.sql.Date sqlDate = new java.sql.Date(date.getTime());
             customer.setBirthday(sqlDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
	    customer.setEmail(email);
	    customer.setGt(sexual);
        customer.setPhoneNumber(phoneNumber);
        customer.setUsername(username);
		
		
		if(customer!=null) {
			customerDAO.update(customer);
			 url = "/pizza-gh-pages/pizza-gh-pages/index.jsp";
			 System.out.println(customer);
        	 response.sendRedirect(request.getContextPath() + url);
        	 return;
		}else {
			request.setAttribute("Error", error);
		   
       	    eb.setError((String)request.getAttribute("Error"));
       	    request.setAttribute("errorBean", eb);
       	    url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/changeInformation.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
