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
<body>
	<center>
		<%
			try {
				String aname = request.getParameter("aname");
				String exp = request.getParameter("exp");
				String phone = request.getParameter("phone");
				
				String gender = request.getParameter("gender");
				String works = request.getParameter("works");
				
                Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
				PreparedStatement ps = con.prepareStatement("insert into artist2 values(?,?,?,?,?,?)");
				ps.setString(1, null);
				ps.setString(2, aname);
				ps.setString(3, exp);
				ps.setString(4, phone);
				ps.setString(5, gender);
				ps.setString(6, works);
				
			

				int i = ps.executeUpdate();
				if (i > 0) {
					out.print("You are successfully registered...");
					out.print("<center><a href='insertinto2.html'>back</a>");

				} else {
					out.print("You are NOT successfully registered...");
					out.print("<center><a href='insertinto2.html'>back</a>");

				}
			} catch (Exception e) {
				out.print("ERROR IN INPUT VALUES....!");
				out.print("<center><a href='insertinto2.html'>back</a>");
}
		%>
	</center>
</body>
</html>