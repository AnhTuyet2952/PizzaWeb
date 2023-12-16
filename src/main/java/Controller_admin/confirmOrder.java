package Controller_admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.OrderDAO;

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
		if("confirm".equals(action)) {
			orderDAO.UpdateOrderStatus(orderId, "Chấp nhận");
		}else if("reject".equals(action)) {
//			orderDAO.rejectOrder(orderId);
			boolean reject = orderDAO.rejectOrder(orderId);
			 if (!reject) {
	                // Xử lý khi từ chối đơn hàng không thành công
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to reject order");
	                return;
	            }
		}
		url = "/admin/pages/tables/basic-table.jsp";	
   	    response.sendRedirect(request.getContextPath() + url);
	}

}
