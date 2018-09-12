<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("rnum")==null){
	response.sendRedirect("intro.jsp");
}
else{
%> 
<html>
<head><title>result</title></head>
<body>
	<style type="text/css">
		.rcenter label{
			 font-weight:bold;
			 font-size: 15px; 
		}
		.rcenter{
			position: absolute;
			top:40%;
			left: 35%;
		}
		.rbox{
			background-color: #efeeec;
		}
		.rcenter iframe{
			width: 370px;
		}
		.disp{
			height: 100px;
			width: 375px;
			position: absolute;
			bottom: 20%;
			left: 35%;
			background-color: #efeeec;
			border:4px;
			border-radius: 4px;
			text-align: center;

		}
		.disp p{
			position:relative;
			bottom:-25px;
			color: blue;
		}
	</style>
	<jsp:include page="header-db.jsp"/>
	<div class="rcenter">
	<table class="rbox">
		<h2 style="text-align: center;color: #888">RESULTS</h2>
		<form name="resfrm" method="post" action="#">
		<tr><td width="200px">
			<label> Registration no:</label></td>
			<td><input type="text" name="rn"></td></tr>
			
			<tr>
				<td>
					<label>Course:</label></td>
					<td><select id="slt" name="selt">
						<%
						try{
						   String instn=(String)session.getAttribute("rnum");
						
	                      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	              		Connection conct=DriverManager.getConnection("jdbc:odbc:samp");
	             		Statement cstm=conct.createStatement();
	             		ResultSet crst=cstm.executeQuery("SELECT distinct CNAME FROM RESULTS WHERE RSTATUS=1 and REGISTER_NUMBER='"+instn+"' ");
	             		while(crst.next())
	             		{
	             			String crse = crst.getString(1);
	             			%>

	             			<option value="<% out.print(crse); %>"><% out.print(crse); %></option>

	             			<%
	             			
	             		}
	             	}
	             	catch(Exception e)
	             	{
	             		out.println(e);
	             	}
						%>
						
						
					</select>
					
				</td>
			</tr>
			<tr>
				<td> </td>
					<td><input type="submit" name="btn" value="Result"></td>
			</tr></form>
	</table>
	
		
	</div>
</div>
</body> 
<%
if(request.getParameter("btn")!= null)
{
	
String reg=request.getParameter("rn");
String crs=request.getParameter("selt");


try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection conn=DriverManager.getConnection("jdbc:odbc:samp");
	Statement cs=conn.createStatement();
	
	ResultSet rst=cs.executeQuery("select RESULT from results where REGISTER_NUMBER='"+reg+"' AND CNAME='"+crs+"' AND RSTATUS=1 ");
	while(rst.next())
	{    out.println("<div class=\"disp\"><p>");

		
		out.println("Total score in");out.println(crs+":");
		
		String res=rst.getString(1);
	   
	   if(res.equals("null"))
	   {
	   	out.println("Result not found..!");
	   }
	   else{
	   out.println(res);
	}

	out.println("</p></div>");
	}

}
catch(java.lang.NullPointerException e)
{
	out.println("result not found!!");
}
catch(Exception e)
{

	out.println(e);
}

}

else{
	out.println(" ");
}
}
%>