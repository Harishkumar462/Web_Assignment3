<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOOKS LIST</title>
<style type="text/css">
table,td,tr{
border:1px solid black;
height:15%;
weidth:200px;
}
</style>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>	
<%
String m=request.getParameter("name");
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Movie.db");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from book");
%>
<table>
<%
while(rs.next()){
%>
<tr>
<td>
<p><%out.print(rs.getInt(1)); %></p>
</td>
<td>
<%String link="details.jsp?id="+Integer.toString(rs.getInt(1)); %>
<a href="<%out.print(link); %>">
<strong><%out.print(rs.getString(2)); %></strong>
</a>
</td>
</tr>
<%} %>
</table>
</body>
</html>
