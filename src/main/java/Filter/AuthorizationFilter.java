/**
 * 
 */
package Filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Beans.ErrorBean;
import Model.User;

/**
 * 
 */
public class AuthorizationFilter implements Filter{

	private ServletContext context;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.context = filterConfig.getServletContext();
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		String url = request.getRequestURI();
		
		if(url.contains("/changeInformation")||url.contains("/changePassword")||url.contains("/profile")) {
			User customer = (User) request.getSession().getAttribute("customer");
			if(customer!=null) {
				filterChain.doFilter(servletRequest, servletResponse);
			}else {
				
				 ErrorBean eb = new ErrorBean();
	          	 eb.setError("Vui long dang nhap vao tai khoan nguoi dung de thuc hien");
				url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp";
	               response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	               return;
			}
		}
		
		if(url.contains("/admin")) {
			User admin = (User) request.getSession().getAttribute("admin");
			if(admin!=null) {
				filterChain.doFilter(servletRequest, servletResponse);
			}else {
				
				 ErrorBean eb = new ErrorBean();
	          	 eb.setError("Vui long dang nhap vao tai khoan admin");
				url =  request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/login.jsp";
	               response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
	               return;
			}
		}else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
		
	}

}
