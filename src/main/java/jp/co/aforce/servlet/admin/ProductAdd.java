package jp.co.aforce.servlet.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Product;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class ProductAdd
 */
@WebServlet("/views/secure/admin/productadd")
public class ProductAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Product p = (Product) session.getAttribute("AddproductConf");

		if (p == null) {
			// セッション切れや直接アクセス時の対応
			response.sendRedirect("admin-ProductAdd.jsp");
			return;
		}

		try {
			ProductDAO dao = new ProductDAO();
			int result = dao.insertProduct(p);

			if (result > 0) {
				// 成功時：セッションのデータを削除し、完了ページへ
				session.removeAttribute("AddproductConf");
				request.getRequestDispatcher("productadd-success.jsp").forward(request, response);
			} else {
				// 失敗時
				request.setAttribute("error", "登録に失敗しました。");
				request.getRequestDispatcher("admin-ProductAdd.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "エラーが発生しました。");
			request.getRequestDispatcher("admin-ProductAdd.jsp").forward(request, response);
		}
	}

}
