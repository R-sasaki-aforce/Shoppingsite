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
 * Servlet implementation class EditProductUpdate
 */
@WebServlet("/views/secure/admin/update-product-final")
public class EditProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// セッションから確認済みの商品情報を取得
			HttpSession session = request.getSession();
			Product product = (Product) session.getAttribute("product");

			if (product != null) {
				ProductDAO dao = new ProductDAO();
				int result = dao.updateProduct(product);

				if (result > 0) {
					session.removeAttribute("updateProduct");
					List<Product> products = dao.getAllProducts();
					
					session.setAttribute("productList", products);
					response.sendRedirect("admin-ProductEditSuccess.jsp");
				} else {
					response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "更新に失敗しました。");
				}
			} else {
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "商品情報が見つかりません。");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "更新処理中にエラーが発生しました。");
		}
	}

}
