<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
{
background-color
:orange
;


}
table tr:hover {
	background-color: yellow;
}
</style>
<body>
<body background="C:\Users\SANDEEP S\Desktop\edit.jpg" px="1080">
	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
	%>



		<%
		String gid = request.getParameter("gid");
	
			
		try
		{
		String query="delete from exhibition where gid=?";
		
		PreparedStatement ps=con.prepareStatement(query);
		
		ps.setString(1,gid); 
		
	
		
	
        int i=ps.executeUpdate();
		
		if(i>0)
		{
			out.println("<h1>"+"Successfully Deleted"+"</h1>");
		}
		else
		{
			out.println("<h1>"+"Please try again "+"</h1>");
		}
			
		}
		catch(Exception e)
		{
			out.println("ERROR"+e);
		}
		out.print("<center><a href='remove_exhibition.html'>BACK</a>");
			
			%>
	
</body>
</html>