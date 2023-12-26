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
import util.Email;

@WebServlet("/register" )
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public Register() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		System.out.println(username);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String enterThePassword = request.getParameter("enterThePassword");
		
		request.setAttribute("username", username);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("password", password);
		request.setAttribute("enterThePassword", enterThePassword);
		
		
		String baoLoi="";
		
		String url ="";
		
		UserDAO cd= new UserDAO();
		ErrorBean eb = new ErrorBean();
		if(cd.selectByUsername(username)) {
			eb.setError("ten dang nhap da ton tai, vui long chon ten dang nhap khac");
			request.setAttribute("name", "");
			request.setAttribute("errorBean", eb);
			baoLoi+=eb.getError();
			url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/authentication-register.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;

		}else if(cd.selectByEmail(email)) {
				eb.setError("ten email da ton tai, vui long chon email khac");
				request.setAttribute("name", "");
				request.setAttribute("errorBean", eb);
				baoLoi+=eb.getError();
				url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/authentication-register.jsp";
	            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	            return;

			}else if (password != null && !password.equals(enterThePassword)) {
			eb.setError(" mat khau nhap lai khong dung");
			request.setAttribute("password", "");
			request.setAttribute("errorBean", eb);
		    baoLoi+=eb.getError();
		    url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/authentication-register.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
		}

		if(baoLoi.length()==0) {
			User customer = new User((cd.creatId()+1)+"", username, password, name,null, null, null, email, null,  2);
			System.out.println("id cua customer: "+ customer.getUserId());
			cd.insert(customer);
			Email.sendEmail(email, "Chuc mung ban da tro thanh khach hang than thiet cua cua hang chung toi!", "Thong bao dang ky tai khoan thanh cong");
			url=request.getContextPath()+"/pizza-gh-pages/pizza-gh-pages/index.jsp";
		}else {
			url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/authentication-register.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
			
		}
		response.sendRedirect(url);
//		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}