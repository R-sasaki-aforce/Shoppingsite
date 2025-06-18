package jp.co.aforce.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Product;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class ProductSearch
 */
@WebServlet("/views/secure/product-search")
public class ProductSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 検索キーワード取得
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");

		ProductDAO dao = new ProductDAO();
		List<Product> productList = null;

		try {
			productList = dao.searchByKeyword(keyword); // キーワードで検索
		} catch (Exception e) {
			e.printStackTrace();
			productList = new ArrayList<>(); // 例外時は空リスト
		}

		// 検索結果をリクエスト属性に保存
		request.setAttribute("productList", productList);
		request.setAttribute("keyword", keyword); // 検索語も表示用に渡す

		// 検索結果ページにフォワード（redirectではなくforward）
		request.getRequestDispatcher("productsearch-result.jsp").forward(request, response);
	}
}
