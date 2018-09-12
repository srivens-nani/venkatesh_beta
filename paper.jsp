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
	<title></title>
	<style type="text/css">
		input{
			border:0;
		}
		.qtop{
			position: fixed;
			top:0;
			left: 0;
           background-color: #dcdcdcd6;
			height: 10%;
			width: 100%;
			color: #0078d7;
			font-size: 42px;
			text-align: center;
			font-style: normal;
			
		}
		.qdown{
			position: absolute;
			top:10%;
			left: 3%;
			width: 100%;
		}
		a{
			position: absolute;
			height: 25px;
			width: 60px;

			text-decoration: none;
			background-color: #0078d7;
			color: white;
			border: 4px;
			border-radius: 2px;
			border-color: #9b9b9b;
			box-shadow: 0px 0px 5px 5px;

		}
		a:hover{
			background-color: white;
			color:#0078d7;
		}
	</style>
</head>
<body>
	<div class="qtop">
		<b>Online Examination Portal</b>
	</div>
<div class="qdown">	
<%
String exname=request.getParameter("courname");
String edate=request.getParameter("tesdate");
out.println(exname);
out.println("\n<b>  Testdate:</b>"+edate+"\n");
java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd-MM-yyyy");
String dates=sdf.format(date);
out.println("Today's date:"+dates);
if((edate).equals(dates))
{
	try{
	int z=0;
	String x="question";
	String y="ans";
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:samp");
	Statement sc=conn.createStatement();
	ResultSet res=sc.executeQuery("SELECT QUESTION,OPA,OPB,OPC,OPD FROM questions WHERE CNAME='"+exname+"' ORDER BY QID");
	while(res.next())
	{
		z++;
%>    
     <p>
     	<form name="anspaper" method="post" action="final.jsp">
     		<input type="text" name="course" hidden="" value="<% out.println(exname); %>"></br>
     	<%out.print(z+"."); %><input type="text" name="<% out.println(x+z);  %>" value="<%out.println(res.getString(1));%>" style="width: 300px;"></br></br>
     	<input type="radio" name="<% out.print(y+z);%>" value="A"><input type="text" name="opaval" readonly="" value="<%out.println(res.getString(2));%>"><input type="radio" name="<% out.print(y+z); %>" value="B"><input type="text" name="opbval" readonly="" value="<%out.println(res.getString(3));%>"><input type="radio" name="<% out.print(y+z); %>" value="C"><input type="text" name="opcval" readonly="" value="<%out.println(res.getString(4));%>"><input type="radio" name="<% out.print(y+z); %>" value="D"><input type="text" name="opdval" readonly="" value="<%out.println(res.getString(5));%>">
         
    </p>
 
		
	<%

}
%>
<input type="number" name="zval" hidden="" value="<% out.print(z); %>">
</br><input type="submit" name="submit" value="submit" style="position: absolute;left: 25%;height: 32px;">


</form>
<%


}
catch(Exception e)
{
	out.println(e);
}


}
else{
	out.println("<center><p style=\"font-weight:bold;color:red;\">Exam Status Inactive</p></br><a href=\"home.jsp\">Home</a><center>");

}
%>
<center></center>
</div>
</body>
</html>
<%
} 
%>