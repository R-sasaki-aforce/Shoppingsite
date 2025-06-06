package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;

//登録する情報を確認画面に情報を渡す処理

/**
 * Servlet implementation class UserAddConfirm
 */
@WebServlet("/views/useraddconfirm")
public class UserAddConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		String member_id = request.getParameter("member_id");
		String password = request.getParameter("password");
		String last_name = request.getParameter("last_name");
		String first_name = request.getParameter("first_name");
		String address = request.getParameter("address");
		String mail_address = request.getParameter("mail_address");
		
		User user =new User(member_id,password,last_name,first_name,address,mail_address);
		HttpSession session = request.getSession();
		session.setAttribute("confirminfo", user);
		response.sendRedirect("userAddConfirm.jsp");
	}

}
