<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.java_school.board.*"%>
<%@ page import="net.java_school.util.*"%>
<%@ page import="net.java_school.db.dbpool.*"%>
<jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" />
<%
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";

BoardService service = new BoardService(dbmgr);
Article article = service.getArticle(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Detailed</title>
<script type="text/javascript">
function goList(curPage, keyword) {
	location.href="list.jsp?curPage=" + curPage + "&keyword=" + keyword;
}
function goReply(no, curPage, keyword) {
	location.href="reply_form.jsp?no=" + no + "&curPage=" + curPage + "&keyword=" + keyword;
}
function goModify(no, curPage, keyword) {
	location.href="modify_form.jsp?no=" + no + "&curPage=" + curPage + "&keyword=" + keyword;
}
function goDelete(no, curPage, keyword) {
	var check = confirm('Are you sure you want to delete this item?');
	if (check) {
		location.href="del.jsp?no=" + no + "&curPage=" + curPage + "&keyword=" + keyword;
	}
}
</script>
</head>
<body>
<h1>View Details</h1>
<h2>Title: <%=article.getTitle() %>, Creation: <%=article.getRegdate() %></h2>
<p>
<%=article.getHtmlContent() %>
</p>
<div>
	<input type="button" value="List" onclick="javascript:goList('<%=curPage%>','<%=keyword%>')" />
	<input type="button" value="Reply" onclick="javascript:goReply('<%=no%>','<%=curPage%>','<%=keyword%>')" />
	<input type="button" value="Modify" onclick="javascript:goModify('<%=no%>','<%=curPage%>','<%=keyword%>')" />
	<input type="button" value="Delete" onclick="javascript:goDelete('<%=no%>','<%=curPage%>','<%=keyword%>')" />
</div>
</body>
</html>