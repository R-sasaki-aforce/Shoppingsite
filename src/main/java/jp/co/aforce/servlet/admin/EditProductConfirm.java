package jp.co.aforce.servlet.admin;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import jp.co.aforce.beans.Product;

/**
 * Servlet implementation class EditProductConfirm
 */
@WebServlet("/views/secure/admin/update-product-confirm")
@MultipartConfig
public class EditProductConfirm extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int productId = Integer.parseInt(request.getParameter("product_id"));
		String name = request.getParameter("name");
		String artist = request.getParameter("artist_name");
		String genre = request.getParameter("genre");
		int price = Integer.parseInt(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		String releaseDate = request.getParameter("release_date");
		
		
		Part imagePart = request.getPart("image_path");
		String imageFileName = imagePart.getSubmittedFileName();
		
		
		HttpSession session = request.getSession();
		Product product = new Product();
		product.setProductId(productId);
		product.setName(name);
		product.setArtistName(artist);
		product.setGenre(genre);
		product.setPrice(price);
		product.setStock(stock);
		
		if (releaseDate != null && !releaseDate.isEmpty()) {
			product.setReleaseDate(Date.valueOf(releaseDate));
		}
		
		product.setImagePath(imageFileName); // 仮でファイル名だけ保持（本保存は後で）

		session.setAttribute("product", product);
		session.setAttribute("imagePart", imagePart); // 画像ファイルのPartも保持

		request.getRequestDispatcher("admin-EditProductConfirm.jsp").forward(request, response);
	}
}
