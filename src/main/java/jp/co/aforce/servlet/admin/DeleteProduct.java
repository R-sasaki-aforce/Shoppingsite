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
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/views/secure/admin/delete-product")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");

			int productId = Integer.parseInt(request.getParameter("product_id"));

			ProductDAO dao = new ProductDAO();
			int result = dao.deleteProduct(productId);

			if (result > 0) {
				HttpSession session = request.getSession();
				List<Product> products = dao.getAllProducts();
				
				session.setAttribute("productList", products);
				response.sendRedirect("admin-ProductsList.jsp?deleted=1");
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "商品が見つかりませんでした。");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "削除処理に失敗しました。");
		}
	}

}
