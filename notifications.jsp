<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
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
		.main{
			position: absolute;
			left: 30%;
			top:25%;
		}
	</style>
</head>
<body>
	<div class="main">
	<table>
		<tr style="color: green;"><td>
	<form name="upcrs" method="post">

	<label>upcoming courses:</label></td>
	<td><input type="text" name="upcmg" style="width: 300px;height: 30px;border: solid 2px;border-color: green;border-radius: 4px;"></br>
	<input type="submit" name="upsb" style="background-color: green;color: white;border-radius: 4px;">
</form></td><form name="dfrm" method="post"><td><select name="delcr" style="width: 300px;height: 30px;border: solid 2px;border-color: red;border-radius: 4px;">
	<option value=""> delete upcoming course</option>
	<%
	  try{
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  Connection cn=DriverManager.getConnection("jdbc:odbc:samp");
	  Statement scrs=cn.createStatement();
	  ResultSet rcrs=scrs.executeQuery("select upcomingcrs from upcoming");
	  while(rcrs.next()){
	    String tt=rcrs.getString(1);
	  %>

	  <option value="<% out.print(tt); %>"><% out.println(tt); %></option>
	  
	<%}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>

	
	
</select></br><input type="submit" name="delcrb" value="delete upcoming" style="background-color: red;color: white;border-radius: 4px;"></td></form>
<%
if(request.getParameter("delcrb")!= null)
	{
	String delc=request.getParameter("delcr");
	
		try{
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  Connection cm=DriverManager.getConnection("jdbc:odbc:samp");
	  Statement scrq=cm.createStatement();
	  String dq="DELETE * from upcoming WHERE UPCOMINGCRS='"+delc+"' ";
	  scrq.executeUpdate(dq);
	  out.println(delc+" deleted.!!");
	  response.sendRedirect("notifications.jsp");

  
  }
  catch(Exception e){
  out.println(e);
}
}
 %>
</tr>
<%
if(request.getParameter("upsb")!= null)
{   
    String upcr=request.getParameter("upcmg"); 

	try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cont=DriverManager.getConnection("jdbc:odbc:samp");
	PreparedStatement pstm=cont.prepareStatement("insert into upcoming (UPCOMINGCRS) values(?)");
	pstm.setString(1,upcr);
	
	pstm.executeUpdate();
	out.println("upcomings updated");
	//response.sendRedirect("notifications.jsp");
   }
   catch(Exception e){
   out.println(e);
}

}
%>
<td>
	
</td>
<form name="ntfrm" method="post">
	<tr style="color: blue;"><td><label>notifications:</label></td>

	<td><input type="text" name="ntfct" style="width: 300px;height: 30px;border: solid 2px;border-color: blue;border-radius: 4px;"></br>
<input type="submit" name="ntfb" style="background-color: blue;color: white;border-radius: 4px;"></td>
</form></td><form name="delnot" method="post"><td><select name="delntf" style="width: 300px;height: 30px;border: solid 2px;border-color: red;border-radius: 4px;">
	
<%
	  try{
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  Connection cnn=DriverManager.getConnection("jdbc:odbc:samp");
	  Statement scrz=cnn.createStatement();
	  ResultSet rcro=scrz.executeQuery("select notifname from notifications");
	  while(rcro.next()){
	    String ts=rcro.getString(1);
	  %>

	  <option value="<% out.print(ts); %>"><% out.println(ts); %></option>
	  
	<%}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>



</select></br>
<input type="submit" name="delntb" value="delete notification" style="background-color: red;color: white;border-radius: 4px;"></td></form></tr>
<%
if(request.getParameter("delntb")!= null)
	{
	String delf=request.getParameter("delntf");
	
		try{
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  Connection ca=DriverManager.getConnection("jdbc:odbc:samp");
	  Statement scra=ca.createStatement();
	  String da="DELETE * from notifications WHERE notifname='"+delf+"' ";
	  scra.executeUpdate(da);
	  out.println(delf+" deleted.!!");
	  response.sendRedirect("notifications.jsp");

  
  }
  catch(Exception e){
  out.println(e);
}
}
 %>
</table>
<%
if(request.getParameter("ntfb")!= null)
{   
    String ntf=request.getParameter("ntfct"); 

	try{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cons=DriverManager.getConnection("jdbc:odbc:samp");
	PreparedStatement pssm=cons.prepareStatement("insert into notifications (notifname) values(?)");
	pssm.setString(1,ntf);
	
	pssm.executeUpdate();
	out.println("notifications updated");
	//response.sendRedirect("notifications.jsp");
   }
   catch(Exception e){
   out.println(e);
}

}
}
%>
</div>
</body>
</html>