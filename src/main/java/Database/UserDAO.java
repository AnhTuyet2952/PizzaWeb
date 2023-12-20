/**
 * 
 */
package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.User;
import util.PasswordEncryption;

public class UserDAO implements DAOInterface<User> {
	private ArrayList<User> data = new ArrayList<>();

	public int creatId() {
		data = selectAll();
		return data.size();
	}

	public ArrayList<User> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM pizza.users ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String id = rs.getString("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				String avatar = rs.getString("avatar");
				int role_id = rs.getInt("role_id");
				User customer = new User(id, username, password, name, birthday, gt, phoneNumber, email, avatar,
						role_id);

				data.add(customer);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return data;
	}

	public User selectById(String id) {
		User result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.users WHERE user_id = ?";
			System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id1 = rs.getString("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				String avatar = rs.getString("avatar");
				int role_id = rs.getInt("role_id");
				result = new User(id1, username, password, name, birthday, gt, phoneNumber, email, avatar, role_id);

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public User selectByUsernamePassword(String username, String password) {
		User result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.users WHERE username = ? and password=? ";
			System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id = rs.getString("user_id");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("username");
				String avatar = rs.getString("avatar");
                int role_id = rs.getInt("role_id");
                result = new User(id, username, password, name, birthday, gt, phoneNumber, email, avatar,
						role_id);
                System.out.println("nguoi dung: "+ result);

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public User selectByEmail2(String email) {
		User result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.users WHERE email = ?";
			System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id = rs.getString("user_id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String username = rs.getString("username");
				String avatar = rs.getString("avatar");
				int role_id = rs.getInt("role_id");
				result = new User(id, username, password, name, birthday, gt, phoneNumber, email, avatar, role_id);

				return result;

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public boolean selectByUsername(String username) {

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.users WHERE username =?";

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

	public boolean selectByEmail(String email) {

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.users WHERE email =?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				return true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public int insert(User user) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO pizza.users(user_id, username, password ,name, birthday, sexual,phoneNumber, email, avatar, role_id)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
			PreparedStatement rs = con.prepareStatement(sql);

			rs.setString(1, user.getUserId());
			rs.setString(2, user.getUsername());

			String passwordS = PasswordEncryption.toSHA1(user.getPassword());

			rs.setString(3, passwordS);
			rs.setString(4, user.getName());
			rs.setDate(5, user.getBirthday());
			rs.setString(6, user.getGt());
			rs.setString(7, user.getPhoneNumber());
			rs.setString(8, user.getEmail());
			rs.setString(9, user.getAvatar());
			rs.setLong(10, user.getRole_id());
			System.out.println(user);

			result = rs.executeUpdate();
			System.out.println("da them vao");
			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return result;
	}

	public int insertAll(ArrayList<User> list) {
		int result = 0;
		for (User customer : list) {

			;
			if (this.insert(customer) == 1)
				result += 1;
		}
		return result;
	}

	public int delete(User user) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from pizza.users " + "WHERE user_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, user.getUserId());

			result = rs.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int deleteAll(ArrayList<User> list) {
		int result = 0;

		for (User user : list) {
			result += delete(user);
		}
		return result;
	}

	public int update(User user) {
		int result = 0;
		User oldUser = this.selectById(user.getUserId());
		if (oldUser != null) {
			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE pizza.users SET  username=? " + ", password=? " + ", name=? " + ", birthday=? "
						+ ", sexual=? " + ", phoneNumber=? " + ", email=? " + ", avatar=? " + ", role_id=? " + "WHERE user_id =?";

				PreparedStatement rs = con.prepareStatement(sql);

				rs.setString(1, user.getUsername());
				rs.setString(2, user.getPassword());
				rs.setString(3, user.getName());
				rs.setDate(4, user.getBirthday());
				rs.setString(5, user.getGt());
				rs.setString(6, user.getPhoneNumber());
				rs.setString(7, user.getEmail());
				rs.setString(8, user.getAvatar());
                rs.setInt(9, user.getRole_id());
				rs.setString(10, user.getUserId());

				result = rs.executeUpdate();
				System.out.println("done");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static void main(String[] args) {
		UserDAO ad = new UserDAO();

        User admin = new User(ad.creatId()+"", "tdn", new PasswordEncryption().toSHA1("0405"), "Nguyen", null, null, null, null, null,  1);
        ad.insert(admin);
	}
}
