//package jp.co.aforce.servlet;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.OutputStream;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class Image
// */
//
//@WebServlet("/views/secure/img/*")
//public class Image extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // URLのパスから画像ファイル名を取得
//        String imagePath = request.getPathInfo().substring(1); // "/uploads/画像名" から画像名だけを取得
//
//        // 画像ファイルの保存先
//        //File file = new File("C:/uploads/" + imagePath); // C:/uploads/に保存された画像を参照
//
//        // webapp/img/ フォルダ内の画像ファイルを参照
//        String uploadDirectory = getServletContext().getRealPath("/img/");
//        File file = new File(uploadDirectory, imagePath);  // 実際のファイルパスを取得
//        
//        
//        // ファイルが存在するかチェック
//        if (file.exists()) {
//            // ファイルの拡張子を取得
//            String fileExtension = getFileExtension(file.getName()).toLowerCase();
//            
//            // MIMEタイプの設定
//            String contentType = "application/octet-stream";  // デフォルト（バイナリ）
//            switch (fileExtension) {
//                case "jpg":
//                case "jpeg":
//                    contentType = "image/jpeg";
//                    break;
//                case "png":
//                    contentType = "image/png";
//                    break;
//                case "gif":
//                    contentType = "image/gif";
//                    break;
//                case "bmp":
//                    contentType = "image/bmp";
//                    break;
//                case "webp":
//                    contentType = "image/webp";
//                    break;
//                default:
//                    response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE); // サポートされていないファイル形式
//                    return;
//            }
//
//            // コンテンツタイプを設定
//            response.setContentType(contentType);
//            response.setContentLength((int) file.length());
//
//            // 画像をレスポンスに書き込む
//            try (FileInputStream fis = new FileInputStream(file);
//                 OutputStream out = response.getOutputStream()) {
//
//                byte[] buffer = new byte[1024];
//                int bytesRead;
//                while ((bytesRead = fis.read(buffer)) != -1) {
//                    out.write(buffer, 0, bytesRead);
//                }
//            }
//        } else {
//            // ファイルが見つからない場合
//            response.sendError(HttpServletResponse.SC_NOT_FOUND);
//        }
//    }
//
//    // ファイル拡張子を取得するヘルパーメソッド
//    private String getFileExtension(String fileName) {
//        int dotIndex = fileName.lastIndexOf(".");
//        if (dotIndex == -1) {
//            return "";  // 拡張子がない場合
//        }
//        return fileName.substring(dotIndex + 1); // 拡張子を返す
//    }
//}
//
