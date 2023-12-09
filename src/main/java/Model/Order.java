/**
 * 
 */
package Model;

import java.sql.Date;

/**
 * 
 */
public class Order {
	private String oderId;
	private Customer user;
	private String address;
	private String status;
	private double total;
	private Date bookingDate;
	public Order(String i, Customer user, String address, String status, double total, Date bookingDate) {
		super();
		this.oderId = i;
		this.user = user;
		this.address = address;
		this.status = status;
		this.total = total;
		this.bookingDate = bookingDate;
	}
	public Order() {
		super();
	}
	
	public String getOderId() {
		return oderId;
	}
	
	public void setOderId(String oderId) {
		this.oderId = oderId;
	}
	
	public Customer getUser() {
		return user;
	}

	public void setUser(Customer user) {
		this.user = user;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public double getTotal() {
		return total;
	}
	
	public void setTotal(double total) {
		this.total = total;
	}
	
	public Date getBookingDate() {
		return bookingDate;
	}
	
	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
	

}
