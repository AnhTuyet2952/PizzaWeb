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
 * Servlet implementation class confirmOrder
 */
@WebServlet("/confirmOrder")
public class confirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       OrderDAO orderDAO = new OrderDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderId = request.getParameter("orderId");
		String action = request.getParameter("action");
		String url = "";
		String message = "";
		Order order = new Order();
		if("Accept".equals(action)) {
//			order.setStatus("Accept");
			orderDAO.UpdateOrderStatus(orderId, "Accept");
			 order.setStatus("Accept");
			message = "Order accepted successfully.";
			System.out.println(order.getStatus());
		}else if("Reject".equals(action)) {
			orderDAO.UpdateOrderStatus(orderId, "Reject");
			 order.setStatus("Reject");
			message = "Order Rejected successfully.";
			System.out.println(order.getStatus());
		}else if("delete".equals(action)) {
			order.setOderId(orderId);
			int result = orderDAO.rejectOrder(order);
			  if (result > 0) {
	                message = "Order rejected successfully.";
	            } else {
	                message = "Failed to reject order. Please try again.";
	            }
		}
		request.setAttribute("order", order);
		request.setAttribute("action", action);
		 request.setAttribute("message", message);
		url = "/admin/pages/tables/basic-table.jsp";
		request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
   	    response.sendRedirect(request.getContextPath() + url);
	}

}
