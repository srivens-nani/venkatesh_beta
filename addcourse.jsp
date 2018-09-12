<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% if(session.getAttribute("ads")== null)
{
	out.println("Your Session time out..!");
}
else{
%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
		<style type="text/css">
		.aa table{
			left: 30%;
			position: absolute;top: 100px;
			left:10%;
		}
		#dt{
			width:30px;
		}
		</style>
	
</head>
<body>
	
	<div class="aa">
	<form name="adc" method="post">
		<table>
			<tr><h1 style="color: #a4a6a7;">Add Course:</h1></tr>
			<tr>
				<td><label>Course Id</label></td>
				<td><input type="text" name="crid" value="">
				</td>
			</tr>
			<tr>
				<td><label>Course name</label></td>
				<td><input type="text" name="crname" value="">
				</td>
			</tr>
			<tr>
				<td><label>Course Description</label></td>
				<td><input type="text" name="cdes"></td>
			</tr>
			<tr>
				<td><label>Exam Date</label></td>
				<td><input type="text" name="cdate" id="dt" placeholder="dd"  maxlength="2" pattern="[0-3]{1}[0-9]{1}" title="enter valid date">-<input type="text" name="cmonth" id="dt" placeholder="mm" maxlength="2"  pattern="[0,1]{1}[0-9]{1}">-<input type="text" name="cyear" id="dt" placeholder="yyyy" maxlength="4" pattern="[2]{1}[0]{1}[0-9]{1}[0-9]{1}"></td>
			</tr>
			<tr>
				<td></td><td><input type="submit" name="sub" value="submit" onsubmit="myfun(this)"></td>
			</tr>
		</table>
	</center>
	</div>

</body>
</html>
<%


if(request.getParameter("sub") != null)
{
	String crsi=request.getParameter("crid");

int crsid=Integer.parseInt(crsi);
String crsename=request.getParameter("crname");
String cdesc=request.getParameter("cdes");
String date=request.getParameter("cdate");
String month=request.getParameter("cmonth");
String year=request.getParameter("cyear");
String dt=date+"-"+month+"-"+year;



	try{
	   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	   Connection con=DriverManager.getConnection("jdbc:odbc:samp");
	  // Statement stm=con.createStatement();
	   PreparedStatement pps=con.prepareStatement("insert into COURSES values(?,?,?,?,?)");
       pps.setInt(1,crsid);
       pps.setString(2,crsename);
       
       pps.setString(3,dt);
       pps.setString(4,cdesc);
       pps.setInt(5,0);

	   pps.executeUpdate();
	   out.println("<center style=\"color:green; font-size:28px;font-weight:bold;\">Course Added Sucessfully!<center>");
pps.close();
con.close();	   
}
catch(Exception e)
{
	out.println(e);
}

} 

}
%>