package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOUT
 */
@WebServlet(urlPatterns = {"/views/secure/logout","/views/secure/admin/logout"})
public class LogOUT extends HttpServlet {
	
       
    
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		//session.removeAttribute("userName");
		session.removeAttribute("loginUser");
		session.removeAttribute("editinfo");
		response.sendRedirect(request.getContextPath() +"/views/login-in.jsp");
//		確認用
		//System.out.println(session.getAttribute("userName"));
	}

}
