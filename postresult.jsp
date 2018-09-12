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
		.center{
			position: absolute;
			left: 25%;

		}
	</style>
</head>
<body>
	<div class="center">
		<table>
			<tr style="font-weight: bold;">
				<td>
					<label>
						Course Name
						
					</label>
				</td>
				<td>
					<label>
						action
					</label>
				</td>
			</tr>
			<tr>
				<td>
					<form name="pstres" method="post">
					<select name="csel" style="width: 250px;height: 30px;border-radius: 4px;">
						<%
try{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection con=DriverManager.getConnection("jdbc:odbc:samp");
			Statement st=con.createStatement();
			ResultSet res=st.executeQuery("select cname from courses");
			while(res.next())
			{   String updcourse=res.getString(1);
				 %> 
                <option value="<% out.print(updcourse); %>"><% out.print(updcourse); %></option>

		<%	}

}
catch(Exception e)
{
	out.println(e);
}			
%>
						
					</select>
				</td>
				<td>
					<input type="submit" name="subb" value="release result" style="background-color: red;color: white;border-radius: 4px;">
				</td>
			</tr>
          </form>
		</table>
	</div>

</body>
</html>
<%
if(request.getParameter("subb")!= null){
	String topic=request.getParameter("csel");
	out.println(topic);
	try{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection cons=DriverManager.getConnection("jdbc:odbc:samp");
		    int i=1;
			Statement stm=cons.createStatement();
			String sq="UPDATE RESULTS SET RSTATUS='1' WHERE CNAME='"+topic+"' ";
			stm.executeUpdate(sq);
			out.println("update sucessful");
           



}
catch(Exception e)
{
	out.println(e);
}
}
}
%>