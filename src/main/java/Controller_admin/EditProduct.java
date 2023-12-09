package Controller_admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.CategoryDAO;
import Database.ProductDAO;
import Model.Category;
import Model.Product;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idProduct = request.getParameter("idProduct");
		System.out.println("id: "+ idProduct);
		String name = request.getParameter("name");
		String categoryId = request.getParameter("category");
		
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		
		String url = "";
		CategoryDAO categoryDao = new CategoryDAO();
		Category category = categoryDao.selectById(categoryId);
		
			ProductDAO productDao = new ProductDAO();
			Product product = new Product(idProduct, name, category, description, Double.parseDouble(price), image);
			System.out.println(product);
			productDao.update(product);
			url = "/admin/pages/product-features/listProduct.jsp";
			
       	    response.sendRedirect(request.getContextPath() + url);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
