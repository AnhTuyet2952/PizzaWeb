/**
 * 
 */
package Database;

/**
 * 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.Category;






/**
 * 
 */
public class CategoryDAO implements DAOInterface<Category> {
	private ArrayList<Category> data = new ArrayList<>();
@Override
	public ArrayList<Category> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM category ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String id = rs.getString("category_id");
				String name = rs.getString("category_name");
				
				Category category = new Category(id, name);
				data.add(category);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			 e.printStackTrace();
		}
		return data;
	}
@Override
	public Category selectById(String id) {
	Category result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.category WHERE category_id =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id1 = rs.getString("category_id");
				String username = rs.getString("category_name");
				
				result = new Category(id1, username);


			}
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			 e.printStackTrace();
		}

		return result;
	}
@Override
	public int insert(Category category) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO category(category_id, category_name)"
					+ "VALUE(?, ?)";
			
			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, category.getCategoryId());
			rs.setString(2, category.getCategoryName());
			
			result = rs.executeUpdate();
			
			JDBCUtil.closeConnection(con);
					
		} catch (Exception e) {
			 e.printStackTrace();
		}
    
    	return result;
	}
@Override
	public int insertAll(ArrayList<Category> list) {
		int result = 0;
		for (Category category : list) {

			;
			if (this.insert(category) == 1)
				result += 1;
		}
		return result;
	}
@Override
	public int delete(Category category) {
int result =0;
    	
    	try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from category "
					+ "WHERE category_id=?";
			
			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, category.getCategoryId());
			
			
			
			result= rs.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		}
    	
    	return result;
	}
@Override
	public int deleteAll(ArrayList<Category> list) {
		int result = 0;

		for (Category category : list) {
			result += delete(category);
		}
		return result;
	}
@Override
	public int update(Category category) {
		int result = 0;
		Category oldCategory = this.selectById(category.getCategoryId()+"");
    	if(oldCategory !=null) {
    		try {
				Connection con = JDBCUtil.getConnection();
				
				String sql = "UPDATE pizza.category SET  category_name=? "+ "WHERE category_id =?";
				
				PreparedStatement rs = con.prepareStatement(sql);
				
				rs.setString(1, category.getCategoryName());
				
				
				
				rs.setString(2, category.getCategoryId());
				
				result = rs.executeUpdate();
			} catch (Exception e) {
				 e.printStackTrace();
			}
    	}
    	return result;
	}
}

