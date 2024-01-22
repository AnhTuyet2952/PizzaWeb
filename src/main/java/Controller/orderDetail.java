package Controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.OrderDAO;
import Database.OrderDetailDAO;
import Model.Order;
import Model.OrderDetail;

/**
 * Servlet implementation class orderDetail
 */
@WebServlet("/orderDetail2")
public class orderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
    	String id = request.getParameter("orderId");
		OrderDetailDAO od = new OrderDetailDAO();
		OrderDAO ods = new OrderDAO();
		Order order = ods.selectById(id);
		System.out.println("orderId: "+ order.getOderId());
		System.out.println("username: "+order.getUser().getName());
		ArrayList<OrderDetail> listOrderDetail = od.selectByOrderId(id);
		
		for (OrderDetail orderDetail : listOrderDetail) {
			System.out.println(orderDetail.getProducts().getNameProduct());
		}
        // Chuyển hướng request tới trang JSP
    	String url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/orderDetail.jsp";
        response.sendRedirect(url + "?orderId=" + URLEncoder.encode(id, "UTF-8"));
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
