package jp.co.aforce.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Order;
import jp.co.aforce.beans.Product;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class OrderComplete
 */
@WebServlet("/views/secure/orderComplete")
public class OrderComplete extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		
		try {
			// OrderオブジェクトとcartListをセッションから取得
			Order order = (Order) session.getAttribute("order");
			@SuppressWarnings("unchecked")
			List<Product> cartList = (List<Product>) session.getAttribute("cartList");

			// カートが空または情報がない場合
			if (order == null || cartList == null || cartList.isEmpty()) {
				response.sendRedirect("order-form.jsp?error=1");
				return;
			}

			// DAOで注文処理実行
			ProductDAO dao =new ProductDAO();
			dao.insertOrder(
				order.getMemberId(),
				cartList,
				order.getPaymentMethod(),
				order.getShippingAddress(),
				order.getDeliveryMethod(),
				order.getDeliveryMethod().equals("置き配") ? order.getPlacementLocation() : null,
				order.getTotalPrice()
			);
			for (Product p : cartList) {
				int productId = p.getProductId();
				int quantity = p.getQuantity();
				dao.decreaseStock(productId, quantity);  // ← 在庫を減らす
			}

			
			
			
			session.setAttribute("purchasedItems", cartList);
			// セッションからカート情報と注文情報を削除
			session.removeAttribute("cartList");
			session.removeAttribute("order");

			
			ProductDAO productDao = new ProductDAO();
			List<Product> products = productDao.getAllProducts();
			session.setAttribute("productList", products);
			
			
			// 完了画面へリダイレクト
			response.sendRedirect("order-complete.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("order-form.jsp");
		}
	}
}
