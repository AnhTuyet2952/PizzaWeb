package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class ListProduct
 */
@WebServlet("/ListProduct")
public class ListProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		 try {
	            String productName = request.getParameter("productName");
	            ProductDAO productDAO = new ProductDAO();
	            List<Product> list = productDAO.selectAll();
	            int count = list.size();
	            int page, numpage = 6;
	        	int num = (count%6==0?(count/6):((count/6)+1));
	        	String xpage = request.getParameter("page");
	        	if(xpage==null) {
	        		page=1;
	        	}else {
	        		page=Integer.parseInt(xpage);
	        	}
	        	int start,end;
	        	start = (page-1)*numpage;
	        	end = Math.min(page*numpage, count);
	        	List<Product> list3 = productDAO.getListByPage(list, start, end);
	            // Truyền thông tin ngôn ngữ vào request
	        	request.getSession().setAttribute("listProduct", list3);
	            request.getSession().setAttribute("page", page);
	        	request.getSession().setAttribute("num", num);
	        	
	            session.setAttribute("searchKeyword", productName);
	        
	            String url = "/pizza-gh-pages/pizza-gh-pages/searchResultPage.jsp";
//	            request.getRequestDispatcher(url).forward(request, response);
	            response.sendRedirect(request.getContextPath() + url);
//	            response.sendRedirect(request.getHeader("Referer"));
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
