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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String lang = (String) session.getAttribute("language");
		String productName = request.getParameter("productName");

		if (lang == null || lang.isEmpty()) {
			lang = "vi";
			session.setAttribute("language", lang);
		}
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listProductSearchByName = productDAO.selectByProductName(productName, lang);

		int count = listProductSearchByName.size();// dem so san pham trong list
		int page, numpage = 6;// dat gioi han so san pham 1 trang
		// neu chia het cho so trang thi lay so do làm tong so trang
		// k chia het thì lay so do bo +1 làm tong so trang
		int num = (count % 6 == 0) ? (count / 6) : ((count / 6) + 1);
		// Lấy số trang hiện tại từ tham số yêu cầu
		String xpage = request.getParameter("page");
		if (xpage == null) {
			page = 1;// Nếu tham số trang không tồn tại, đặt số trang là 1
		} else {
			page = Integer.parseInt(xpage);// Nếu tham số trang tồn tại, chuyển đổi thành số nguyên
		}
		int start, end;
		start = (page - 1) * numpage;
		end = Math.min(page * numpage, count);

		List<Product> list2 = productDAO.getListByPage(listProductSearchByName, start, end);

		request.getSession().setAttribute("listProductSearchByName", list2);
		request.getSession().setAttribute("page", page);
		request.getSession().setAttribute("num", num);

		session.setAttribute("searchKeyword", productName);
		// lay toan bo danh sach khi khong tim thay ket qua
		List<Product> list = productDAO.selectAll();
		int countAll = list.size();
		int numAll = (countAll % numpage == 0) ? (countAll / numpage) : ((countAll / numpage) + 1);
		int end2 = Math.min(page * numpage, countAll);
		List<Product> list3 = productDAO.getListByPage(list, start, end2);
		request.getSession().setAttribute("listProductAll", list3);
		request.getSession().setAttribute("numAll", numAll);

		// chuyen huong trang
		String url = "/pizza-gh-pages/pizza-gh-pages/searchResultPage.jsp";
		response.sendRedirect(request.getContextPath() + url);
//	            response.sendRedirect(request.getHeader("Referer"));

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}