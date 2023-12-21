package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.Customer;
import Model.Order;
import Model.OrderDetail;
import Model.Product;

public class OrderDetailDAO implements DAOInterface<OrderDetail>{
	private ArrayList<OrderDetail> data = new ArrayList<>();
	public int creatId() {
		data = selectAll();
		return data.size();
	}
	@Override
	public ArrayList<OrderDetail> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM orderdetails ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idProduct = rs.getString("product_id");
				Integer quantity = rs.getInt("quantity");
				Double price = rs.getDouble("price");
				
				Order order = new OrderDAO().selectById(orderId);
				Product product = new ProductDAO().selectById(idProduct);
				OrderDetail orderDetail = new OrderDetail(order, product, quantity, price);
				data.add(orderDetail);
				
			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}
	@Override
	public OrderDetail selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<OrderDetail> selectByOrderId(String id) {
		ArrayList<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM orderdetails WHERE order_id=?";

			PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, id);
			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				String orderId = rs.getString("order_id");
				String idProduct = rs.getString("product_id");
				Integer quantity = rs.getInt("quantity");
				Double price = rs.getDouble("price");
				
				Order order = new OrderDAO().selectById(orderId);
				Product product = new ProductDAO().selectById(idProduct);
				OrderDetail orderDetail = new OrderDetail(order, product, quantity, price);
				orderDetails.add(orderDetail);
				
			}
			st.close();
			rs.close();
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderDetails;
	}
	public OrderDetail selectById(String orderId, String productId) {
	    OrderDetail result = null;

	    try {
	        Connection con = JDBCUtil.getConnection();

	        String sql = "SELECT * FROM orderdetails WHERE order_id=? AND product_id=?";

	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, orderId);
	        st.setString(2, productId);

	        ResultSet rs = st.executeQuery();

	        while (rs.next()) {

				String orderId1 = rs.getString("order_id");
				String idProduct = rs.getString("product_id");
				Integer quantity = rs.getInt("quantity");
				Double price = rs.getDouble("price");
				
				Order order = new OrderDAO().selectById(orderId1);
				Product product = new ProductDAO().selectById(idProduct);
				result = new OrderDetail(order, product, quantity, price);
				
			}
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return result;
	}

	@Override
	public int insert(OrderDetail orderDetail) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = " INSERT INTO orderdetails(order_id, product_id, quantity, price)"
					+ "VALUES(?, ?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, orderDetail.getOrderId().getOderId());
			rs.setString(2, orderDetail.getProducts().getIdProduct());
			rs.setInt(3, orderDetail.getQuantity());
			rs.setDouble(4, orderDetail.getPrice());


			result = rs.executeUpdate();

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	@Override
	public int insertAll(ArrayList<OrderDetail> list) {
		int result = 0;
		for (OrderDetail orderDetail : list) {

			;
			if (this.insert(orderDetail) == 1)
				result += 1;
		}
		return result;
	}
	@Override
	public int delete(OrderDetail orderDetail) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from orderdetails " + "WHERE order_id=? AND product_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, orderDetail.getOrderId().getOderId());
			rs.setString(2, orderDetail.getProducts().getIdProduct());

			result = rs.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	@Override
	public int deleteAll(ArrayList<OrderDetail> arr) {
		int result = 0;

		for (OrderDetail orderDetail : arr) {
			result += delete(orderDetail);
		}
		return result;
	}
	@Override
	public int update(OrderDetail orderDetail) {
	    int result = 0;
	    OrderDetail oldOrderDetail = this.selectById(orderDetail.getOrderId().getOderId(), orderDetail.getProducts().getIdProduct());
	    if (oldOrderDetail != null) {
	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "UPDATE orderdetails SET quantity=?, price=? WHERE order_id=? AND product_id=?";

	            PreparedStatement rs = con.prepareStatement(sql);

	            rs.setInt(1, orderDetail.getQuantity());
	            rs.setDouble(2, orderDetail.getPrice());
	            rs.setString(3, orderDetail.getOrderId().getOderId());
	            rs.setString(4, orderDetail.getProducts().getIdProduct());

	            result = rs.executeUpdate();
	            
	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return result;
	}


}