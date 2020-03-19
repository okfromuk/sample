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
<body background="pawel-czerwinski-1176681-unsplash.jpg">
	<%
		String aid = request.getParameter("a");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
	%>

	<center>
		<U><h2>ARTIST DETAILS</h2></U>
	</center>
	<table align="center" cellpadding="5" cellspacing="5" border="5"
		bgcolor="grey">
		<tr bgcolor="wheat">
		     <th>aid</th>
			<th>aname</th>
			<th>exp</th>
			<th>phone</th>
			<th>gender</th>
			<th>works</th>
		</tr>
		

		<%
		CallableStatement ps = con.prepareCall("CALL display_artist2();");
		ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr bgcolor="white">
			
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
			
		</tr>
		
		<%
			}
			out.print("<center><a href='viewinto2.html'>back</a>");
			
			

		%>
		
</body>

</html>
