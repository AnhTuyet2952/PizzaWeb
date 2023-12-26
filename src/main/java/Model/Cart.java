package Model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
	private String cartId;
    private User buyer;
    private Date buyDate;
    private List<Cart_item> cart_items; 
	public Cart(String cartId, User buyer, Date buyDate) {
		super();
		this.cartId = cartId;
		this.buyer = buyer;
		this.buyDate = buyDate;
	}

    public Cart() {
        this.cart_items = new ArrayList<>();
    }
    public boolean isEmpty() {
        return cart_items == null || cart_items.isEmpty();
    }
	
	public List<Cart_item> getCart_items() {
		return cart_items;
	}
	public void setCart_items(List<Cart_item> cart_items) {
		this.cart_items = cart_items;
	}
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public String getCartId() {
		return cartId;
	}
	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	//tinh tong so luong san pham
	 public int calculateTotalQuantity() {
	        int totalQuantity = 0;
	        if (cart_items != null) {
	            for (Cart_item item : cart_items) {
	                totalQuantity += item.getQuantity();
	            }
	        }
	        return totalQuantity;
	    }
	public void removeItem(String productid) {
		  Iterator<Cart_item> iterator = cart_items.iterator();
	        while (iterator.hasNext()) {
	            Cart_item cartItem = iterator.next();
	            if (cartItem.getProduct().getIdProduct().equals(productid)) {
	                iterator.remove();
	                return; // Đã xóa sản phẩm, không cần kiểm tra các phần tử khác
	            }
	        }

	}
	  public double calculateTotal() {
	        double total = 0;

	        if (cart_items != null) {
	            for (Cart_item item : cart_items) {
	                total += item.getProduct().getPrice() * item.getQuantity();
	            }
	        }

	        return total;
	    }

	   public void addToCart(Cart_item cartItem) {
	        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
	        for (Cart_item item : cart_items) {
	            if (item.getProduct().getIdProduct().equals(cartItem.getProduct().getIdProduct())) {
	                // Nếu đã tồn tại, tăng số lượng lên
	                item.setQuantity(item.getQuantity() + cartItem.getQuantity());
	                return;
	            }
	        }
	        // Nếu chưa tồn tại, thêm mới vào giỏ hàng
	        cart_items.add(cartItem);
	    }
	   public void updateQuantity(String productId, int newquantity) {
		   for (Cart_item cart_item : cart_items) {
			if(cart_item.getProduct().getIdProduct().equals(productId)) {
				cart_item.setQuantity(newquantity);
				return;
			}
		}
	   }
	   public Cart_item findCartItemId(String productid) {
		   for (Cart_item cart_item : cart_items) {
			if(cart_item.getProduct().getIdProduct().equals(productid)) {
				return cart_item;
			}
		}
		   return null;
	   }
	   public void increaseQuantity(String productId) {
		   Cart_item item = findCartItemId(productId);
		   if(item!=null) {
			   //tang so luong cua cartiem len 1
			   item.setQuantity(item.getQuantity()+1);
		   }
	   }
	   public void clearCart() {
	        cart_items.clear();
	    }
}
