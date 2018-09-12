<!DOCTYPE html>
<html>
<head>
	<title>student login</title>
</head>
<style type="text/css">
	.loginbox{
		
		position: fixed;
		text-align: center;
		top:50%;
		left: 45%;
	}
	.loginbox form input[type="text"],input[type="password"]
	{
		height: 40px;
		width: 250px;
	   
		border-radius: 15px;
	}
</style>
<body>
	<div class="loginbox">
		<form name="fr" method="post">
			<label><B>STUDENT LOGIN</B></label>
			</br><input type="text" name="regnum" value="" placeholder="Registration num" required="">
			</br><input type="password" name="pass" value="" placeholder="password">
			</br><input type="submit" name="submit" value="login">
		</form>
		
	</div>

</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
String str=request.getParameter("regnum");
//String SNAME=request.getParameter("password ");

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:samp");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("SELECT  PASSWORD FROM login where username='"+str+"';");
while(rs.next()){

out.println(rs.getString(1));


}
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}
%>