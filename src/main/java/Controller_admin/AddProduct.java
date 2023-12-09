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
@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String categoryId = request.getParameter("category");
		
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		
		String url = "";
		CategoryDAO categoryDao = new CategoryDAO();
		Category category = categoryDao.selectById(categoryId);
		System.out.println("category: "+category.getCategoryId());
			ProductDAO productDao = new ProductDAO();
			int id = productDao.createId();
			Product product = new Product(id+"", name, category, description, Double.parseDouble(price), image);
			productDao.insert(product);
			url = "/admin/pages/product-features/them.jsp";
			
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
