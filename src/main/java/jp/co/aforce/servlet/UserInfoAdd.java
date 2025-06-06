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

//確認したあとにユーザーの情報をデータベースに登録する処理。
//すでに登録されている情報があればエラーページに遷移
/**
 * Servlet implementation class UserInfoAdd
 */
@WebServlet("/views/userinfoadd")
public class UserInfoAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("confirminfo");

			if (user == null) {
				response.sendRedirect("registration.jsp");
				return;
			}
			UserDao userDao = new UserDao();
			
			System.out.println(user.getMember_id());
			//			インサートする前にユーザーID重複チェック
			if (userDao.isDuplicateId(user.getMember_id())) {
				response.sendRedirect("infoaddError.jsp");
				
				return;
				
			} else{
				
				userDao.userInfoAdd(user);//インサートする
				session.removeAttribute("confirminfo");
				
				response.sendRedirect("register-success.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

	}
}
