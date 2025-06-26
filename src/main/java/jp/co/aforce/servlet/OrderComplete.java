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

	private static final Object lock = new Object();
	private static volatile boolean isProcessing = false;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// ここでフラグ確認と設定を1つの synchronized にまとめる
		synchronized (lock) {
			if (isProcessing) {
				response.sendRedirect("order-busy.jsp");  // 処理中ページに遷移
				return;
			}
			isProcessing = true; // フラグ立て
		}

		try {
			Thread.sleep(7000);  // テスト用ディレイ

			Order order = (Order) session.getAttribute("order");
			@SuppressWarnings("unchecked")
			List<Product> cartList = (List<Product>) session.getAttribute("cartList");

			if (order == null || cartList == null || cartList.isEmpty()) {
				response.sendRedirect("order-form.jsp?error=1");
				return;
			}

			ProductDAO dao = new ProductDAO();
			dao.insertOrder(
				order.getMemberId(),
				cartList,
				order.getPaymentMethod(),
				order.getShippingAddress(),
				order.getDeliveryMethod(),
				"置き配".equals(order.getDeliveryMethod()) ? order.getPlacementLocation() : null,
				order.getTotalPrice()
			);

			for (Product p : cartList) {
				dao.decreaseStock(p.getProductId(), p.getQuantity());
			}

			session.setAttribute("purchasedItems", cartList);
			session.removeAttribute("cartList");
			session.removeAttribute("order");

			session.setAttribute("productList", new ProductDAO().getAllProducts());

			response.sendRedirect("order-complete.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("order-form.jsp");

		} finally {
			// 処理終了時にフラグを戻す
			synchronized (lock) {
				isProcessing = false;
			}
		}
	}
}
