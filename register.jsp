<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.util.*"%>
<%@ page import="java.io.*" %> 
<%
String email=request.getParameter("email");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String username=request.getParameter("uname");
String pno=request.getParameter("number");
String carno=request.getParameter("register");
String address=request.getParameter("address");
String password=request.getParameter("password");
String cpass = password;
request.getSession().setAttribute( "EMAIL_VIA_REGISTER" , email);
try
{
final String usern = "root";
final String pasw = "Ansh2514@";
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
Statement st=conn.createStatement();
ResultSet  i =st.executeQuery("SELECT * from user2 WHERE email= " + "'" +  email + "'"  );
if(i.next()){
out.println("<html><meta http-equiv=\"refresh\" \r\n"
		+ "        content=\"50; url = log.html\" /><body><b>Please Login "
			+ "</b></body></html>"); 
}
else{
	Statement st1=conn.createStatement();
	//int	  i1 =st.executeUpdate( "INSERT INTO user2(fname,lname,username,password,confirmpassword,address,email,pnusero,carno) values(" + "'" + fname + "'," + "'" +lname+ "'," + "'" +username +"'," +"'"+password+ "'," +"'"+cpass+"','+ "+ "'" +address +"'," +"'" + email +"'," +"'" +pno + "'," + "'" +carno +"'," +  ");");
	int	  i1 =st.executeUpdate( "INSERT INTO `users`.`user2` (`fname`, `lname`, `username`, `password`, `confirmpassword`, `address`, `email`, `pno`, `carno`) VALUES ('"+ fname +"', '"+ lname +"', '"+username+"', '"+password+"', '"+cpass+"', '"+address+"', '"+email+"', '"+pno+"', '"+carno+"');");
	System.out.println(i1);
	out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"5; url = log.html\" /><body><b>Successfully Inserted"
				+ "</b></body></html>"); 
	
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>