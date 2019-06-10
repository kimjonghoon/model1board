<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.board.*" %>
<%@ page import="net.java_school.commons.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" />
<%
request.setCharacterEncoding("UTF-8");
int curPage = (request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage")));
String keyword = request.getParameter("keyword");
if (keyword == null) keyword = "";

BoardService service = new BoardService(dbmgr);
int totalRecord = service.getTotalRecord(keyword);

int numPerPage = 10;
int pagePerBlock = 5;
Map<String, Integer> numbers = service.getNumbersForPaging(totalRecord, curPage, numPerPage, pagePerBlock);

int startRecord = (curPage - 1) * numPerPage;
int endRecord = curPage * numPerPage;
List<Article> list = service.getBoardList(keyword, startRecord, endRecord);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>List</title>
</head>
<body style="font-size: 11px;">
<h1>List</h1>
<%
int listItemNo = numbers.get("listItemNo");
for (int i = 0; i < list.size(); i++) {
    Article article = list.get(i);
    int indent = article.getIndent();
    for (int j = 0; j < indent; j++) {
        out.println("&nbsp;&nbsp;");
    }
    if(indent != 1) {
        out.println("┗");
    }
%>
<%=listItemNo %>
<a href="view.jsp?no=<%=article.getArticleNo() %>&curPage=<%=curPage %>&keyword=<%=keyword %>"><%=article.getTitle() %></a>
<%=article.getRegdate() %><br />
<hr />
<%
listItemNo--;
}
int prevPage = numbers.get("prevPage");
if (prevPage != 0) {
%>
    <a href="list.jsp?curPage=<%=prevPage %>&keyword=<%=keyword %>">[Prev]</a>
<%
}
int firstPage = numbers.get("firstPage");
int lastPage = numbers.get("lastPage");
for (int i = firstPage; i <= lastPage; i++) {
%>
    <a href="list.jsp?curPage=<%=i %>&keyword=<%=keyword %>">[<%=i %>]</a>
<%
}
int nextPage = numbers.get("nextPage");
if (nextPage != 0) {
%>
    <a href="list.jsp?curPage=<%=nextPage %>&keyword=<%=keyword %>">[Next]</a>
<%
}
%>                
<p>
<a href="write_form.jsp?curPage=<%=curPage %>&keyword=<%=keyword %>">New</a>
</p>
<form method="get">
    <input type="text" size="10" maxlength="30" name="keyword" />
    <input type="submit" value="Search" />
</form>    
</body>
</html>