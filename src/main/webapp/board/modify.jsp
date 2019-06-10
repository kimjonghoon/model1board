<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.board.*" %>
<jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" />
<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");
String title = request.getParameter("title");
String content = request.getParameter("content");

Article article = new Article();
article.setArticleNo(no);
article.setTitle(title);
article.setContent(content);

BoardService service= new BoardService(dbmgr);
service.modifyArticle(article);
keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
response.sendRedirect("view.jsp?no=" + no + "&curPage=" + curPage + "&keyword=" +  keyword);
%>