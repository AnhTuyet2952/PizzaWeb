/**
 * 
 */
package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import Model.Category;
import Model.Customer;
import Model.Order;
import util.PasswordEncryption;

public class CustomerDAO implements DAOInterface<Customer> {
	private ArrayList<Customer> data = new ArrayList<>();

	public int creatId() {
		data=selectAll();
		return data.size();
	}
	public ArrayList<Customer> selectAll() {
		try {
			// tao mot connection
			Connection con = JDBCUtil.getConnection();

			// tao cau lenh sql
			String sql = "SELECT * FROM pizza.customers ";

			PreparedStatement st = con.prepareStatement(sql);

			// thuc thi
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String id = rs.getString("customer_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
			    String avatar = rs.getString("avatar");
				Customer customer = new Customer(id, username, password, name, birthday, gt,
						 phoneNumber, email, avatar);

				data.add(customer);

			}

			JDBCUtil.closeConnection(con);

		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		return data;
	}

	public Customer selectById(String id) {
		Customer result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.customers WHERE customer_id = ?";
            System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id1 = rs.getString("customer_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("email");
				String avatar = rs.getString("avatar");
				result = new Customer(id1, username, password, name, birthday, gt,phoneNumber, email, avatar);

				

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			 e.printStackTrace();
		}

		return result;
	}
	public Customer selectByUsernamePassword(String username, String password) {
		Customer result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.customers WHERE username = ? and password=? ";
            System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id = rs.getString("customer_id");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String email = rs.getString("username");
				String avatar = rs.getString("avatar");
			
				result = new Customer(id, username, password, name, birthday, gt,phoneNumber, email, avatar);

				

			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			 e.printStackTrace();
		}

		return result;
	}
	
	public Customer selectByEmail2(String email) {
		Customer result = null;

		try {

			Connection con = JDBCUtil.getConnection();

			String sql = "SELECT * FROM pizza.customers WHERE email = ?";
            System.out.println(sql);
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id = rs.getString("customer_id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Date birthday = rs.getDate("birthday");
				String gt = rs.getString("sexual");
				String phoneNumber = rs.getString("phoneNumber");
				String username = rs.getString("username");
				String avatar = rs.getString("avatar");
			
				result = new Customer(id, username, password, name, birthday, gt,phoneNumber, email, avatar);

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

			String sql = "SELECT * FROM pizza.customers WHERE username =?";

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

			String sql = "SELECT * FROM pizza.customers WHERE email =?";

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

	public int insert(Customer customer) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "INSERT INTO pizza.customers(customer_id, username, password ,name, birthday, sexual,phoneNumber, email, avatar)"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			System.out.println(sql);
			PreparedStatement rs = con.prepareStatement(sql);
			
			rs.setString(1, customer.getCustomerId());
			rs.setString(2, customer.getUsername());
			
			String passwordS = PasswordEncryption.toSHA1(customer.getPassword());
			
			rs.setString(3, passwordS);
			rs.setString(4, customer.getName());
			rs.setDate(5, customer.getBirthday());
			rs.setString(6, customer.getGt());
			rs.setString(7, customer.getPhoneNumber());
			rs.setString(8, customer.getEmail());
			rs.setString(9, customer.getAvatar());
			System.out.println(customer);
			
			result = rs.executeUpdate();
			System.out.println("da them vao");
			JDBCUtil.closeConnection(con);
					
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
    
    	return result;
	}

	public int insertAll(ArrayList<Customer> list) {
		int result = 0;
		for (Customer customer : list) {

			;
			if (this.insert(customer) == 1)
				result += 1;
		}
		return result;
	}

	public int delete(Customer customer) {
int result =0;
    	
    	try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "DELETE from pizza.customers "
					+ "WHERE customer_id=?";
			
			PreparedStatement rs = con.prepareStatement(sql);
			rs.setString(1, customer.getCustomerId());
			
			
			
			result= rs.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		}
    	
    	return result;
	}

	public int deleteAll(ArrayList<Customer> list) {
		int result = 0;

		for (Customer customer : list) {
			result += delete(customer);
		}
		return result;
	}

	public int update(Customer customer) {
		int result = 0;
		Customer oldCustomer = this.selectById(customer.getCustomerId());
    	if(oldCustomer !=null) {
    		try {
				Connection con = JDBCUtil.getConnection();
				
				String sql = "UPDATE pizza.customers SET  username=? "+ ", password=? "+ ", name=? "+ ", birthday=? "
				+ ", sexual=? "+ ", phoneNumber=? "+ ", email=? " +", avatar=? " + "WHERE customer_id =?";
				
				PreparedStatement rs = con.prepareStatement(sql);
				
				rs.setString(1, customer.getUsername());
				rs.setString(2, customer.getPassword());
				rs.setString(3, customer.getName());
				rs.setDate(4, customer.getBirthday());
				rs.setString(5, customer.getGt());
				rs.setString(6, customer.getPhoneNumber());
				rs.setString(7, customer.getEmail());
				rs.setString(8, customer.getAvatar());
			
				rs.setString(9, customer.getCustomerId());
				
				result = rs.executeUpdate();
				System.out.println("done");
			} catch (Exception e) {
				 e.printStackTrace();
			}
    	}
    	return result;
	}
	public static void main(String[] args) {
		CustomerDAO ad = new CustomerDAO();
		
//		Customer customerAdd = new Customer("2", "Trang", "1234", "Ngo Thuy Trang",  new Date(2003, 12, 13), "nu", "0334499506", "trang@gmail.com", null);
//		ad.insert(customerAdd);
		
		Customer customer = ad.selectByEmail2("trangthuyjungkook@gmail.com");
		
        System.out.println(customer.getUsername());
//		
//		ArrayList<Customer> kq = ad.selectAll();
//  for (Customer author3 : kq) {
//			System.out.println(author3.toString());
//		}
//		customerAdd.setName("da thay doi");
//		System.out.println("da doi bio, thuc thi cau lenh update");
//		
//		ad.delete(customerAdd);
	}
}
