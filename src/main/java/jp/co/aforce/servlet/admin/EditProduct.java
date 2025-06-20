package jp.co.aforce.servlet.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Product;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/views/secure/admin/edit-product")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// リクエストから商品IDを取得
			String idStr = request.getParameter("product_id");
			if (idStr == null || idStr.isEmpty()) {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "商品IDが指定されていません");
				return;
			}

			int productId = Integer.parseInt(idStr);

			// DAOから商品情報を取得
			ProductDAO dao = new ProductDAO();
			Product product = dao.getProductById(productId);

			// 商品が見つからない場合
			if (product == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "指定された商品が存在しません");
				return;
			}

			// JSPに商品情報を渡す
			request.setAttribute("product", product);
			request.getRequestDispatcher("admin-ProductEdit.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "商品情報の取得に失敗しました");
		}
	}
}



