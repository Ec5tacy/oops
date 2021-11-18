<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login portal</title>
</head>
<body>
	<%
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	request.getSession().setAttribute( "EMAIL_VIA_LOGIN" , email);
	try{
		//Class.forName("com.mysql.jdbc.Driver");
		final String usern = "root";
		final String pasw = "Ansh2514@";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
		Statement st=conn.createStatement();
		ResultSet  i =st.executeQuery("SELECT * from user2 WHERE email = " + "'" +  email + "'" + " and " + "password = " + "'" + pass + "'"  );
		
		if(i.next()){
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
					+ "        content=\"5; url = log.html\" /><body><b>Logged In"
						+ "</b></body></html>");
			
		}
		else{
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
					+ "        content=\"5; url = log.html\" /><body><b>Wrong Credential"
						+ "</b></body></html>");	
		}
		
	}
	catch(Exception e){
			out.println(e);
	}

	%>
</body>
</html>