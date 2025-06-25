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
import jp.co.aforce.beans.User;
import jp.co.aforce.dao.ProductDAO;

/**
 * Servlet implementation class OrderHistory
 */
@WebServlet("/views/secure/order-history")
public class OrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");

		if (user == null) {
			response.sendRedirect("../login-in.jsp");
			return;
		}

		try {
			ProductDAO dao = new ProductDAO();
			List<Order> orders = dao.getOrdersByMemberId(user.getMember_id());
			request.setAttribute("orderList", orders);
			request.getRequestDispatcher("OrderHistory.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}
}
