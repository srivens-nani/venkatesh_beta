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
	<title>online courses</title>
<link rel="stylesheet" type="text/css" href="prostyle.css">
<style type="text/css">
	.ecsleft{
		position: relative;
		height: 40px;

		background-color: red;
	}
	.ectab{
		position: absolute;
		width: 100%;
		background-color: red;
	}
	.ectab table{
	  background-color:#d4d4d4;
	  position: absolute;
	  left: 0;
	  width: 100%;
	 
	}
	.ectab tr td{
             

	}
</style>
<script type="text/javascript">
<!--
function paper(pre){
	String x=document.getElementById("courname");
	out.Write(x);

}
-->
</script>
</head>
<body>
	<jsp:include page="header-db.jsp"/>
	<div class="ecmain">
		<div class="ecsleft">
			
		</div>
		<div class="ectab">
			<table cellpadding="4px">
             <tr style="font-size: 20px;font-weight: bold;background-color: green;"><td style="width: 150px;">Course</td><td style="width: 150px;">Exam Date</td><td>Description</td></tr>

			<%
		
			String reginum=(String)session.getAttribute("rnum");
			
			//String j;
			try{
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection tcon=DriverManager.getConnection("jdbc:odbc:samp");
			Statement st=tcon.createStatement();
		     int i=0;
		
			 ResultSet re=st.executeQuery("select distinct CNAME from enrolledcourses WHERE register_number='"+reginum+"' ");
			   
			 while(re.next()){

	   %>
		  <form name="listcrs" method="post" action="paper.jsp">
                   
                   
	                <%String j=re.getString(1);%>

	           	          
	              <tr><td>	           
			       <input type="text" name="courname" style="background-color: #d4d4d4;border:0;" readonly="" value="<%out.println(j);%>">
			   </td>
			
		       <%    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection scon=DriverManager.getConnection("jdbc:odbc:samp");    

		   		      Statement stm=scon.createStatement();
			 ResultSet rr=stm.executeQuery("select TESTDATE,DESCRIPTION from COURSES WHERE CNAME= '"+j+"' ");
             while(rr.next()){
             %>
             <td>

               <input type="text" name="tesdate" style="background-color: #d4d4d4;border:0;" readonly="" value="<% out.println(rr.getString(1)); %>">
                   
              </td> <td><% out.println(rr.getString(2)); %></td>
              <td><input type="submit" name="exambtn" value="Write Exam"></td>
            </tr></form>
		  <%
			
             i++;
             
			
			   
		}

             
              


          }
		    	
                     		       
		    //rr.close();
		           
		

		
		
		
		st.close();
		tcon.close();

		}

		
		catch(SQLException e)
		{
			out.println(e);
		}
		catch(Exception ex)
		{
			out.println(ex);
		}
		%>
	</table>
		</div>

		
	</div>


</body>
</html>
<% 
}
 %>