<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.board.*" %>
<jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" />
<%
request.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String content = request.getParameter("content");

Article article = new Article();
article.setTitle(title);
article.setContent(content);

BoardService service= new BoardService(dbmgr);
service.addArticle(article);

response.sendRedirect("list.jsp");
%>