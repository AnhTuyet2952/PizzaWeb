package Controller_admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
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
@WebServlet("/editProduct")
@MultipartConfig
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;

	@Override
	public void init() throws ServletException {
		super.init();
		productDao = new ProductDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String idProduct = request.getParameter("idProduct");
		System.out.println("id: " + idProduct);
		String name = request.getParameter("name");
		String categoryId = request.getParameter("category");
		String nameen = request.getParameter("nameen");
		String descriptionen = request.getParameter("descriptionen");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		CategoryDAO categoryDao = new CategoryDAO();
		Category category = categoryDao.selectById(categoryId);
		if (idProduct != null && !idProduct.isEmpty()) {
			Product product = productDao.selectById(idProduct);
			// Kiểm tra sản phẩm không null
			if (product != null) {
				Part filePart = request.getPart("image");
				if (filePart != null && filePart.getSize() > 0) {
					// Lưu hình ảnh vào thư mục của bạn
					String uploadPath = "C:/Users/ADMIN/eclipse-workspace/pizza_web/src/main/webapp/image/";
					File uploadDir = new File(uploadPath);
					if (!uploadDir.exists()) {
						uploadDir.mkdirs();
					}

					String fileName = filePart.getSubmittedFileName();
					try (InputStream is = filePart.getInputStream()) {
						Files.copy(is, Paths.get(uploadPath, fileName), StandardCopyOption.REPLACE_EXISTING);
					}

					// Cập nhật đường dẫn hình ảnh của sản phẩm
					product.setImage("image/" + fileName);
					product.setCategory(category);
					product.setDescription(description);
					product.setPrice(Double.parseDouble(price));
					product.setNameProducten(nameen);
					product.setDescriptionen(descriptionen);
					product.setNameProduct(name);
					productDao.update(product);
//					String imagePath = "image/"+fileName;
//					request.setAttribute("imagePath", imagePath);
				}
//			Product product = new Product(idProduct, name, category, description, price, image);
				// Cập nhật sản phẩm trong session
				request.getSession().setAttribute("product", product);

				// Chuyển hướng đến trang danh sách sản phẩm sau khi cập nhật hình ảnh
				response.sendRedirect(request.getContextPath() + "/admin/pages/product-features/listProduct.jsp");
				return;
			}
		}
	}

}
