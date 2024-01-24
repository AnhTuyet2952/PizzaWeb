/**
 * 
 */
package Model;

import java.sql.Date;
import java.util.List;

/**
 * 
 */
public class Order {
	private String oderId;
	private User user;
	private String address;
	private String note;
	private double total;
	private Date bookingDate;
	private String status ; //processing: dang xu ly, accept: chap nhan, reject:tu choi
	private String nameConsignee; //ten nguoi nhan hang
	private String phoneConsignee; //so dien thoai cua nguoi nhan
	private List<OrderDetail> orderDetails;
	  public Order(String i, User user, String address, String note, double total, Date bookingDate, String nameConsignee, String phoneConsignee) {
	        this.oderId = i;
	        this.user = user;
	        this.address = address;
	        this.note = note;
	        this.total = total;
	        this.bookingDate = bookingDate;
	        this.status = "processing";
	        this.nameConsignee=nameConsignee;
	        this.phoneConsignee=phoneConsignee;
	    }

	    // Constructor cho việc sửa đổi status
	    public Order(String i, User user, String address, String note, double total, Date bookingDate, String status, String nameConsignee, String phoneConsignee) {
	        this(i, user, address, note, total, bookingDate, nameConsignee, phoneConsignee);
	        this.status = status;
	    }

	public Order() {
		super();
	}
	
	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public String getNameConsignee() {
		return nameConsignee;
	}

	public void setNameConsignee(String nameConsignee) {
		this.nameConsignee = nameConsignee;
	}

	public String getPhoneConsignee() {
		return phoneConsignee;
	}

	public void setPhoneConsignee(String phoneConsignee) {
		this.phoneConsignee = phoneConsignee;
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
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
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