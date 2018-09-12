<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="prostyle.css">
</head>
<body>
	
	<div class="heading">
	<center><h1><b>ONLINE EXAMINATION PORTAL</b></h1></center>
</div>
<div class="navbar">
	<form>
		<ul>
			<li>
				<a href="home.jsp">Home</a></li>
				<li><a href="enrcourses.jsp">Enrolled cources</a></li>

				<li><a href="availcourses.jsp">Available cources</a></li>
				<li><a href="results.jsp">Results</a></li>
				<li><a href="logout.jsp">Logout</a>

			</li>
			<span style="position:absolute;left:85%;top:+6px;color: #0729d7;font-weight: bold;font-size: 22px;"><% String reginum=(String)session.getAttribute("rnum"); out.println(reginum); %></span>
		</ul>
	</form>
</div>

</body>
</html>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("rnum")==null){
	response.sendRedirect("intro.jsp");
}
else{

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:samp");
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}
}
%>