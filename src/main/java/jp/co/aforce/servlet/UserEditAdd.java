package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//修正したユーザーの情報をデータベースにUpdateするさーぶれっと
/**
 * Servlet implementation class UserEditAdd
 */
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;
import jp.co.aforce.beans.UserBean;
import jp.co.aforce.dao.UserDao;

@WebServlet("/views/usereditadd")
public class UserEditAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			HttpSession session = request.getSession();

			// セッションから修正情報取得
			UserBean user = (UserBean) session.getAttribute("editinfo");

			User user2 = (User) session.getAttribute("loginUser");
			if (user == null) {
				response.sendRedirect("retouching.jsp");
				return;
			}

			UserDao dao = new UserDao();

			
			dao.updateUserInfo(user, user2);
			// セッション上のログイン情報も更新する
			User user3 =dao.findById(user2.getMember_id());
			session.setAttribute("loginUser", user3);
			response.sendRedirect("userEditSuccess.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

	}

}
