package jp.co.aforce.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.tool.Page;
//ログイン画面userテーブル接続確認用
/**
 * Servlet implementation class All
 */
@WebServlet("/All")
public class All extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		Page.header(out);
		try {
//			JNDIを使うため
			InitialContext ic=new InitialContext();
//			bookのデータベースと接続
			DataSource ds=(DataSource)ic.lookup("java:/comp/env/jdbc/shoppingsite_sasaki");
//			データベースの接続を取得
			Connection con=ds.getConnection();		
			
//			SQL文
			PreparedStatement st=con.prepareStatement("select * from users");
			
//			SQLの結果
			ResultSet rs=st.executeQuery(); 
			
			
			while(rs.next()) {
				out.println();
				out.println(rs.getString("MEMBER_ID"));
				out.println(":");
				out.println(rs.getString("PASSWORD"));
				
				
				out.println("<br>");
			}
			
			st.close();
			con.close();
			
			
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
