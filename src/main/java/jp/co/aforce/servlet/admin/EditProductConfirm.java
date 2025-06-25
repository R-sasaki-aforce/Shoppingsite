package jp.co.aforce.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
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
		String sampleUrl = request.getParameter("sample_url");
		
		
		
		
		
		Part imagePart = request.getPart("image_path");
		 String fileName = null;
		
		 String submittedFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
		
		//String fileName = filePart.getSubmittedFileName();
		
		
		 if (submittedFileName != null && !submittedFileName.isEmpty()) {
	            // 新しい画像が選ばれている
	            fileName = submittedFileName;
	            // 保存処理（imagePart.getInputStream()など）を行う
	        } else {
	            // 画像が選択されていない場合（ファイル名が空）
	            fileName = request.getParameter("current_image_path");
	        }
		
		 if (fileName != null && !fileName.isEmpty()) {
	            // サーバー上のディレクトリにファイルを保存する処理を追加
	        	// String uploadDirectory =("C:/uploads/");  // 相対パスを使用
	        	 String uploadDirectory2 = getServletContext().getRealPath("/img/");
	        	// File dir = new File(uploadDirectory);
	        	 File dir2 = new File(uploadDirectory2);
	        	 //if (!dir.exists()) {
	                 //dir.mkdirs();  // ディレクトリが存在しない場合、作成
	            // }
	        	 if (!dir2.exists()) {
	                 dir2.mkdirs();  // ディレクトリが存在しない場合、作成
	             }
	        	 // ファイル保存先のフルパス
	             //String fileSavePath = uploadDirectory + fileName;
	             String fileSavePath2 = uploadDirectory2 + fileName;
	             // ファイルを保存
	             //filePart.write(fileSavePath);  //// 実際にファイルをサーバーに保存
	             imagePart.write(fileSavePath2);
	             System.out.println("File uploaded: " + fileName);
		 }
		
		HttpSession session = request.getSession();
		Product product = new Product();
		product.setProductId(productId);
		product.setName(name);
		product.setArtistName(artist);
		product.setGenre(genre);
		product.setPrice(price);
		product.setStock(stock);
		product.setSampleUrl(sampleUrl);
		
		if (releaseDate != null && !releaseDate.isEmpty()) {
			product.setReleaseDate(Date.valueOf(releaseDate));
		}
		
		product.setImagePath(fileName); // 仮でファイル名だけ保持（本保存は後で）

		session.setAttribute("product", product);
		//session.setAttribute("imagePart", filePart); // 画像ファイルのPartも保持

		request.getRequestDispatcher("admin-EditProductConfirm.jsp").forward(request, response);
	}
}
