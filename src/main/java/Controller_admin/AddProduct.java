package Controller_admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Database.CategoryDAO;
import Database.ProductDAO;
import Model.Category;
import Model.Product;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/addProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductDAO productDao;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        productDao = new ProductDAO();
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  String uploadPath = "C:/Users/ADMIN/eclipse-workspace/pizza_web/src/main/webapp/image/";
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String nameen = request.getParameter("nameen");
		String descriptionen = request.getParameter("descriptionen");
		String categoryId = request.getParameter("category");
		String price = request.getParameter("price");
	
		  File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs();
		    }
		    Part filePart = request.getPart("image");
		    String fileName = filePart.getSubmittedFileName();

		    try (InputStream is = filePart.getInputStream()) {
		        Files.copy(is, new File(uploadPath, fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
		    }

		    String newImagePath = "image/" + fileName;
		String url = "";
		CategoryDAO categoryDao = new CategoryDAO();
		Category category = categoryDao.selectById(categoryId);
		System.out.println("category: "+category.getCategoryId());
			productDao = new ProductDAO();
			int id = productDao.creatId();
			Product product = new Product();
			product.setIdProduct(id+"");
			product.setNameProduct(name);
			product.setCategory(category);
			product.setDescription(description);
			product.setNameProducten(nameen);
			product.setDescriptionen(descriptionen);
			product.setImage(newImagePath);
			product.setPrice(Double.parseDouble(price));
			productDao.insert(product);
			url = "/admin/pages/product-features/them.jsp";
			
     	    response.sendRedirect(request.getContextPath() + url);
	}

}
