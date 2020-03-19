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
				String gname = request.getParameter("gname");
				String loc = request.getParameter("loc");
				String aname = request.getParameter("aname");
				String phone = request.getParameter("phone");
                Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
				PreparedStatement ps = con.prepareStatement("insert into gallery values(?,?,?,?,?)");
				ps.setString(1, null);
				ps.setString(2, gname);
				ps.setString(3, loc);
				ps.setString(4, aname);
				ps.setString(5, phone );
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