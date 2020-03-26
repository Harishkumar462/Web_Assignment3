<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>movie</title>
</head>
<body>
<input type="button" value="Back" onclick="location.href='home.html'">
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>	
<%
String m=request.getParameter("name");
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Movie.db");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from movie where name='"+m+"'");
while(rs.next()){
%>
 <table>
 	<tr>
 		<td> movie name:</td>
 		<td><%out.println(rs.getString(1)); %></td>
 	</tr>
 	<tr>
 		<td> Director name:</td>
 		<td><%out.println(rs.getString(2)); %></td>
 	</tr>
 	<tr>
 		<td> Release Date:</td>
 		<td><%out.println(rs.getString(3)); %></td>
 	</tr>
 	<tr>
 		<td> Record:</td>
 		<td><%out.println(rs.getString(4)); %></td>
 	</tr>
 </table>
 <% } %>
</body>
</html>
