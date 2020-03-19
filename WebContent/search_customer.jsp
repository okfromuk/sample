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
body {
	background-image: url("zoltan-tasi-1146631-unsplash.jpg");
	background-image: no repeat;
	background-size: cover;
	style ="width: 500px";
}

html {
	height: 100%;
}
</style>
<body>
<body background="alexander-popov-1075908-unsplash.jpg">
	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
	%>

	<center>
		<U><h2>CUSTOMER DETAILS</h2></U>
	</center>
	<table align="center" cellpadding="5" cellspacing="5" border="5" bgcolor="grey">
		<tr bgcolor="wheat">
			<th>cid</th>
			<th>cname</th>
			<th>address</th>
			<th>phno</th>
		
		</tr>

		<%
		String cid = request.getParameter("cid");
			//String query = "select * from customer where cid=?";
			
			PreparedStatement ps = con.prepareStatement( "select * from customer2 where cid=? ");
			ps.setString(1, cid);
			if(cid==null)
			{
				out.println("invalid input");
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
		%>
		<tr bgcolor="white">
			<th><%=rs.getString(1)%></th>
			<th><%=rs.getString(2)%></th>
			<th><%=rs.getString(3)%></th>
			<th><%=rs.getString(4)%></th>
	
		</tr>
		<%
			}
			out.print("<center><a href='search_customer.html'>back</a>");
		%>
	
</body>
</html>