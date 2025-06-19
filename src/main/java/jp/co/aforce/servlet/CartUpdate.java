package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.User;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class CartUpdate
 */

@WebServlet("/views/secure/CartUpdate")
public class CartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("loginUser");
		
	        String action = request.getParameter("action");
	        String memberId = user.getMember_id();
	        int productId = Integer.parseInt(request.getParameter("product_id"));

	        try {
	            ProductDAO dao = new ProductDAO();

	            if ("数量変更".equals(action)) {
	                int quantity = Integer.parseInt(request.getParameter("quantity"));

	                if (quantity > 0) {
	                    dao.updateCartItemQuantity(memberId, productId, quantity);
	                } else {
	                    // 数量0の場合は削除扱い
	                    dao.deleteCartItem(memberId, productId);
	                }

	            } else if ("削除".equals(action)) {
	                dao.deleteCartItem(memberId, productId);
	            }

	            response.sendRedirect("cart.jsp");

	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
	}

}
