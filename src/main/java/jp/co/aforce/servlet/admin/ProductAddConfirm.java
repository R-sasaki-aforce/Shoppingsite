package jp.co.aforce.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import jp.co.aforce.beans.Product;

@WebServlet("/views/secure/admin/product-register")
@MultipartConfig
public class ProductAddConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 request.setCharacterEncoding("UTF-8");

	        // フォームから送信された値を取得
	        String name = request.getParameter("name");
	        String artistName = request.getParameter("artist_name");
	        String genre = request.getParameter("genre");
	        
	        // 商品価格と在庫数の初期化
	        int price = 0;
	        int stock = 0;

	        // priceの変換処理
	        String priceStr = request.getParameter("price");
	        if (priceStr != null && !priceStr.trim().isEmpty()) {
	            try {
	                price = Integer.parseInt(priceStr);  // 価格を数値に変換
	            } catch (NumberFormatException e) {
	                // 数値に変換できない場合、エラーハンドリング
	                price = 0;  // デフォルト値
	            }
	        }

	        // stockの変換処理
	        String stockStr = request.getParameter("stock");
	        if (stockStr != null && !stockStr.trim().isEmpty()) {
	            try {
	                stock = Integer.parseInt(stockStr);  // 在庫数を数値に変換
	            } catch (NumberFormatException e) {
	                // 数値に変換できない場合、エラーハンドリング
	                stock = 0;  // デフォルト値
	            }
	        }

	        // その他の商品情報を取得
	        String releaseDateStr = request.getParameter("release_date");
	        Date releaseDate = null;
	        if (releaseDateStr != null && !releaseDateStr.trim().isEmpty()) {
	            try {
	                // SimpleDateFormatで日付文字列をDate型に変換
	                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	                releaseDate = sdf.parse(releaseDateStr);
	            } catch (Exception e) {
	                releaseDate = null;  // 日付変換失敗時はnullに
	            }
	        }
	        
	        String description = request.getParameter("description");
	        String sampleUrl = request.getParameter("sample_url");
//	        Part  = request.getPart("image_path");
	        Part imagePart = request.getPart("image_path");
	        String fileName = null;

	        // ファイル名を取得（空文字列になる場合もある）
	        String submittedFileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

	        if (submittedFileName != null && !submittedFileName.isEmpty()) {
	            // 新しい画像が選ばれている
	            fileName = submittedFileName;
	            // 保存処理（imagePart.getInputStream()など）を行う
	        } else {
	            // 画像が選択されていない場合（ファイル名が空）
	            fileName = request.getParameter("current_image_path");
	        }

	        // ファイル名が取得できた場合、保存処理を行います
	         
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
	        
	        System.out.println("Received data:");
	        System.out.println("Name: " + name);
	        System.out.println("Artist Name: " + artistName);
	        System.out.println(fileName);
	        
		 Product product = new Product();
	        product.setName(name);
	        product.setArtistName(artistName);
	        product.setGenre(genre);
	        product.setPrice(price);
	        product.setStock(stock);
	        product.setReleaseDate(releaseDate);
	        product.setDescription(description);
	        product.setSampleUrl(sampleUrl);
	        product.setImagePath(fileName);
		
	        HttpSession session = request.getSession();
	        session.setAttribute("AddproductConf", product);  // "product"という名前で保存

	        // 確認画面に遷移
	        response.sendRedirect("admin-ProductAddConf.jsp");
		
		
	}

}
