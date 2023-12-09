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

import Model.Admin;
import Model.Customer;
import util.PasswordEncryption;

/**
 * 
 */
public class AdminDAO implements DAOInterface<Admin> {
	private ArrayList<Admin> data = new ArrayList<>();

	public AdminDAO() {
		super();
	}

	@Override
	public ArrayList<Admin> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM admins ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String id = rs.getString("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phoneNumber");
				String name = rs.getString("name");
				String avatar = rs.getString("avatar");
				Date birthday = rs.getDate("birthday");

				Admin user = new Admin(id, name, email, password, phoneNumber, avatar, birthday, username);

				data.add(user);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return data;
	}

	@Override
	public Admin selectById(String id) {
		Admin result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM admins WHERE user_id =?";

			PreparedStatement st = con.prepareStatement(sql);
			String idUser = id;
			st.setString(1, idUser);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id1 = rs.getString("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phoneNumber");
				String name = rs.getString("name");
				String avatar = rs.getString("avatar");
				Date birthday = rs.getDate("birthday");

				result = new Admin(id, name, email, password, phoneNumber, avatar, birthday, username);

				JDBCUtil.closeConnection(con);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	public Admin selectByUsernamePassword(String username, String password) {
		Admin result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.admins WHERE username = ? and password=? ";
			System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id = rs.getString("user_id");
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phoneNumber");
				String name = rs.getString("name");
				String avatar = rs.getString("avatar");
				Date birthday = rs.getDate("birthday");

				result = new Admin(id, name, email, password, phoneNumber, avatar, birthday, username);


			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insert(Admin user) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO admins(user_id, username, password, email, phoneNumber, name, avatar, birthday )" + "VALUE(?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, user.getId());
			rs.setString(2, user.getUsername());
			rs.setString(3, user.getPassword());
			rs.setString(4, user.getEmail());
			rs.setString(5, user.getPhoneNumber());
			rs.setString(6, user.getName());
			rs.setString(7, user.getAvatar());
			rs.setDate(8, user.getBirthday());
			
            System.out.println(user);
			
			result = rs.executeUpdate();
			System.out.println("da them vao");
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("loi khong them vao duoc");
		}

		return result;
	}

	@Override
	public int insertAll(ArrayList<Admin> list) {
		int result = 0;
		for (Admin user : list) {

			;
			if (this.insert(user) == 1)
				result += 1;
		}
		return result;
	}
	public boolean selectByUsername(String username) {
		

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.admins WHERE username =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				return true;

			}

		} catch (Exception e) {
			 e.printStackTrace();
		}

		return false;
	}

	@Override
	public int delete(Admin user) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from admins " + "WHERE user_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, user.getId());

			result = rs.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	@Override
	public int deleteAll(ArrayList<Admin> list) {
		int result = 0;

		for (Admin user : list) {
			result += delete(user);
		}
		return result;
	}

	@Override
	public int update(Admin user) {
		int result = 0;
		Admin oldCustomer = this.selectById(user.getId() + "");
		if (oldCustomer != null) {
			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE admins SET  username=? " + ", password=? "+ ", email=? "+ ", phoneNumber=? "+ ", name=? "+ ", avatar=? " + ", birthday=? "
						+ "WHERE user_id =?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, user.getUsername());
				rs.setString(2, user.getPassword());
				rs.setString(3, user.getEmail());
				rs.setString(4, user.getPhoneNumber());
				rs.setString(5, user.getName());
				rs.setString(6, user.getAvatar());
				rs.setDate(7, user.getBirthday());
		
				rs.setString(8, user.getId());

				result = rs.executeUpdate();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return result;
	}

	public static void main(String[] args) {
		AdminDAO ad = new AdminDAO();

		Admin user = ad.selectById("1");

		String password = PasswordEncryption.toSHA1("0405");
		Admin user2 = new Admin("1", "TDN", "21130574@gmail.com", password, "0334499506", null, null, "tdn");
        System.out.println(ad.selectByUsername("tdn"));
	    ad.insert(user2);
		ArrayList<Admin> kq = ad.selectAll();
		for (Admin author3 : kq) {
			System.out.println(author3.toString());
			
		}
//	authoradd.setPassword("da thay doi");
//	System.out.println("da doi bio, thuc thi cau lenh update");
//	
//	ad.delete(authoradd);
	}
}
