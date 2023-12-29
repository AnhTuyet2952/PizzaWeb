/**
 * 
 */
package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.User;
import Model.Order;


/**
 * 
 */
public class OrderDAO implements DAOInterface<Order> {
	private ArrayList<Order> data = new ArrayList<>();
	public int creatId() {
		data = selectAll();
		return data.size();
	}


	@Override
	public ArrayList<Order> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM orders ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idCustomer = rs.getString("user_id");
				String addredd = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");
				String nameConsignee = rs.getString("nameConsignee");
				String phoneConsignee = rs.getString("phoneConsignee");

				User user = new UserDAO().selectById(idCustomer);
				Order order = new Order(orderId, user, addredd, note, total, bookingDate, status, nameConsignee, phoneConsignee);
				

				data.add(order);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	//list don hang dang can xac nhan
	public List<Order> selectConfirmedOrders(){
		List<Order> confirmedOrders = new ArrayList<Order>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orders WHERE status like 'processing'";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idCustomer = rs.getString("user_id");
				String addredd = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");
				String nameConsignee = rs.getString("nameConsignee");
				String phoneConsignee = rs.getString("phoneConsignee");
				User user = new UserDAO().selectById(idCustomer);
				Order order = new Order(orderId, user, addredd, note, total, bookingDate, status, nameConsignee, phoneConsignee);
				

				confirmedOrders.add(order);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return confirmedOrders;
	}
	//list cac don hang ma admin chap nhan
	public List<Order> selectAcceptOrders(){
		List<Order> confirmedOrders = new ArrayList<Order>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orders WHERE status=?";
			PreparedStatement st = con.prepareStatement(sql);
			 // Thiết lập giá trị tham số cho truy vấn
	        st.setString(1, "Accept");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idCustomer = rs.getString("user_id");
				String addredd = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");
				String nameConsignee = rs.getString("nameConsignee");
				String phoneConsignee = rs.getString("phoneConsignee");

				User user = new UserDAO().selectById(idCustomer);
				Order order = new Order(orderId, user, addredd, note, total, bookingDate, status, nameConsignee, phoneConsignee);
				

				confirmedOrders.add(order);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return confirmedOrders;
	}
	//list cac don hang ma admin Huy
		public List<Order> selectCancelOrders(){
			List<Order> confirmedOrders = new ArrayList<Order>();
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "SELECT * FROM orders WHERE status=?";
				PreparedStatement st = con.prepareStatement(sql);
				 // Thiết lập giá trị tham số cho truy vấn
		        st.setString(1, "Request cancellation");

				ResultSet rs = st.executeQuery();
				while (rs.next()) {

					String orderId = rs.getString("order_id");
					String idCustomer = rs.getString("user_id");
					String addredd = rs.getString("Address");
					String note = rs.getString("note");
					Double total = rs.getDouble("total");
					Date bookingDate = rs.getDate("booking_date");
					String status = rs.getString("status");
					String nameConsignee = rs.getString("nameConsignee");
					String phoneConsignee = rs.getString("phoneConsignee");

					User user = new UserDAO().selectById(idCustomer);
					Order order = new Order(orderId, user, addredd, note, total, bookingDate, status, nameConsignee, phoneConsignee);
					

					confirmedOrders.add(order);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return confirmedOrders;
		}
		
	//list danh sach cac don hang ma admin tu choi
	public List<Order> selectRejectOrders(){
		List<Order> confirmedOrders = new ArrayList<Order>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM orders WHERE status=?";
			PreparedStatement st = con.prepareStatement(sql);
			 // Thiết lập giá trị tham số cho truy vấn
	        st.setString(1, "Cancel");

			ResultSet rs = st.executeQuery();
			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idCustomer = rs.getString("user_id");
				String addredd = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");
				String nameConsignee = rs.getString("nameConsignee");
				String phoneConsignee = rs.getString("phoneConsignee");

				User user = new UserDAO().selectById(idCustomer);
				Order order = new Order(orderId, user, addredd, note, total, bookingDate, status, nameConsignee, phoneConsignee);
				

				confirmedOrders.add(order);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return confirmedOrders;
	}

	//phuong thưc cap nhap trang thai cho don hang
	public void UpdateOrderStatus(String orderId, String status) {
	    try (Connection con = JDBCUtil.getConnection();
	         PreparedStatement st = con.prepareStatement("UPDATE orders SET status = ? WHERE order_id = ?")) {
	        st.setString(1, status);
	        st.setString(2, orderId);

	        int rowsAffected = st.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Order status updated successfully.");
	        } else {
	            System.out.println("Failed to update order status.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

    // Phương thức từ chối đơn hàng và xóa dữ liệu
    public int rejectOrder(Order orderId) {
    	int result = 0;
        String deleteOrder = "DELETE FROM orders WHERE order_id = ?";
        String deleteOrderDetails = "DELETE FROM orderdetails WHERE order_id = ?";
        try {
        	// tao mot connection
			Connection con = JDBCUtil.getConnection();
			PreparedStatement deleteOrderst = con.prepareStatement(deleteOrder);
			PreparedStatement deleteOrderDetailst = con.prepareStatement(deleteOrderDetails);
			con.setAutoCommit(false);
			//xoa chi tiet don hang
			deleteOrderDetailst.setString(1, orderId.getOderId());
			result = deleteOrderDetailst.executeUpdate();
			//xoa don hang
			if(result>0) {
				deleteOrderst.setString(1, orderId.getOderId());
				result = deleteOrderst.executeUpdate();
				
			}
			 if (result > 0) {
		            con.commit(); // Commit nếu mọi thứ đều thành công
		        } else {
		            con.rollback(); // Rollback nếu có lỗi xảy ra
		        }
			//kiem tra co dong nao da duoc xoa hay khong
//			return rowsDeleteOrder>0||rowDeleteOrderDetail>0;
		} catch (Exception e) {
			e.printStackTrace(); 
		}
        return result;
    }

		
		public ArrayList<Order> selectByCustomerIdAndStatus(String customerId, String statusOrder) {
			ArrayList<Order>result = new ArrayList<Order>();
			try {
				// tao mot connection
				Connection con = JDBCUtil.getConnection();

				// tao cau lenh sql
				String sql = "SELECT * FROM orders WHERE user_id=? AND status=?" ;

				PreparedStatement st = con.prepareStatement(sql);
	            st.setString(1, customerId);
	            st.setString(2, statusOrder);
				// thuc thi

				ResultSet rs = st.executeQuery();

				while (rs.next()) {

					String orderId = rs.getString("order_id");
					String idCustomer = rs.getString("user_id");
					String addredd = rs.getString("Address");
					String note = rs.getString("note");
					Double total = rs.getDouble("total");
					Date bookingDate = rs.getDate("booking_date");
					String status = rs.getString("status");
					String nameConsignee = rs.getString("nameConsignee");
					String phoneConsignee = rs.getString("phoneConsignee");

					User user = new UserDAO().selectById(idCustomer);
					Order order = new Order(orderId, user, addredd, note, total, bookingDate,status,nameConsignee,phoneConsignee);

					result.add(order);

				}
				st.close();
				rs.close();
				JDBCUtil.closeConnection(con);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

	@Override
	public Order selectById(String id) {
		Order result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM orders WHERE order_id =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String idOrder = rs.getString("order_id");
				String idCustomer = rs.getString("user_id");
				String address = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");
				String nameConsignee = rs.getString("nameConsignee");
				String phoneConsignee = rs.getString("phoneConsignee");

				User user = new UserDAO().selectById(idCustomer);

				result = new Order(idOrder, user, address, note, total, bookingDate, status,nameConsignee,phoneConsignee);


			}
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insert(Order order) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = " INSERT INTO orders(order_id, user_id, Address, note, total, booking_date, status, nameConsignee, phoneConsignee)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, order.getOderId());
			rs.setString(2, order.getUser().getUserId());
			rs.setString(3, order.getAddress());
			rs.setString(4, order.getNote());
			rs.setDouble(5, order.getTotal());
			rs.setDate(6, order.getBookingDate());
			rs.setString(7, order.getStatus());
			rs.setString(8, order.getNameConsignee());
			rs.setString(9, order.getPhoneConsignee());

			result = rs.executeUpdate();

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insertAll(ArrayList<Order> list) {
		int result = 0;
		for (Order order : list) {

			;
			if (this.insert(order) == 1)
				result += 1;
		}
		return result;
	}

	@Override
	public int delete(Order order) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from orders " + "WHERE order_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, order.getOderId());

			result = rs.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteAll(ArrayList<Order> list) {
		int result = 0;

		for (Order order : list) {
			result += delete(order);
		}
		return result;
	}

	@Override
	public int update(Order order) {
		int result = 0;
		Order oldOrder = this.selectById(order.getOderId() + "");
		if (oldOrder != null) {
			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE orders SET  user_id=? " + ", Address=? " + ", note=? " + ", total=? "
						+ ", booking_date=? " + "WHERE order_id =?" + "status=?" + "nameConsignee=?" + "phoneConsignee=?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, order.getUser().getUserId());
				rs.setString(2, order.getAddress());
				rs.setString(3, order.getNote());
				rs.setDouble(4, order.getTotal());
				rs.setDate(5, order.getBookingDate());
				rs.setString(6, oldOrder.getOderId());
				rs.setString(7, order.getStatus());
				rs.setString(8, order.getNameConsignee());
				rs.setString(9, order.getPhoneConsignee());
				result = rs.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}