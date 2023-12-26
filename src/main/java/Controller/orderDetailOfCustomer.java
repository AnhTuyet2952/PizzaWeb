package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.OrderDAO;
import Model.Order;

/**
 * Servlet implementation class orderDetailOfCustomer
 */
@WebServlet("/orderDetailOfCustomer")
public class orderDetailOfCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderDetailOfCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        // Lấy userId từ session, chắc chắn rằng userId không null
	        String userId = (String) request.getSession().getAttribute("userId");
	        if (userId != null) {
	            OrderDAO orderDAO = new OrderDAO();
	            List<Order> orders = orderDAO.selectByCustomerId(userId);
	            request.setAttribute("orders", orders);

	            // Sử dụng forward thay vì redirect để giữ nguyên request và response
	            request.getRequestDispatcher("/pizza-gh-pages/pizza-gh-pages/order.jsp").forward(request, response);
	        } else {
	            // Nếu userId là null, thực hiện xử lý phù hợp tại đây
	            response.sendRedirect(request.getContextPath() + "/error.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Xử lý exception tại đây
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}