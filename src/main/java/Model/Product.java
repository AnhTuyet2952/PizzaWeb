/**
 * 
 */
package Model;

/**
 * 
 */
public class Product {
	private String idProduct;
	private String nameProduct;
	private Category category;
	private String description;
	private double price;
	private String image;
	public Product(String idProduct, String nameProduct, Category category, String description, double price, String image) {
		super();
		this.idProduct = idProduct;
		this.nameProduct = nameProduct;
		this.category = category;
		this.description = description;
		this.price = price;
		this.image = image;
	}
	public Product() {
		super();
	}
	
	public String getIdProduct() {
		return idProduct;
	}
	
	public void setIdProduct(String idProduct) {
		this.idProduct = idProduct;
	}
	
	public String getNameProduct() {
		return nameProduct;
	}
	
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	
	public Category getCategory() {
		return category;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	

}
