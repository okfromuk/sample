<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ARTIST_UPDATE</title>
</head>
<body>
 <%

try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1","root","root");

   String pid=request.getParameter("pid");
   String type=request.getParameter("type");

    String price=request.getParameter("price");
    String date=request.getParameter("date");
    String title=request.getParameter("title");
   
   PreparedStatement st=con.prepareStatement("update painting set type=?,price=?,date=?,title=? where pid=?");
   st.setString(1,type);
   st.setString(2,price);
   st.setString(3,date);
   st.setString(4,title);
   st.setString(5,pid);
   
   int i=st.executeUpdate();
	if(i>0){
	out.println("updated succefully");
	out.print("<center><a href='updateinto.html'>back</a>");
	
 }
	else{
		out.println("not updated succefully");
		out.print("<center><a href='updateinto.html'>back</a>");
		
	}
 }	
 
catch(Exception e)
 {
out.println(e);
	
 }
%>
 </body>