<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOOK DETAILS</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>	
<%
String m=request.getParameter("id");
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Movie.db");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from book where id='"+m+"'");
while(rs.next()){
%>
<table>
 	<tr>
 		<td> BOOKID:</td>
 		<td><%out.println(rs.getInt(1)); %></td>
 	</tr>
 	<tr>
 		<td> BOOK NAME:</td>
 		<td><%out.println(rs.getString(2)); %></td>
 	</tr>
 	<tr>
 		<td> AUTHOR NAME:</td>
 		<td><%out.println(rs.getString(3)); %></td>
 	</tr>
 	<tr>
 		<td> EDITION:</td>
 		<td><%out.println(rs.getString(4)); %></td>
 	</tr>
 	<tr>
 		<td> COST:</td>
 		<td><%out.println(rs.getInt(5)); %></td>
 	</tr>
 	<tr>
 	<td colspan=2><input type="button" onclick="location.href='confirm.html'" value="confirm">
 </table>
 <% } %>
</body>
</html>
