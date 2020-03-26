<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String salary=request.getParameter("salary");
double da=0.03,hra=12.5,pf=0.10,gp,np;
da=da*Integer.parseInt(salary);
hra=hra*Integer.parseInt(salary);
pf=pf*Integer.parseInt(salary);
gp=Integer.parseInt(salary)+da+hra;
np=gp-pf;
Class.forName("org.sqlite.JDBC");
Connection con=DriverManager.getConnection("JDBC:sqlite:C:\\Users\\Admin\\Desktop\\Movie.db");
PreparedStatement st=con.prepareStatement("insert into employee(id,name,salary,gross_sal,net_sal) values(?,?,?,?,?)");
st.setInt(1,Integer.parseInt(id));
st.setString(2,name);
st.setString(3,salary);
st.setString(4,Double.toString(gp));
st.setString(5,Double.toString(np));
try{
	int i=st.executeUpdate();
	out.print("Records Inserted Successfully");
}
catch(Exception e){
	out.print(e);
}
con.close();	
%>
</body>
</html>