import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class customer_login extends GenericServlet
{
	Connection con;
	public void init()throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gallery1","root","root");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	
	
	
	public void service(ServletRequest request,ServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		
		PrintWriter pw=response.getWriter();
		
		String us=request.getParameter("customer_username");
		String pd=request.getParameter("password");
		String em=request.getParameter("email");
		
		
	
		try
		{
		String query="select customer_username,password,email from customer_login where customer_username=? and password=? and email=?";
		
		PreparedStatement ps=con.prepareStatement(query);
		
		ps.setString(1,us);

		ps.setString(2,pd);
		
		ps.setString(3,em);
		
	
        ResultSet rs=	ps.executeQuery();	
		if(rs.next())
		{
             RequestDispatcher rd=request.getRequestDispatcher("selection3.html");
             rd.forward(request, response);
		}
		else
		{
		      RequestDispatcher rd=request.getRequestDispatcher("customer_login.html");
	             rd.forward(request, response);		}
			
		}
		catch(Exception e)
		{
			pw.println("ERROR"+e);
		}
		pw.print("<center><a href='selection.html'>BACK</a>");
	}
}
