package jp.co.aforce.servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Product;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/views/secure/admin/admin-product-list")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			ProductDAO dao = new ProductDAO();
			List<Product> products = dao.getAllProducts();

			// セッションに保存（requestでもOK）
			HttpSession session = request.getSession();
			session.setAttribute("productList", products);

			// 商品一覧ページへ転送
			request.getRequestDispatcher("admin-ProductsList.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "商品情報の取得に失敗しました");
		}
	}
}
