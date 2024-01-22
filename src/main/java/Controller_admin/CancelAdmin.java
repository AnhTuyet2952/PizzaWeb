package Controller_admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.OrderDAO;
import Model.Order;

/**
 * Servlet implementation class CancelAdmin
 */
@WebServlet("/CancelAdmin")
public class CancelAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderDAO orderDAO = new OrderDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId = request.getParameter("orderId");
		String action = request.getParameter("action");
		String url = "";
		String message = "";
		Order order = new Order();
		if ("Cancel".equals(action)) {
			// Xử lý hủy đơn hàng (cập nhật trạng thái)
			orderDAO.UpdateOrderStatus(orderId, "Request");
			order.setStatus("Request");

			// Cập nhật thành công
			message = "Order canceled successfully.";
			request.setAttribute("message", message);
		}else if("Cancelled".equals(action)) {
			orderDAO.UpdateOrderStatus(orderId, "Cancel");
			 order.setStatus("Cancel");
			message = "Order Canceled successfully.";
			System.out.println(order.getStatus());
		}

		request.setAttribute("order", order);
		request.setAttribute("action", action);
		 request.setAttribute("message", message);
		url = "/admin/pages/tables/basic-table.jsp";	
   	    response.sendRedirect(request.getContextPath() + url);
	}

}
