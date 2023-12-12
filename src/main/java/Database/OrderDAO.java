/**
 * 
 */
package Database;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;


import Model.Customer;
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
				String idCustomer = rs.getString("customer_id");
				String addredd = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");

				Customer user = new CustomerDAO().selectById(idCustomer);
				Order order = new Order(orderId, user, addredd, note, total, bookingDate, status);

				data.add(order);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	//phuong thưc cap nhap trang thai cho don hang thành 'confirmed'
	public void confirmOrder(String orderId) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE orders SET status = 'confirmed' WHERE order_id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, orderId);
			st.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//phuong thưc cap nhap trang thai cho don hang thành 'rejected'
		public void rejectOrder(String orderId) {
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "UPDATE orders SET status = 'rejected' WHERE order_id=?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, orderId);
				st.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
				String idCustomer = rs.getString("customer_id");
				String address = rs.getString("Address");
				String note = rs.getString("note");
				Double total = rs.getDouble("total");
				Date bookingDate = rs.getDate("booking_date");
				String status = rs.getString("status");

				Customer user = new CustomerDAO().selectById(idCustomer);

				result = new Order(idOrder, user, address, note, total, bookingDate, status);


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

			String sql = " INSERT INTO orders(order_id, customer_id, Address, note, total, booking_date, status)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, order.getOderId());
			rs.setString(2, order.getUser().getCustomerId());
			rs.setString(3, order.getAddress());
			rs.setString(4, order.getNote());
			rs.setDouble(5, order.getTotal());
			rs.setDate(6, order.getBookingDate());
			rs.setString(7, order.getStatus());

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

				String sql = "UPDATE orders SET  customer_id=? " + ", Address=? " + ", note=? " + ", total=? "
						+ ", booking_date=? " + "WHERE order_id =?" + "status=?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, order.getUser().getCustomerId());
				rs.setString(2, order.getAddress());
				rs.setString(3, order.getNote());
				rs.setDouble(4, order.getTotal());
				rs.setDate(5, order.getBookingDate());
				rs.setString(6, oldOrder.getOderId());
				rs.setString(7, order.getStatus());

				result = rs.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
