package jp.co.aforce.servlet;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/views/login-in")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		String member_Id = request.getParameter("member_id");
		String password = request.getParameter("password");

		try {
			UserDao userDao = new UserDao();
			List<User> users = userDao.getAllusers();

			User matchedUser = null;
			//一致したユーザーがいたらその時点で処理をやめたほうがいい
			for (User user : users) {
				if (user.getMember_id().equals(member_Id) && user.getPassword().equals(password)) {
					matchedUser = user;
					break;
				}
			}
			//セッションはログインが成功が確定してから保存した方が良い
			if (matchedUser != null) {
				// セッションにユーザー情報を保存
				HttpSession session = request.getSession();
				
				String name = userDao.iDlinkNAME(member_Id);
				
				session.setAttribute("userName", name);

				response.sendRedirect("user-menu.jsp");
			} else {

				response.sendRedirect("login-error.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("system-error.jsp");
		}
	}

}
