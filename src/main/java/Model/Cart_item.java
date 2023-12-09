package Model;

public class Cart_item {
	private String id;
	private int quantity;
	private double price;
	private Product product;
	private Cart cart;
	public Cart_item() {
		super();
	}
	
	public Cart_item(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}
	public Cart_item(String id, int quantity, double price, Product product, Cart cart) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.price = price;
		this.product = product;
		this.cart = cart;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = Math.max(quantity, 1);
		this.price = totalProduct();
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public double totalProduct() {
		return quantity*product.getPrice();
	}
	public String getProductName(String language) {
	    return (language != null && language.equals("en")) ? this.product.getNameProducten() : this.product.getNameProduct();
	}
}
