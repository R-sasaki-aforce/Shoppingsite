package jp.co.aforce.servlet.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.Order;
import jp.co.aforce.dao.ProductDAO;


@WebServlet("/views/secure/admin/admin-order-history")
public class AdminOrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			ProductDAO dao = new ProductDAO();
			List<Order> orderList = dao.getAllOrders();
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("admin-order-history.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "注文履歴の取得中にエラーが発生しました。");
			request.getRequestDispatcher("admin-menu.jsp").forward(request, response);
		}
		
		
	}

}
