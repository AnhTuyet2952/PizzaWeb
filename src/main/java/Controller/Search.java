package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class Search
 */
@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		 try {
	            String productName = request.getParameter("productName");
	            ProductDAO productDAO = new ProductDAO();
	            String lang = (String) request.getSession().getAttribute("language");
	            int count = productDAO.countProductByName(productName);
	            ArrayList<Product> listProductSearchByName = productDAO.selectByProductName2(productName, lang);

	            HttpSession session = request.getSession();
	            session.setAttribute("listProductSearchByName", listProductSearchByName);

	            // Truyền thông tin ngôn ngữ vào request
	            request.setAttribute("language", lang);

	            System.out.println("productName: " + productName);
	            System.out.println("Count: " + count);
	            System.out.println("List size: " + listProductSearchByName.size());

	            String url = "/pizza-gh-pages/pizza-gh-pages/searchResultPage.jsp";
	            response.sendRedirect(request.getContextPath() + url);
	        } catch (Exception e) {
	            // Xử lý ngoại lệ
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}