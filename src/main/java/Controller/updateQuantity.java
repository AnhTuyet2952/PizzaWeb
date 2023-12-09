package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cart;

/**
 * Servlet implementation class updateQuantity
 */
@WebServlet("/updateQuantity")
public class updateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String productId = request.getParameter("idproduct");
		int newQuantity = Integer.parseInt(request.getParameter("quantity"));
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		String url="";
		if(cart!=null) {
			if(newQuantity<=0) {
				cart.removeItem(productId);
			}else {
			cart.updateQuantity(productId, newQuantity);
			}
			request.getSession().setAttribute("cart", cart);
		}
		// Lấy số lượng giỏ hàng từ phương thức trong lớp Cart của bạn
	    int cartQuantity = cart.calculateTotalQuantity();

	    // Trả về số lượng giỏ hàng dưới dạng text
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(String.valueOf(cartQuantity));
		url = request.getContextPath()+"/pizza-gh-pages/pizza-gh-pages/cart.jsp";
		response.sendRedirect(url);
		
//		doGet(request, response);
	}

}
