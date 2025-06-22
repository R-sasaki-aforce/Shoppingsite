<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.User" %>
<%@ page import="jp.co.aforce.beans.UserBean" %>
<%
    // セッションからUserまたはUserBeanオブジェクトを取得
    User user = (User) session.getAttribute("userinfo");
    UserBean user2 = (UserBean) session.getAttribute("editinfo");

    // どちらのオブジェクトもnullでないかを確認
    if (user2 != null) {
        // userが存在する場合
        String memberId = user.getMember_id();
        String lastName = user2.getLast_name2();
        String firstName = user2.getFirst_name2();
        String address = user2.getAddress2();
        String mailAddress = user2.getMail_address2();
        int role = user.getRole();
%>
<h1>会員情報編集画面</h1>
        <!-- ユーザー情報が正常に取得できた場合 -->
        会員ID: <%= memberId %><br>
        役割: <%= (role == 1 ? "管理者" : "一般ユーザ") %><br>

        <form action="usereditconfirm" method="post">
            <input type="hidden" name="member_id" value="<%= memberId %>">
            <input type="hidden" name="role" value="<%= role %>">
            <br>名前（姓）: <input type="text" id="lastname" name="last_name" value="<%= lastName %>" required><br><br>
            <br>名前（名）: <input type="text" id="firstname" name="first_name" value="<%= firstName %>" required><br><br>
            <br>住所: <input type="text" id="address" name="address" value="<%= address %>" required><br><br>
            <br>メールアドレス: <input type="email" id="email" name="mail_address" value="<%= mailAddress %>" required><br><br>

            <input type="submit" value="確認">
        </form>
<%
    } else if (user != null) {
        // user2が存在する場合
        String memberId = user.getMember_id();
        String lastName = user.getLast_name();
        String firstName = user.getFirst_name();
        String address = user.getAddress();
        String mailAddress = user.getMail_address();
        int role = user.getRole(); // UserBeanでroleを取得する場合

%>
<h1>会員情報編集画面</h1>
        <!-- UserBeanオブジェクトから取得した情報 -->
        会員ID: <%= memberId %><br>
        役割: <%= (role == 1 ? "管理者" : "一般ユーザ") %><br>

        <form action="usereditconfirm" method="post">
            <input type="hidden" name="member_id" value="<%= memberId %>">
            <input type="hidden" name="role" value="<%= role %>">
            <br>名前（姓）: <input type="text" id="lastname" name="last_name" value="<%= lastName %>" required><br><br>
            <br>名前（名）: <input type="text" id="firstname" name="first_name" value="<%= firstName %>" required><br><br>
            <br>住所: <input type="text" id="address" name="address" value="<%= address %>" required><br><br>
            <br>メールアドレス: <input type="email" id="email" name="mail_address" value="<%= mailAddress %>" required><br><br>

            <input type="submit" value="確認">
        </form>
<%
    } else {
        out.println("<p>ユーザー情報が見つかりません。</p>");
    }
%>

<a href="admin-usersList.jsp">会員情報管理に戻る</a>

</body>
</html>
