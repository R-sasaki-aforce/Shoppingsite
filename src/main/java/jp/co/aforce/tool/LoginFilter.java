package jp.co.aforce.tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/views/secure/*")
public class LoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);

		
		if (session != null&& session.getAttribute("loginUser") != null ) {
			chain.doFilter(request, response); // 通過させる
		} else {
			// 未ログインならログインページにリダイレクト
			res.sendRedirect(req.getContextPath() + "/views/sessionerror.jsp");
		}
	}
	  public void init(FilterConfig Config) throws ServletException {}

	    public void destroy() {}
	
	
}
