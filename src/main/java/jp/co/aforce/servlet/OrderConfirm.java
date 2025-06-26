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

        // 入力値の取得
        String memberId = request.getParameter("member_id");
        String paymentMethod = request.getParameter("payment_method");
        String shippingAddress = request.getParameter("shipping_address");
        String deliveryMethod = request.getParameter("delivery_method");
        String placementLocation = request.getParameter("placement_location");
        int totalPrice = 0;

        try {
            totalPrice = Integer.parseInt(request.getParameter("total_price"));
        } catch (NumberFormatException e) {
            totalPrice = 0;
        }

        // Orderオブジェクト作成
        Order order = new Order();
        order.setMemberId(memberId);
        order.setPaymentMethod(paymentMethod);
        order.setShippingAddress(shippingAddress);
        order.setDeliveryMethod(deliveryMethod);
        order.setPlacementLocation(placementLocation);
        order.setTotalPrice(totalPrice);

        // セッションに保存
        HttpSession session = request.getSession();
        session.setAttribute("order", order);

        // 確認ページにリダイレクト（またはフォワード）
        response.sendRedirect(request.getContextPath() + "/views/secure/order-confirm.jsp");
    }
}
