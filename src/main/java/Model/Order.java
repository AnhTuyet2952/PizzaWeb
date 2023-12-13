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
	private String note;
	private double total;
	private Date bookingDate;
	private String status = "processing"; //dang xu ly, confirmed: chap nhan, rejected:tu choi
	public Order(String i, Customer user, String address, String note, double total, Date bookingDate, String status) {
		super();
		this.oderId = i;
		this.user = user;
		this.address = address;
		this.note = note;
		this.total = total;
		this.bookingDate = bookingDate;
		this.status = "processing";
	}
	public Order() {
		super();
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
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
