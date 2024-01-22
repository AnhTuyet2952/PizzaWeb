package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.Cart;
import Model.Category;
import Model.User;
import Model.Product;

public class cartDAO implements DAOInterface<Cart> {
	private ArrayList<Cart> data = new ArrayList<>();

	public int creatId() {
		data = selectAll();
		return data.size();
	}

	@Override
	public ArrayList<Cart> selectAll() {
		// TODO Auto-generated method stub
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM carts ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String cartId = rs.getString("cart_id");
				String customerId = rs.getString("user_id");
				Date buydate = rs.getDate("buyDate");

				User customer = new UserDAO().selectById(customerId);
				Cart cart = new Cart(cartId, customer, buydate);
				data.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	@Override
	public Cart selectById(String id) {
		// TODO Auto-generated method stub
		Cart result = null;
		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM carts WHERE cart_id =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String cartId = rs.getString("cart_id");
				String customerId = rs.getString("user_id");
				Date buydate = rs.getDate("buyDate");

				User customer = new UserDAO().selectById(customerId);
				result = new Cart(cartId, customer, buydate);
				JDBCUtil.closeConnection(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insert(Cart t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO carts(cart_id, user_id, buyDate)" + "VALUES(?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, t.getCartId());
			rs.setString(2, t.getBuyer().getUserId());
			rs.setDate(3, t.getBuyDate());

			result = rs.executeUpdate();

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int insertAll(ArrayList<Cart> list) {
		int result = 0;
		for (Cart cart : list) {
			;
			if (this.insert(cart) == 1)
				result += 1;
		}
		return result;
	}

	@Override
	public int delete(Cart t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from carts " + "WHERE cart_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, t.getCartId());

			result = rs.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteAll(ArrayList<Cart> list) {
		int result = 0;

		for (Cart cart : list) {
			result += delete(cart);
		}
		return result;
	}

	@Override
	public int update(Cart t) {
		int result = 0;
		Cart oldCart = this.selectById(t.getCartId());
		if (oldCart != null) {

			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE carts SET user_id=?, buyDate=? WHERE cart_id=?";

				PreparedStatement rs = con.prepareStatement(sql);
				rs.setString(1, t.getBuyer().getUserId());
				rs.setDate(2, t.getBuyDate());
				rs.setString(3, t.getCartId());

				result = rs.executeUpdate();
				JDBCUtil.closeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("khong sua duoc");
			}
		}

		return result;
	}

}
