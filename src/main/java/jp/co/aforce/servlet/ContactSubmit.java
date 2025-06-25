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

/**
 * Servlet implementation class ContactSubmit
 */
@WebServlet("/views/secure/contact-submit")
public class ContactSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// フォームからのパラメータ取得
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");

		// セッションからログイン中のユーザーを取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");

		// ユーザーがログインしていない場合はログイン画面にリダイレクト
		if (loginUser == null) {
			response.sendRedirect("views/login-in.jsp");
			return;
		}

		String memberId = loginUser.getMember_id();

		try {
			UserDao dao = new UserDao();
			dao.insertContact(memberId, name, email, subject, message);

			// 登録成功メッセージとともに完了画面へ
			request.setAttribute("message", "お問い合わせを受け付けました。ありがとうございます。");
			request.getRequestDispatcher("contact-complete.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "送信中にエラーが発生しました。もう一度お試しください。");
			request.getRequestDispatcher("views/contact.jsp").forward(request, response);
		}
	}

}
