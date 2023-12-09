package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ProductDAO;

import Model.Cart;
import Model.Cart_item;
import Model.Product;
;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/addtocart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO productDAO = new ProductDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("productId");
	
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		String url="/pizza-gh-pages/pizza-gh-pages/menu.jsp";
		if (cart == null) {
			cart = new Cart();	
			request.getSession().setAttribute("cart", cart);
		}
		HttpSession session = request.getSession();
		int totalQuantity = cart.calculateTotalQuantity();
		session.setAttribute("totalQuantity", totalQuantity);
		//kiem tra san pham da ton tai, tang quantity len
		Cart_item existingItem = cart.findCartItemId(productId);
		if(existingItem!=null) {
			existingItem.setQuantity(Math.max(existingItem.getQuantity()+1, 1));
		}else {
			// neu chua co thi them sản phẩm vào giỏ hàng
			ProductDAO productDAO = new ProductDAO();
			Product product = productDAO.selectById(productId);
			Cart_item cart_item = new Cart_item(product, 1);
			cart_item.setPrice(product.getPrice());
			cart_item.setCart(cart);
			cart.addToCart(cart_item);
		}
		   // Gửi phản hồi về trình duyệt
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write("success");
		url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/menu.jsp";
		response.sendRedirect(url);

		
//		doGet(request, response);
	}
}
