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
				String cname = request.getParameter("cname");
				String address = request.getParameter("address");
				String phno = request.getParameter("phno");
                Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1", "root", "root");
				PreparedStatement ps = con.prepareStatement("insert into customer2 values(?,?,?,?)");
				ps.setString(1, null);
				ps.setString(2, cname);
				ps.setString(3, address);
				ps.setString(4, phno);
				int i = ps.executeUpdate();
				if (i > 0) {
					out.print("ERROR IN INPUT ....!");
					out.print("<center><a href='customer.html'>back</a>");

				} else {
					out.print("ERROR ");
					out.print("<center><a href='customer.html'>back</a>");

				}
			} catch (Exception e) {
				out.print("GET ARTIST DETAILS");
				out.print("<center><a href='view_artist4.jsp'>back</a>");
}
		%>


</center>
</body>
</html>