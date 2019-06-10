<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.java_school.util.*"%>
<%@ page import="net.java_school.commons.*"%>
<%@ page import="net.java_school.board.*"%>
<%@ page import="net.java_school.db.dbpool.*"%>
<jsp:useBean id="dbmgr" scope="application"	class="net.java_school.db.dbpool.OracleConnectionManager" />
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

BoardService service = new BoardService(dbmgr);
Article article = service.getArticle(no);
String content = article.getContent();
content = content.replaceAll(WebContants.lineSeparator.value, WebContants.lineSeparator.value + ">");
content = WebContants.lineSeparator.value + WebContants.lineSeparator.value + ">" + content;
%>
<html>
<head>
<meta charset="UTF-8" />
<title>Reply</title>
<script>
function goView(no, curPage, keyword) {
	 location.href="view.jsp?no=" + no + "&curPage=" + curPage + "&keyword=" + keyword;
}
</script>
</head>
<body>
<h1>Reply</h1>
<form action="reply.jsp" method="post">
<input type="hidden" name="no" value="<%=no%>" /> 
<input type="hidden" name="curPage" value="<%=curPage%>" />
<input type="hidden" name="keyword" value="<%=keyword%>" />
<div>Title: <input type="text" name="title" size="45" value="<%=article.getTitle() %>" /></div>
<div><textarea name="content" rows="10" cols="60"><%=content %></textarea></div>
<div>
<input type="submit" value="Submit" />
<input type="reset" value="Reset" />
<input type="button" value="Back to View Details" onclick="javascript:goView('<%=no%>','<%=curPage%>','<%=keyword%>')" />
</div>
</form>
</body>
</html>