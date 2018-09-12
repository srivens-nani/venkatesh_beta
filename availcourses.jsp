<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("rnum")==null){
	response.sendRedirect("intro.jsp");
}
else{
%>
<!DOCTYPE html>
<html>
<head>
<title>enroll cource</title>
<link rel="stylesheet" type="text/css" href="prostyle.csss">

<style type="text/css">
   .avc{
   	position:absolute;
   	top:150px;
   	width: 100%;
   }

	
	.avc table{
            width: 100%;
            background-color: #efeeec;

	
	}
	.avc h2{
		font-size: 20px;
		font-weight:bold;
		color: #787878;

	}
	.avc table tr{
		width: 100%;
		background-color: #efeeec;

	}
	.avc table tr td{
		width: 250px;
		background-color: #efeeec;
	}

</style>
</head>
<jsp:include page="header-db.jsp"/>
<body>
	<div class="avc">
	<h2>ENROLL COURCE</h2>
	<table cellpadding="5px" cellspacing="10px">
<tr><p id=done></p> </tr>
	<div class="avc">
	<table cellspacing="10px" cellpadding="10px">
		<tr style="color:#0729d7;font-weight: bold;font-size: 20px; "><td>COURSE</td><td>TEST DATE</td><td>DESCRIPTION</td></tr>



<%
     
	try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cn=DriverManager.getConnection("jdbc:odbc:samp");
	Statement smt=cn.createStatement();
	ResultSet rs=smt.executeQuery("select * from courses");
	while(rs.next())
	{
%><form name="enrollfrm" method="post">
<tr>
	<td>
		<input type="text" name="crname"  readonly="" style="border: 0; background-color: #efeeec;color: #000000;font-weight: bold;font-size: 16px;" value="<% out.println(rs.getString(2)); %>">
		<input type="text" name="hiddenid" hidden=""  value="<% out.println(rs.getString(1)); %>">
	</td>
	<td>
		<% out.println(rs.getString(3)); %>
	</td>
	<td style="width: 300px;">
		<% out.println(rs.getString(4)); %>
	</td>
	<td>
		<input type="submit" name="ebtn" value="Enroll" onclick="myfun()" style="color: #0729d7;font-weight: bold;">
		
	</form></td>
</tr>
		
		


<%
}
}
catch(Exception e)
{
	out.println(e);
}
%>





	

</table>
</div>
</body>
</html>

<%

	


if(request.getParameter("ebtn")!= null)
{ 
	String numb=(String)session.getAttribute("rnum");
     String cs=request.getParameter("hiddenid");
     String cr=request.getParameter("crname");
  try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:samp");

 

PreparedStatement ps=conn.prepareStatement("INSERT INTO ENROLLEDCOURSES values(?,?,?) ");
ps.setString(1,numb);
ps.setString(2,cs);
ps.setString(3,cr);

ps.executeUpdate();
out.println("<script type=\"text/javascript\">setTimeout(function(){alert(\"registration sucessful\");},30);</script>");
ps.close();

conn.close();

}

catch(Exception e)
{
	out.println(e);
}
}
}
%>