<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<% if(session.getAttribute("ads")== null)
{
	response.sendRedirect("admin_login.jsp");
}
else{
%>
<html>
<head>
	<title>admin page</title>
	<style type="text/css">
		.ad{
			font-weight: bold;
		    font-size:20px;
		    color: red;
		    
		}
		.ac{
			display: block;
			position: absolute;
			height: 40px;
			width: 100%;
			background-color:#efeeec;
		    left: 0;


			
		}
		.ac table tr td a{
			text-decoration: none;
			background-color: #ffffff;
			padding: 4px;
			color: #5bbed4;
			border: solid 2px;
			border-color: #5bbed4;
			border-radius: 1px;
		}
		.ac table tr td a:hover{
			text-decoration: none;
			background-color: #ffffff;
		
			color: #ff1616;
			border: solid 2px;
			border-color: #ff1616;
			border-radius: 2px;
		}
	
		iframe{
			position: absolute;
			top: 17%;
			left:5%;
			width: 90%;
			height:300px;
			border: 0;


		}
		.bottom{
			height: 20%;
			width: 100%;
			text-align: center;
			font-size: 46;
			position: absolute;
			bottom: 0;
			left: 0;
			background-color: #bcbcbc;
			opacity: 0.5;
		}
		
		
			
		
	</style>
</head>
<body>
	<div class="ad">
		<center><h1>ADMINISTRATOR</h1></center>
	</div>
	<div class="ac">
		<table>
		<tr>
			<td>
				<a href="addcourse.jsp" target="fr1" style="position: absolute;left: 10;">ADD COURSE</a>
			</td>
			<td>
				<a href="ques.jsp" target="fr1" style="position: absolute;left: 150;">POST Q.PAPER</a>
			</td>
			<td>
				<a href="postresult.jsp" target="fr1" style="position: absolute;left: 300;">POST RESULT</a>
			</td>
			<td>
				<a href="notifications.jsp" target="fr1" style="position: absolute;left:450;">POST INFORMATION</a>
			</td>
			<td>
				<a href="admin_logout.jsp" style="position: absolute;right: 10;">LOGOUT</a>
			</td>
		</tr>
	</table>
	</div>
	
		<iframe src="" name="fr1"></iframe>
<div class="bottom">
	<marquee scrollamount="10">Online Examination Portal</marquee>
</div>	
</body>
</html>
<%
}
%>