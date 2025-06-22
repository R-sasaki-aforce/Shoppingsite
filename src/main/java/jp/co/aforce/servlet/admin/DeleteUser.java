package jp.co.aforce.servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;
import jp.co.aforce.dao.UserDao;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/views/secure/admin/admin-user-delete")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String memberId = request.getParameter("member_id");
		 UserDao dao = new UserDao();
			try {
				dao.deleteUser(memberId);
				  List<User> users = dao.getAllusers();
		           
		            HttpSession session = request.getSession();
		            session.setAttribute("users", users);
				response.sendRedirect("admin-usersList.jsp");
				
			} catch (Exception e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		 
	}

}
