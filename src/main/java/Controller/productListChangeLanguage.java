package Controller;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class productListChangeLanguage
 */
@WebServlet("/productListChangeLanguage")
public class productListChangeLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ProductDAO productDAO = new ProductDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// lay ngon ngu tu session
		String lang = (String) request.getSession().getAttribute("language");
		String url = "";
		if(lang==null) {
			lang ="en";//mac dinh la tieng anh
		}
		//load tep ngon ngu
		ResourceBundle bundle = ResourceBundle.getBundle("lang.product_"+lang);
		//lay danh sach san pham tu database
		List<Product> products = productDAO.selectAll();
		//chuyen doi ngon ngu cho moi san pham
		   for (Product product : products) {
	            String idProduct = product.getIdProduct();
	            String nameKey = "product" + idProduct + ".name";
	            String descriptionKey = "product" + idProduct + ".description";

	            product.setNameProduct(bundle.getString(nameKey));
	            product.setDescription(bundle.getString(descriptionKey));
	        }
		// set danh sach sp len request
        request.setAttribute("productList", products);
        url = "/pizza-gh-pages/pizza-gh-pages/menu.jsp";
System.out.println(products.toString());
        // Su dung RequestDispatcher de chuyen huong va giu lai du lieu trong request
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
