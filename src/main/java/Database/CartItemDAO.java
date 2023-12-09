package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Cart;
import Model.Cart_item;
import Model.Product;

public class CartItemDAO implements DAOInterface<Cart_item>{
	ArrayList<Cart_item> data = new ArrayList<>();
	  @Override
	    public ArrayList<Cart_item> selectAll() {

	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "SELECT * FROM cartItems";

	            PreparedStatement st = con.prepareStatement(sql);

	            ResultSet rs = st.executeQuery();
	            while (rs.next()) {
	                String cartItemId = rs.getString("cartItem_id");
	                int quantity = rs.getInt("quantity");
	                double price = rs.getDouble("price");
	                String productId = rs.getString("product_id");
	                String cartId = rs.getString("cart_id");

	                // Lấy thông tin sản phẩm và giỏ hàng từ cơ sở dữ liệu
	                Product product = new ProductDAO().selectById(productId);
	                Cart cart = new cartDAO().selectById(cartId);

	                Cart_item cartItem = new Cart_item(cartItemId, quantity, price, product, cart);
	                data.add(cartItem);
	            }

	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return data;
	    }

	    @Override
	    public Cart_item selectById(String id) {
	        Cart_item result = null;

	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "SELECT * FROM cartItems WHERE cartItem_id = ?";

	            PreparedStatement st = con.prepareStatement(sql);
	            st.setString(1, id);

	            ResultSet rs = st.executeQuery();
	            while (rs.next()) {
	                int quantity = rs.getInt("quantity");
	                double price = rs.getDouble("price");
	                String productId = rs.getString("product_id");
	                String cartId = rs.getString("cart_id");

	                // Lấy thông tin sản phẩm và giỏ hàng từ cơ sở dữ liệu
	                Product product = new ProductDAO().selectById(productId);
	                Cart cart = new cartDAO().selectById(cartId);

	                result = new Cart_item(id, quantity, price, product, cart);
	            }

	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    @Override
	    public int insert(Cart_item cartItem) {
	        int result = 0;

	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "INSERT INTO cartItems (cartItem_id, quantity, price, product_id, cart_id) VALUES (?, ?, ?, ?, ?)";

	            PreparedStatement st = con.prepareStatement(sql);
	            st.setString(1, cartItem.getId());
	            st.setInt(2, cartItem.getQuantity());
	            st.setDouble(3, cartItem.getPrice());
	            st.setString(4, cartItem.getProduct().getIdProduct());
	            st.setString(5, cartItem.getCart().getCartId());

	            result = st.executeUpdate();

	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    @Override
	    public int insertAll(ArrayList<Cart_item> list) {
	        int result = 0;
	        for (Cart_item cartItem : list) {
	            if (this.insert(cartItem) == 1)
	                result += 1;
	        }
	        return result;
	    }

	    @Override
	    public int delete(Cart_item cartItem) {
	        int result = 0;

	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "DELETE FROM cartItems WHERE cartItem_id = ?";

	            PreparedStatement st = con.prepareStatement(sql);
	            st.setString(1, cartItem.getId());

	            result = st.executeUpdate();

	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    @Override
	    public int deleteAll(ArrayList<Cart_item> list) {
	        int result = 0;

	        for (Cart_item cartItem : list) {
	            result += delete(cartItem);
	        }
	        return result;
	    }

	    @Override
	    public int update(Cart_item cartItem) {
	        int result = 0;

	        try {
	            Connection con = JDBCUtil.getConnection();

	            String sql = "UPDATE cartItems SET quantity=?, price=?, product_id=?, cart_id=? WHERE cartItem_id=?";

	            PreparedStatement st = con.prepareStatement(sql);
	            st.setInt(1, cartItem.getQuantity());
	            st.setDouble(2, cartItem.getPrice());
	            st.setString(3, cartItem.getProduct().getIdProduct());
	            st.setString(4, cartItem.getCart().getCartId());
	            st.setString(5, cartItem.getId());

	            result = st.executeUpdate();

	            JDBCUtil.closeConnection(con);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return result;
	    }

	    // Thêm phương thức để thực hiện logic thêm vào giỏ hàng
	    public int addToCart(Cart_item cartItem) {
	        // Logic thêm vào giỏ hàng ở đây
	        // Có thể kiểm tra sự tồn tại của mục trong giỏ hàng trước khi thêm mới

	        return insert(cartItem);
	    }

}