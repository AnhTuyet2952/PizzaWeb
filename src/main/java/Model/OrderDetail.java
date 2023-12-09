package Model;
/**
 * chi tiet hoa don
 */
public class OrderDetail {
	private Order orderId;
	private Product products;
	private int quantity;
	private double price;
	public OrderDetail(Order orderId, Product products, int quantity, double price) {
		super();
		this.orderId = orderId;
		this.products = products;
		this.quantity = quantity;
		this.price = price;
	}
	public OrderDetail() {
		super();
	}
	
	public Order getOrderId() {
		return orderId;
	}
	public void setOrderId(Order orderId) {
		this.orderId = orderId;
	}
	public Product getProducts() {
		return products;
	}
	public void setProducts(Product products) {
		this.products = products;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	

	
	
}
