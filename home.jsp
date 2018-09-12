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
	<title>Online Examination</title>
	<script src="jquery-3.3.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".lefttop").click(function(){
				$(".right").height(600);

		});
			
			});
		
	</script>
	
</head>
<body>
	<jsp:include page="header-db.jsp"/>
<div class="lefttop">
	<label style="color:#0729d7;font-weight:bold;position: fixed;"><u><b>Upcoming Cources:</b></u></label>
	<marquee direction="up" scrolldelay="150" height="80%" vspace="20">
	<%
	   try{
	   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	   Connection ctno=DriverManager.getConnection("jdbc:odbc:samp");
	   Statement statf=ctno.createStatement();
	   ResultSet rsls=statf.executeQuery("select upcomingcrs from upcoming");
	   while(rsls.next())
	   {
	   	 out.println("</br><span style=\"color:#ff4138;\"></span>"+rsls.getString(1));
	   }

	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>

</marquee>
</div>
<div class="leftbottom">
	<label style="color:white;font-weight:bold;"><b>Contact us:</b></label>
	<div style="padding: 10px;">
		<a href="">Email us</a></br></br>
		<a href="">follow us on facebook</a></br></br>
		<a href="">twitter</a></br></br>


	</div>

</div>
<div class="right" id="rgt" style="padding: 10px;overflow: hidden;">
	<label style="color:#0729d7;font-weight:bold;font-size: 18px;"><b>Notifications:</b></label>
	
	<%
	   try{
	   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	   Connection ctnn=DriverManager.getConnection("jdbc:odbc:samp");
	   Statement state=ctnn.createStatement();
	   ResultSet rslt=state.executeQuery("select notifname from notifications");
	   while(rslt.next())
	   {
	   	 out.println("</br> <span style=\"color:#ff4138;\">*</span>"+rslt.getString(1));
	   }

	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>

	
</div>
<div class="center">
	<p>
	
</p>
</div>

</body>
</html>
<%
}
%>