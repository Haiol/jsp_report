<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회 페이지</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">편의점 매출조회 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr>
<td>학 번</td><td>이 름 </td>
<td>지역코드</td><td>매출 </td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String grade="";
try {
	conn= Util.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select me.stno, me.stname, me.local,sum(mo.price) price "+
	    "from students me,sales mo "+
	   "where me.stno=mo.stno " +
   "group by me.stno,me.stname,me.local "+ 
   "order by sum(mo.price) desc";
	System.out.println(sql);
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴
	
	while (rs.next()){
		grade = rs.getString("local");
		switch(grade){
		case "SN":
			grade="서울북부";
	     break;
		case "KS":
			grade="경기남부";
	     break;  
		case "SS":
			grade="서울남부";
			break;
		case "KN":
			grade="경기북부";
			break;
	}
		
%>
<tr>
<td><%=rs.getString("stno") %> </td>
<td><%=rs.getString("stname") %> </td>
<td><%=grade %> </td>
<td><%=rs.getString("price") %> </td>
 </tr>
 <%
 }
	
	}
	catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>