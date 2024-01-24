package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ProductDAO;
import Database.UserDAO;
import Model.Cart;
import Model.Cart_item;
import Model.Product;;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/addtocart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO productDAO = new ProductDAO();
	UserDAO userDAO = new UserDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		// Lấy mã sản phẩm từ request
		String productId = request.getParameter("productId");

		//Lấy giỏ hàng từ session hoặc tạo mới nếu chưa có
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		HttpSession session = request.getSession();
		// Tính tổng số lượng sản phẩm trong giỏ hàng và lưu vào session
		int totalQuantity = cart.calculateTotalQuantity();
		session.setAttribute("totalQuantity", totalQuantity);
		// Lấy ngôn ngữ từ session
		String language = (String) request.getSession().getAttribute("language");

		// Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
		Cart_item existingItem = cart.findCartItemId(productId);

		if (existingItem != null) {
			// Nếu sản phẩm đã tồn tại, tăng số lượng lên
			existingItem.setQuantity(Math.max(existingItem.getQuantity() + 1, 1));//k trả về số âm
		} else {
			// Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
			Product product = productDAO.selectById(productId);

			Cart_item cart_item = new Cart_item(product, 1);
			cart_item.setPrice(product.getPrice());
			cart_item.setCart(cart);

			cart.addToCart(cart_item);
		}

		// Cập nhật ngôn ngữ trong session
		request.getSession().setAttribute("language", language);
		// Gửi phản hồi về trình duyệt
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("success");

		// Chuyển hướng về trang menu
		url = request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/menu.jsp";
		response.sendRedirect(url);
	}

}
