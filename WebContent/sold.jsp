<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
			try {
				String cid = request.getParameter("cid");
				String pid = request.getParameter("pid");
				String price = request.getParameter("price");
				String date = request.getParameter("date");
			
                Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
				PreparedStatement ps = con.prepareStatement("insert into sold values(?,?,?,?)");
				ps.setString(1, cid);
				ps.setString(2, pid);
				ps.setString(3, price);
				ps.setString(4, date);
			
				int i = ps.executeUpdate();
				if (i > 0) {
					out.print("You are successfully registered...");

				} else {
					out.print("You are NOT successfully registered...");
				}
			} catch (Exception e) {
				out.print("ERROR IN INPUT VALUES....!");
			}
		%>


</center>
</body>
</html>