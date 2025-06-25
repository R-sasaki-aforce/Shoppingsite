<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.aforce.beans.Contact" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お問い合わせ一覧</title>
</head>
<body>
<h1>お問い合わせ一覧</h1>
<a href="admin-menu.jsp">管理者メニューに戻る</a>
<%
List<Contact> contacts = (List<Contact>) request.getAttribute("contactList");
if (contacts != null && !contacts.isEmpty()) {
%>
<table border="1">
	<tr>
		<th>ID</th>
		<th>会員ID</th>
		<th>名前</th>
		<th>メール</th>
		<th>件名</th>
		<th>内容</th>
		<th>送信日時</th>
	</tr>
	<%
	for (Contact c : contacts) {
	%>
	<tr>
		<td><%=c.getContactId()%></td>
		<td><%=c.getMemberId()%></td>
		<td><%=c.getName()%></td>
		<td><%=c.getEmail()%></td>
		<td><%=c.getSubject()%></td>
		<td><%=c.getMessage()%></td>
		<td><%=c.getSubmittedAt()%></td>
	</tr>
	<%
	}
	%>
</table>
<%
} else {
%>
<p>現在、お問い合わせはありません。</p>
<%
}
%>


</body>
</html>
