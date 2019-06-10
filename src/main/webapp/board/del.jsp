<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.java_school.board.*" %>
<jsp:useBean id="dbmgr" scope="application" class="net.java_school.db.dbpool.OracleConnectionManager" />
<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));
String curPage = request.getParameter("curPage");
String keyword = request.getParameter("keyword");

BoardService service= new BoardService(dbmgr);
service.deleteArticle(no);
keyword = java.net.URLEncoder.encode(keyword,"UTF-8");
response.sendRedirect("list.jsp?curPage=" + curPage + "&keyword=" +  keyword);
%>