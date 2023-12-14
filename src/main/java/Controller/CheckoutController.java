package Controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.CustomerDAO;
import Database.OrderDAO;
import Database.OrderDetailDAO;
import Database.ProductDAO;
import Model.Cart;
import Model.Cart_item;
import Model.Customer;
import Model.Order;
import Model.OrderDetail;
import Model.Product;

/**
 * Servlet implementation class CheckoutController
 */
@WebServlet("/checkoutController")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String address = request.getParameter("Address");
	        String status = request.getParameter("status");
	        String note = request.getParameter("note");
	        String phoneConsignee = request.getParameter("phoneConsignee");
	        String nameConsignee = request.getParameter("nameConsignee");
//	        String email = request.getParameter("email");

	        String url = "";
	     // Lấy customer_id từ session
	        HttpSession session = request.getSession();
	        Customer customer = (Customer) session.getAttribute("customer");
	     //kt dang nhap
	        if (customer == null) {
	        	response.sendRedirect(request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp");
	        	return;
	        }
	        CustomerDAO customerDAO = new CustomerDAO();
	     // Cập nhật thông tin khách hàng
//	        if (name != null && !name.isEmpty() && phone != null && !phone.isEmpty() && email != null && !email.isEmpty()) {
//	            customer.setName(name);
//	            customer.setPhoneNumber(phone);
//	            customer.setEmail(email);
//	            customerDAO.update(customer);
//	        }
	        // Kiểm tra giỏ hàng
	        Cart cart = (Cart) session.getAttribute("cart");

	        if (cart == null || cart.isEmpty()) {
	            // Nếu giỏ hàng trống, chuyển hướng đến trang menu
	            response.sendRedirect(request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/menu.jsp");
	            return;
	        }

	        // Tạo đối tượng Order từ thông tin trong session
	        OrderDAO orderDAO = new OrderDAO();
	        Date currentDateTime = new Date();
	        Order order = new Order(orderDAO.creatId()+"", customer, address, note, cart.calculateTotal(), new java.sql.Date(currentDateTime.getTime()), nameConsignee, phoneConsignee);

	        // Thực hiện insert vào cơ sở dữ liệu
	        order.setNameConsignee(nameConsignee);
	        order.setPhoneConsignee(phoneConsignee);
	        order.setNote(note);
	        order.setAddress(address);
	        //luu thong tin vao session
	        session.setAttribute("order", order);
	        
	        int result = orderDAO.insert(order);

	        if (result > 0) {
	        	 OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
	        	 int overallResult=1;
	        	for (Cart_item cart_item : cart.getCart_items()) {
	        		Product product = cart_item.getProduct();
					int quantity = cart_item.getQuantity();
					double price = cart_item.getPrice();
					double total = quantity*price;
					OrderDetail orderDetail = new OrderDetail(order, product, quantity, total);
					result = orderDetailDAO.insert(orderDetail);
					
					List<OrderDetail> orderDetails = (List<OrderDetail>) session.getAttribute("orderDetails");
				        if (orderDetails == null) {
				            orderDetails = new ArrayList<>();
				        }
					orderDetails.add(orderDetail);
					session.setAttribute("orderDetails", orderDetails);
					System.out.println(quantity);
					System.out.println(price);
					if (result <= 0) {
			            // Nếu chèn OrderDetail thất bại, cập nhật kết quả chung và thoát khỏi vòng lặp
			            overallResult = result;
			            break;
			        }
	        	}
	        	if (overallResult > 0) {
	                // Nếu kết quả chung là thành công, thực hiện các bước khác
	        		 orderDAO.UpdateOrderStatus(order.getOderId(), "processing");
	        		// Nếu insert thành công, xóa giỏ hàng và chuyển hướng đến trang thankyou
	        		cart.clearCart();
	        		System.out.println("Order Status: " + order.getStatus());
//	        		order.setStatus("Accept");
	        		request.setAttribute("order", order);
	        		url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/thankyou.jsp";
	        		response.sendRedirect(url);
	            }else {
	                // Nếu kết quả chung là lỗi, chuyển hướng đến trang error
	                response.sendRedirect(request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/error.jsp");
	                return;
	            }
	        }else {
	            // Nếu có lỗi, chuyển hướng đến trang error
	            response.sendRedirect(request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/error.jsp");
	        }
	    }

}
