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
import jp.co.aforce.beans.UserBean;
import jp.co.aforce.dao.UserDao;

/**
 * Servlet implementation class EditUserAdd
 */
@WebServlet("/views/secure/admin/usereditadd")
public class EditUserAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// セッションから修正情報取得
		UserBean user = (UserBean) session.getAttribute("editinfo");

		User user2 = (User) session.getAttribute("userinfo");

		UserDao dao = new UserDao();

		
		dao.updateUserInfo(user, user2);
		
		session.removeAttribute("editinfo");
		
         List<User> users = dao.getAllusers();
         session.setAttribute("users", users);
		response.sendRedirect("admin-EditUserAddSuccess.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
