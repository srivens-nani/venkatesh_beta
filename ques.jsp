<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<% if(session.getAttribute("ads")== null)
{
	out.println("Your Session time out..!");
}
else{
%>
<html>
<head>
	<title>question paper</title>
</head>
<style type="text/css">
	#upbox{
		width:400px;
      }
	.qp{
		position: absolute;
		left: 20%;
		top:10%;
	}

</style>
<script type="text/javascript">
	function fun(x){
	
		var temp=document.qutnfrm.sell.value;
		document.write(temp);


	}
</script>
<body>
	<div class="qp">
	
		
		<form name="qutnfrm" method="post"> 
	<table width="700px" id="paperview">
		<tr><td>Select course:</td><td>
			<select name="sell">
				<%
try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection con=DriverManager.getConnection("jdbc:odbc:samp");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select cname from courses");
    while(rs.next())
    {  %> 
<option><%= rs.getString(1)%></option>

<%
    }
}
catch(Exception e)
{
	out.println("e");
}

%>
			</select>
		</td></tr>
		<tr><td style="font-weight: bold">Question</td><td><input type="text" name="q1" style="width: 500px;height:30px;border-radius: 4px; "></td><td><p style="color:red;font-size: 14px;">*less than 250 chars</p></td></tr>
		<tr><td>option A</td><td><input type="text" name="opta"></td></tr>
        <tr><td>option B</td><td><input type="text" name="optb"></td></tr>
        <tr><td>option C</td><td><input type="text" name="optc"></td></tr>
        <tr><td>option D</td><td><input type="text" name="optd"></td></tr>

        <tr style="color: red;"><td>Answer</td><td><input type="text" name="ans" pattern="[A-D]{1}" maxlength="1"></td></tr>
        <tr style="height: 15px;"></tr>
		<tr><td></td><td><input type="submit" name="subques" value="post question"></td></tr>
	</table>
</div>
</body>
</html>
<%
int count=0;
if(request.getParameter("subques")!= null)
{
	
	String opt=request.getParameter("sell");
	String ques=request.getParameter("q1");
	String opt1=request.getParameter("opta");
    String opt2=request.getParameter("optb");
    String opt3=request.getParameter("optc");
    String opt4=request.getParameter("optd");
    String answ=request.getParameter("ans");
    
    try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection con=DriverManager.getConnection("jdbc:odbc:samp");
    PreparedStatement ps=con.prepareStatement("INSERT INTO questions(CNAME,QUESTION,OPA,OPB,OPC,OPD,ANSWER) values(?,?,?,?,?,?,?)");
    ps.setString(1,opt);
    ps.setString(2,ques);
    ps.setString(3,opt1);
    ps.setString(4,opt2);
    ps.setString(5,opt3);
    ps.setString(6,opt4);
    ps.setString(7,answ);
    ps.executeUpdate();
    out.println("<p style=\"color:green;position:absolute;top:50%;left:50%\">Question inseted sucessfully</p>");
    ps.close();
    con.close();
    

  }


catch(Exception e)
{
	out.println(e);
}
}
}
%>