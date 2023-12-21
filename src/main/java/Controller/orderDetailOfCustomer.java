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
		String customerId =(String) request.getSession().getAttribute("customerId");
		try {
			OrderDAO orderDAO = new OrderDAO();
			List<Order> orders = orderDAO.selectByCustomerId(customerId);
			request.setAttribute("orders", orders);
			String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/order.jsp";
	        response.sendRedirect(url + "?orderId=" + URLEncoder.encode(customerId, "UTF-8"));
		} catch (Exception e) {
			// TODO: handle exception
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
