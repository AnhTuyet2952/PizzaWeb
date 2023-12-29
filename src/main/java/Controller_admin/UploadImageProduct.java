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

import Database.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class UploadImageProduct
 */
@WebServlet("/UploadImageProduct")
@MultipartConfig
public class UploadImageProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ProductDAO productDAO;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        productDAO = new ProductDAO();
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	            String idProduct = request.getParameter("idProduct");
	            System.out.println("id: " + idProduct);
	            // Kiểm tra idProduct không null hoặc trống
	            if (idProduct != null && !idProduct.isEmpty()) {
	                // Lấy sản phẩm từ database hoặc session (tuỳ vào cách bạn lưu trữ sản phẩm)
	                Product product = productDAO.selectById(idProduct);

	                // Kiểm tra sản phẩm không null
	                if (product != null) {
	                    Part filePart = request.getPart("image");
	                    if (filePart != null && filePart.getSize() > 0) {
	                        // Lưu hình ảnh vào thư mục của bạn
	                        String uploadPath = "D:/AnhTuyet/pizza_web/src/main/webapp/image/";
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
	                        // Cập nhật sản phẩm trong database
	                        productDAO.updateImage(product);
	                    }

	                    // Cập nhật sản phẩm trong session
	                    request.getSession().setAttribute("product", product);

	                    // Chuyển hướng đến trang danh sách sản phẩm sau khi cập nhật hình ảnh
	                    response.sendRedirect(request.getContextPath() + "/admin/pages/product-features/listProduct.jsp");
	                    return;
	                }
	            }

	    }




}
