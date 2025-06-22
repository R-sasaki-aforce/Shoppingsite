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
 * Servlet implementation class UsersList
 */
@WebServlet("/views/secure/admin/admin-users-list")
public class UsersList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	        try {
	        	 UserDao dao = new UserDao();
	            List<User> users = dao.getAllusers();
	           
	            HttpSession session = request.getSession();
	            session.setAttribute("users", users);

	            response.sendRedirect("admin-usersList.jsp");
	           
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "ユーザー情報の取得に失敗しました。");
	        }
		
	}

}
