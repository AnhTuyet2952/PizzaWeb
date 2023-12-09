package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cart;

/**
 * Servlet implementation class removeItem
 */
@WebServlet("/removeItem")
public class removeItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productId = request.getParameter("productId");
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		String url = "";
		if(cart!=null) {
			cart.removeItem(productId);
		}
		url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/cart.jsp";
        response.sendRedirect(url);
		
		//		doGet(request, response);
	}

}
