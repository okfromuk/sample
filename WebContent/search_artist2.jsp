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
	background-image: url("alexander-popov-1075908-unsplash.jpg");
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
		<U><h2>ARTIST DETAILS</h2></U>
	</center>
	<table align="center" cellpadding="5" cellspacing="5" border="5" bgcolor="grey">
		<tr bgcolor="wheat">
			<th>aid</th>
			<th>aname</th>
			<th>exp</th>
			<th>phone</th>
			<th>gender</th>
			<th>works</th>
		</tr>

		<%
		String aid = request.getParameter("aid");
			//String query = "select * from artist where aid=?";
			
			PreparedStatement ps = con.prepareStatement( "select * from artist where aid=? ");
			ps.setString(1, aid);
			if(aid==null)
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
			<th><%=rs.getString(5)%></th>
			<th><%=rs.getString(6)%></th>
		</tr>
		<%
			}
			out.print("<center><a href='search_artist2.html'>back</a>");
			
		%>
</body>
</html>