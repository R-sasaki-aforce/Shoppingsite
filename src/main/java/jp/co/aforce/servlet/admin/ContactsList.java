package jp.co.aforce.servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Contact;
import jp.co.aforce.dao.UserDao;

/**
 * Servlet implementation class ContactsList
 */
@WebServlet("/views/secure/admin/admin-contacts-lists")
public class ContactsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			UserDao dao = new UserDao();
			List<Contact> contactList = dao.getAllContacts();

			request.setAttribute("contactList", contactList);
			request.getRequestDispatcher("admin-contacts-list.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "お問い合わせ一覧の取得中にエラーが発生しました。");
			request.getRequestDispatcher("views/admin/error.jsp").forward(request, response);
		}
		
		
		
	}
}
