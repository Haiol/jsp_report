<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">학생 조회/수정 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr><td>학 번 </td><td>이름 </td>
    <td>학과 </td><td>휴대폰 </td>
    <td>지역코드 </td><td>주소</td>
       </tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String grade="";
try {
	conn = Util.getConnection();
	st = conn.createStatement();
	String sql="select * from students order by stno";
	System.out.println(sql);
	ResultSet rs= st.executeQuery(sql);
	
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
<td><a href="modify.jsp?mod_stno=<%=rs.getString("stno") %>"><%=rs.getString("stno") %></a></td>
<td><%=rs.getString("stname") %>  </td>
<td><%=rs.getString("dept") %>  </td>
<td><%=rs.getString("hp") %>  </td>
<td><%=grade %>  </td>
<td><%=rs.getString("address") %>  </td>
</tr>
<% 
   } 
}
catch (Exception e){
	e.printStackTrace();
}
%>
</table>
</form>

</section>



<jsp:include page="footer.jsp"/>
</body>
</html>