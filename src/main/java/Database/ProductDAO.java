/**
 * 
 */
package Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import Model.Category;
import Model.Product;


/**
 * 
 */
public class ProductDAO implements DAOInterface<Product> {
	private ArrayList<Product> data = new ArrayList<>();

	public int creatId() {
		data = selectAll();
		return data.size();
	}
    public ArrayList<Product> selectAllLanguage(String lang) {
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT product_id, product_name, category_id, description, price, image, product_name_en, description_en FROM products";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                String idProduct = rs.getString("product_id");
                String categoryId = rs.getString("category_id");
                String nameKey = lang.equals("en") ? "product_name_en" : "product_name";
                String descriptionKey = lang.equals("en") ? "description_en" : "description";
                Double price = rs.getDouble("price");
                String image = rs.getString("image");

                Category category = new CategoryDAO().selectById(categoryId);
                Product product = new Product(idProduct, rs.getString(nameKey), category, rs.getString(descriptionKey), price, image);
                data.add(product);
            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

	@Override
	public ArrayList<Product> selectAll() {
		ArrayList<Product> products = new ArrayList<>();
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM products";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				String idProduct = rs.getString("product_id");
				String nameProduct = rs.getString("product_name");
				String categoryId = rs.getString("category_id");
				String description = rs.getString("description");
				Double price = rs.getDouble("price");
				String image = rs.getString("image");

				Category category = new CategoryDAO().selectById(categoryId);
				Product product = new Product(idProduct, nameProduct, category, description, price, image);

				products.add(product);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
// tim san pham theo ten
	public ArrayList<Product> selectByProductName(String productName) {
		ArrayList<Product>listProduct = new ArrayList<Product>();
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM products WHERE product_name LIKE ?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%" + productName + "%");

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				String idProduct = rs.getString("product_id");
				String nameProduct = rs.getString("product_name");
				String categoryId = rs.getString("category_id");
				String description = rs.getString("description");
				Double price = rs.getDouble("price");
				String image = rs.getString("image");
				String nameProducten = rs.getString("product_name_en");
				String descriptionen = rs.getString("description_en");

				Category category = new CategoryDAO().selectById(categoryId);
				Product product = new Product(idProduct, nameProduct, category, description, price, image,nameProducten,descriptionen);

				listProduct.add(product);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return listProduct;
	}
//dem so trang can hien thi sau khi tim ket qua
	
	public int countProductByName(String productName) {
		int count = 0;
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT count(*)as soLuong FROM products WHERE product_name LIKE ?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%" + productName + "%");

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				count = rs.getInt("soLuong");

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public Product selectById(String id) {
		Product result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM products WHERE product_id =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String idProduct = rs.getString("product_id");
				String nameProduct = rs.getString("product_name");
				String categoryId = rs.getString("category_id");
				String description = rs.getString("description");
				Double price = rs.getDouble("price");
				String image = rs.getString("image");
				String nameProducten = rs.getString("product_name_en");
				String descriptionen = rs.getString("description_en");
				Category category = new CategoryDAO().selectById(categoryId);
				result = new Product(idProduct, nameProduct, category, description, price, image,nameProducten,descriptionen);

			}

			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insert(Product product) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO products(product_id, product_name, category_id, description, price, image, product_name_en, description_en)"
					+ "VALUE(?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);

			rs.setString(1, product.getIdProduct().trim());

			rs.setString(2, product.getNameProduct());
			rs.setString(3, product.getCategory().getCategoryId());
			rs.setString(4, product.getDescription());
			rs.setDouble(5, product.getPrice());
			rs.setString(6, product.getImage());
			rs.setString(7, product.getNameProducten());
			rs.setString(8, product.getDescriptionen());

			result = rs.executeUpdate();

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insertAll(ArrayList<Product> list) {
		int result = 0;
		for (Product product : list) {

			;
			if (this.insert(product) == 1)
				result += 1;
		}
		return result;
	}

	@Override
	public int delete(Product product) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from products " + "WHERE product_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, product.getIdProduct());

			result = rs.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int deleteAll(ArrayList<Product> list) {
		int result = 0;

		for (Product product : list) {
			result += delete(product);
		}
		return result;
	}

	@Override
	public int update(Product product) {
		int result = 0;
		Product oldProduct = this.selectById(product.getIdProduct() + "");

		if (oldProduct != null) {

			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE pizza.products SET  product_name=? " +
			             ", category_id=? " +
			             ", description=? " +
			             ", price=? " +
			             ", image=? " +
			             ", product_name_en=?"+
			             ", description_en=? " +
			             "WHERE product_id = ?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, product.getNameProduct());
				rs.setString(2, product.getCategory().getCategoryId());
				rs.setString(3, product.getDescription());
				rs.setDouble(4, product.getPrice());
				rs.setString(5, product.getImage());
				rs.setString(6, product.getNameProducten());
				rs.setString(7, product.getDescriptionen());
				rs.setString(8, product.getIdProduct().trim());


				result = rs.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("khong sua duoc");
			}
		}

		return result;
	}	
	public int updateImage(Product product) {
		int result = 0;
		Product oldProduct = this.selectById(product.getIdProduct() + "");

		if (oldProduct != null) {

			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE pizza.products SET image=? " + "WHERE product_id =?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, product.getImage());
				rs.setString(2, product.getIdProduct());

				result = rs.executeUpdate();
				System.out.println("đc");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("khong sua duoc");
			}
		}

		return result;
	}



	public static void main(String[] args) {
		ProductDAO productDAO = new ProductDAO();
		List<Product> products = productDAO.selectAll();
		for (int i = 0; i < products.size(); i++) {
			System.out.println(products.get(i));
		}
		System.out.println(productDAO.countProductByName(""));

	}
}