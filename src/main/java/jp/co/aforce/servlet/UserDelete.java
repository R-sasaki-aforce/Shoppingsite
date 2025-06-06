package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;
import jp.co.aforce.dao.UserDao;

//会員情報を消すサーブレット

@WebServlet("/views/user-delete")
public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("loginUser");
//		if (user == null) {
//			// ログインしていない場合はログイン画面に戻す
//			response.sendRedirect("login-in.jsp");
//			return;
//		}
		UserDao dao = new UserDao();
		try {
			dao.deleteUser(user);
			session.invalidate();
			response.sendRedirect("userDeleteSuccess.jsp");
			
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		
	}

}
