package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBean;

/**
 * Servlet implementation class UserEditConfirm
 */
@WebServlet("/views/secure/usereditconfirm")
public class UserEditConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String lastName = request.getParameter("last_name");
		String firstName = request.getParameter("first_name");
		String address = request.getParameter("address");
		String mail = request.getParameter("mail_address");
		
		UserBean userBean = new UserBean(lastName,firstName,address,mail);
		HttpSession session = request.getSession();
		session.setAttribute("editinfo", userBean);

		response.sendRedirect("userEditConfirm.jsp");
		
	}

}
