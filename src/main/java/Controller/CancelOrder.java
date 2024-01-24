package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.OrderDAO;
import Model.Order;

/**
 * Servlet implementation class CancelOrder
 */
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderDAO orderDAO = new OrderDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//lấy id order từ request
		String orderId = request.getParameter("orderId");
		String action = request.getParameter("action");
		String url = "";
		String message = "";
		Order order = new Order();
		//nếu bấm vào nút cancel
		if ("Cancel".equals(action)) {
			// Xử lý hủy đơn hàng (cập nhật trạng thái)
			//request là trạng thái yêu cầu hủy gửi về admin
			orderDAO.UpdateOrderStatus(orderId, "Request");
			order.setStatus("Request");

			// Cập nhật thành công
			message = "Order canceled successfully.";
			request.setAttribute("message", message);
		}

		request.setAttribute("order", order);
		request.setAttribute("action", action);
		request.setAttribute("message", message);
		url = "/pizza-gh-pages/pizza-gh-pages/order.jsp";
		response.sendRedirect(request.getContextPath() + url);
	}

}
