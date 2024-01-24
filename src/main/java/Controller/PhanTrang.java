package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class PhanTrang
 */
@WebServlet("/PhanTrang")
public class PhanTrang extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	String orderBy = request.getParameter("orderBy"); // Lấy giá trị từ request
        	List<Product> list = productDAO.selectAll2(orderBy);
        	if (orderBy == null || orderBy.isEmpty() || orderBy.equals("default")) {
        		orderBy = "default"; // hoặc thiết lập giá trị mặc định khác nếu cần
        	}
        	int page, numpage = 6;
        	int size = list.size();
        	int num = (size%6==0?(size/6):((size/6)+1));
        	String xpage = request.getParameter("page");
        	if(xpage==null || xpage.isEmpty()) {
        		page=1;
        	}else {
        		page=Integer.parseInt(xpage);
        	}
        	int start,end;
        	start = (page-1)*numpage;
        	end = Math.min(page*numpage, size);
        	List<Product> list2 = productDAO.getListByPage(list, start, end);
        	request.getSession().setAttribute("orderBy", orderBy);
        	request.getSession().setAttribute("listProduct", list2);
        	request.getSession().setAttribute("page", page);
        	request.getSession().setAttribute("num", num);
        	String url = "";
        	url = request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/menu.jsp";
    		response.sendRedirect(url);

        } catch (Exception e) {
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
