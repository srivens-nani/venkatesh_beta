
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Administrator</title>
	<style type="text/css">
	.adlogin{
		text-align: center;
		background-color: #ff84847d;
		position:absolute;
		top:5%;
		left:5%;
		height: 90%;
		width: 90%;
	}
	input{
		position: relative;
		height: 30px;
		width:60%;
		border: solid 4px ;
		border-radius: 2px;
		border-color: white;

	}
	input:hover{
		
           cursor: pointer;

	}
	.bck{
		text-align: center;
		background-color: #1be5ad;
		position:absolute;
		top:25%;
		left:35%;
		height: 30%;
		width: 30%;
		border:  solid 4px;
		border-color: #84ffe8c2;
	  
		border-radius: 3px;
	}
</style>
</head>
<body>
	<div style="position:absolute;top:0;left:0;background-color: #7e7e7e26;height: 20%;width: 100%;"></div>
	<div class="bck">
	<div class="adlogin">
	<form name="adfr" method="post">
			<label><B>ADMINISTRATOR LOGIN</B></label>
			</br></br><input type="text" name="admid" value="" placeholder="Admin Id" required="">
			</br></br><input type="password" name="adpass" value="" placeholder="Password">
			</br></br><input type="submit" name="adsubmit" value="login">
		</form>
		</div>
   </div>
   <div style="position:absolute;bottom:0;left:0;background-color: #7e7e7e26;height: 15%;width: 100%;"></div>
</body>
</html>
<%
if(request.getParameter("adsubmit")!=null)
{
	
	String adminpwd=request.getParameter("adpass");
	try{
	String adid=request.getParameter("admid");
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection acon=DriverManager.getConnection("jdbc:odbc:samp");
 Statement ast=acon.createStatement();
 ResultSet str=ast.executeQuery("SELECT ADPWD FROM ADMIN WHERE ADMINID='"+adid+"' ");
 if(str.next()){
   String deci=str.getString(1); 
     if((adminpwd).equals(deci))
     {   
     	response.sendRedirect("admin.jsp");
     	session.setAttribute("ads",adid);
     }
     else{
     out.println("Login failed");
 }
}
}
catch(Exception e){
	out.println(e);
}
}
%>