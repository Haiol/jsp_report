<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">학생 등록 </h2> <br>
<form method="post" action="action.jsp" name="frm" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="insert">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String custno="";
try {
	conn= Util.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select max(stno)+1 stno from students";
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴 
	rs.next(); //1개의 결과물 출력 
	custno = rs.getString("stno");
	}
catch(Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript" src="check.js"></script>
<tr><td>학번(자동발생)</td>
<td><input type="text" name="stno" value="<%=custno %>" 
readonly></td></tr>
<tr><td>이 &nbsp;름</td>
<td><input type="text" name="stname"></td></tr>
<tr><td>학&nbsp;과</td>
<td><input type="text" name="dept"></td></tr>
<tr><td>휴대폰</td>
<td><input type="text" name="hp"></td></tr>
<tr><td>지역코드(SN:서울북부,SS:서울남부,KN:경기북부,KS:경기남부)</td>
<td><input type="text" name="local"></td></tr>
<tr><td>주소</td>
<td><input type="text" name="address"></td></tr>
<tr><td colspan=2>
<input type="submit" value="등록" onclick="return joinCheck()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>