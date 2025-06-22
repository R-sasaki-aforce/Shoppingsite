package jp.co.aforce.servlet.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/views/secure/admin/admin-EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String member_id = request.getParameter("member_id");
		String lastName = request.getParameter("last_name");
		String firstName = request.getParameter("first_name");
		String address = request.getParameter("address");
		String mail = request.getParameter("mail_address");
		int role = Integer.parseInt(request.getParameter("role"));
		
		User u =new User(member_id, "",lastName, firstName, address, mail, role);
		
		HttpSession session = request.getSession();
		session.setAttribute("userinfo", u);
		response.sendRedirect("admin-EditUser.jsp");
	}

}
