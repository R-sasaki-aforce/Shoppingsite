<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.beans.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報管理</title>
</head>
<body>
<h1>会員情報管理</h1>
<a href="admin-menu.jsp">管理者メニューに戻る</a>
    <table border="1">
        <thead>
            <tr>
                <th>会員ID</th>
                <th>役割</th>
                <th>名前</th>
                <th>住所</th>
                <th>メールアドレス</th>
                <th>操作ボタン</th>
            </tr>
        </thead>
        <tbody>
            <% 
            session.removeAttribute("editinfo");
                // サーブレットから渡されたユーザーリストを取得
                List<User> users = (List<User>) session.getAttribute("users");
                
                // ユーザーリストの内容を表示
                if (users != null) {
                    for (User user : users) {
            %>
            <tr>
                <td><%= user.getMember_id() %></td>
                <td><%= user.getRole() == 1 ? "管理者" : "一般ユーザ" %></td>
                <td><%= user.getLast_name() + " " + user.getFirst_name() %></td>
                <td><%= user.getAddress() %></td>
                 <td><%= user.getMail_address() %></td>
                
                <td>
                     <!-- 編集ボタン -->
                    <form action="admin-EditUser" method="post" style="display:inline;">
                        <input type="hidden" name="member_id" value="<%= user.getMember_id() %>">
                         <input type="hidden" name="last_name" value="<%= user.getLast_name() %>">
                        <input type="hidden" name="first_name" value="<%=user.getFirst_name() %>">
                        <input type="hidden" name="address" value="<%= user.getAddress() %>">
                        <input type="hidden" name="mail_address" value="<%=user.getMail_address() %>">
                        <input type="hidden" name="role" value="<%= user.getRole() %>">
                        <input type="submit" value="編集">
                    </form>
                    <!-- 削除ボタン -->
                    <form action="admin-user-delete" method="post" style="display:inline;">
                        <input type="hidden" name="member_id" value="<%= user.getMember_id() %>">
                        <input type="submit" value="削除" onclick="return confirm('本当に削除してもよろしいですか？');">
                         </form>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="6">ユーザー情報がありません。</td>
            </tr>
            <% } %>
        </tbody>
    </table>
    
    <br>



</body>
</html>