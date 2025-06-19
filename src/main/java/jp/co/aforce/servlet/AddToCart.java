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
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
//@SuppressWarnings("unchecked")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        // セッションからログインユーザーを取得
        User user = (User) session.getAttribute("loginUser");
		
        try {
            // フォームから送られた商品IDと数量を取得
            int productId = Integer.parseInt(request.getParameter("product_id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String memberId = user.getMember_id();

            // DAOを使ってカートに追加
            ProductDAO dao = new ProductDAO();
            boolean result = dao.addToCart(memberId, productId, quantity);

            if (result) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("商品をカートに追加しました。");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("カートへの追加に失敗しました。");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("不正な商品IDまたは数量です。");

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("エラーが発生しました。");
        }
	}

}
