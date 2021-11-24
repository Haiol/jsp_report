<%@page import="java.sql.*"%>

<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터추가,수정</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn=null;
Statement st=null;
String mode= request.getParameter("mode");
String custno= request.getParameter("stno");
String custname= request.getParameter("stname");
String phone= request.getParameter("dept");
String grade= request.getParameter("hp");
String city= request.getParameter("local");
String address= request.getParameter("address");
//request.getParameter는 외부파일로 부터 데이터를 불러오는 것
try {
	conn= Util.getConnection();//DB 연결
	st = conn.createStatement();
	String sql="";
	switch (mode){
	case "insert":
	 sql="insert into students values ("+ custno +"," + 
	         "'"+ custname +"',"+
	         "'"+ phone + "',"+
	         "'" +grade+"',"+
	         "'"+ city + "',"+
	         "'"+ address +"')";
		st.executeUpdate(sql);
	%>
	<jsp:forward page="join.jsp"></jsp:forward>
	<%	
	break;
	case "modify":
	
		sql="update students set "+
		"stname = '"+ custname +"',"+ 
		"dept = '"+ phone +"',"+
		"hp = '"+ grade +"',"+
		"local = '"+ city +"',"+
		"address = '"+ address +"'"+
		"where stno =" + custno;
		st.executeUpdate(sql);
		%>
		<jsp:forward page="modify.jsp"></jsp:forward>
		<%		
		break;
		
	}
}
catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>