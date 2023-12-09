/**
 * 
 */
package Model;

import java.sql.Date;

/**
 * 
 */
public class Customer {
	private String customerId;
	private String username;
	private String password;
	private String name;
	private Date birthday;
	private String sexual;
	private String phoneNumber;
	private String email;
	private String avatar;
	public Customer(String i, String username, String password, String name, Date birthday, String gt,
			 String phoneNumber, String email, String avatar) {
		super();
		this.customerId = i;
		this.username = username;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		sexual = gt;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.avatar = avatar;
	}
	public Customer() {
		super();
	}
	
	public String getSexual() {
		return sexual;
	}
	public void setSexual(String sexual) {
		this.sexual = sexual;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getBirthday() {
		return birthday;
	}
	
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public String getGt() {
		return sexual;
	}

	public void setGt(String gt) {
		sexual = gt;
	}
	
	public String getPhoneNumber() {
		return phoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	

}
