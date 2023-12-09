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

import Model.Customer;
import Model.Users;
import util.PasswordEncryption;

/**
 * 
 */
public class UsersDAO implements DAOInterface<Users> {
	private ArrayList<Users> data = new ArrayList<>();

	public UsersDAO() {
		super();
	}

	@Override
	public ArrayList<Users> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM users ";

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

				Users user = new Users(id, name, email, password, phoneNumber, avatar, birthday, username);

				data.add(user);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return data;
	}

	@Override
	public Users selectById(String id) {
		Users result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM users WHERE user_id =?";

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

				result = new Users(id, name, email, password, phoneNumber, avatar, birthday, username);

				JDBCUtil.closeConnection(con);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	public Users selectByUsernamePassword(String username, String password) {
		Users result = null;

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
				String email = rs.getString("email");
				String phoneNumber = rs.getString("phoneNumber");
				String name = rs.getString("name");
				String avatar = rs.getString("avatar");
				Date birthday = rs.getDate("birthday");

				result = new Users(id, name, email, password, phoneNumber, avatar, birthday, username);


			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int insert(Users user) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "INSERT INTO users(user_id, username, password, email, phoneNumber, name, avatar, birthday )" + "VALUE(?, ?, ?, ?, ?, ?, ?, ?)";

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
	public int insertAll(ArrayList<Users> list) {
		int result = 0;
		for (Users user : list) {

			;
			if (this.insert(user) == 1)
				result += 1;
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

	@Override
	public int delete(Users user) {
		int result = 0;

		try {
			Connection con = JDBCUtil.getConnection();

			String sql = "DELETE from users " + "WHERE user_id=?";

			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, user.getId());

			result = rs.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return result;
	}

	@Override
	public int deleteAll(ArrayList<Users> list) {
		int result = 0;

		for (Users user : list) {
			result += delete(user);
		}
		return result;
	}

	@Override
	public int update(Users user) {
		int result = 0;
		Users oldCustomer = this.selectById(user.getId() + "");
		if (oldCustomer != null) {
			try {
				Connection con = JDBCUtil.getConnection();

				String sql = "UPDATE users SET  username=? " + ", password=? "+ ", email=? "+ ", phoneNumber=? "+ ", name=? "+ ", avatar=? " + ", birthday=? "
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
		UsersDAO ad = new UsersDAO();

		Users user = ad.selectById("1");

		String password = PasswordEncryption.toSHA1("0405");
	    Users user2 = new Users("1", "TDN", "21130574@gmail.com", password, "0334499506", null, null, "tdn");
	   Users user3 = new Users("3", "tuyet", "levuanhtuyet@gmail.com", "1992003", "0522443042", null, null, "tuyet1992003");
        System.out.println(ad.selectByUsername("tdn"));
	    ad.insert(user2);
		ArrayList<Users> kq = ad.selectAll();
		for (Users author3 : kq) {
			System.out.println(author3.toString());
			
		}
//	authoradd.setPassword("da thay doi");
//	System.out.println("da doi bio, thuc thi cau lenh update");
//	
//	ad.delete(authoradd);
	}
}
