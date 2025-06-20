package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.Order;

@WebServlet("/views/secure/orderConfirm")

public class OrderConfirm extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// Orderオブジェクトを生成してフォーム値をセット
		Order order = new Order();
		order.setMemberId(request.getParameter("member_id"));
		order.setPaymentMethod(request.getParameter("payment_method"));
		order.setShippingAddress(request.getParameter("shipping_address"));
		order.setDeliveryMethod(request.getParameter("delivery_method"));
		order.setPlacementLocation(request.getParameter("placement_location"));
		
		// 金額（int）変換処理（nullや空の考慮も加えると良い）
		try {
			order.setTotalPrice(Integer.parseInt(request.getParameter("total_price")));
		} catch (NumberFormatException e) {
			order.setTotalPrice(0); // エラー時は0に設定（適宜エラーハンドリング追加可）
		}

		// セッションに注文情報を保存
		session.setAttribute("order", order);

		// 確認画面へリダイレクト
		response.sendRedirect("order-confirm.jsp");
	}
}