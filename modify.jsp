<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">학생 정보 수정 </h2> <br>
<form method="post" action="action.jsp" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="modify">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String mod_custno=request.getParameter("mod_stno");
String custname="";
String phone="";
String address="";
Date joindate;
String grade="";
String hp="";
String joindateStr="";
try {
	conn= Util.getConnection();//DB 연결
	st = conn.createStatement();
	String sql="select * from students where stno= "
			+ mod_custno;
	ResultSet rs= st.executeQuery(sql);
	rs.next();
	mod_custno=rs.getString("stno");
	custname=rs.getString("stname");
	phone=rs.getString("dept");
	hp = rs.getString("hp");
	grade=rs.getString("local");
	address=rs.getString("address");
}
catch (Exception e){
	e.printStackTrace();
}
%>	
<tr><td>학 번</td>
<td><input type="text" name="stno" value="<%=mod_custno %>" ></td></tr>
<tr><td>이 름</td>
<td><input type="text" name="stname" value="<%=custname %>"></td></tr>
<tr><td>학 과</td>
<td><input type="text" name="dept" value="<%=phone %>"></td></tr>
<tr><td>휴대폰</td>
<td><input type="text" name="hp" value="<%=hp %>"></td></tr>
<tr><td>고객등급(A:VIP,B:일반,C:직원)</td>
<td><input type="text" name="local" value="<%=grade %>"></td></tr>
<tr><td>주 소</td>
<td><input type="text" name="address" value="<%=address %>"></td></tr>
<tr><td colspan=2>
<input type="submit" value="수정" onclick="return modify()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>


<jsp:include page="footer.jsp"/>
</body>
</html>