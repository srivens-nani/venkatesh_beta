
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Online Examination</title>

	<script src="jquery-3.3.1.js"></script>
	<script type="text/javascript">
		 function myfun(x){
     
     	var j=x.value;
     
     	
     	
     	if(j==1){

     	 document.getElementById("year").innerHTML="<option value=\"0\">select</option><option value=\'1\'>1st year</option><option value=\'2\'>2nd year</option><option value=\"3\">3rd year</option>";
     	 document.getElementById("branch").innerHTML="<option value\"select\">select</option><option value\"mpcs\">MPCS</option><option value\"mstat\">MSTAT</option><option value\"mecs\">MECS</option><option value\"mpc\">MPC</option>";
     	}
     	if(j==2){
     		document.getElementById("year").innerHTML="<option value=\"0\">select</option><option value=\'1\'>1st year</option><option value=\'2\'>2nd year</option><option value=\"3\">3rd year</option><option value=\"4\">4th year</option> ";
     		document.getElementById("branch").innerHTML="<option value=\"select\">select</option><option value=\"civil\">CIVIL</option><option value=\"cse\">CSE</option><option value=\"ece\">ECE</option><option value=\"eee\">EEE</option><option value=\"it\">IT</option><option value=\"mech\">MECH</option>";
     	}
     	

     }
     //
     
     

     //

		$(document).ready(function(){
			$(".loginbtn").click(function(){
				$("button").animate({top: '40px'});
				$(".loginbox").animate({left: '40%',bottom: '300px'},);
				$(".loginbox").show();
				$(".registerbox").hide();
				$("h1").show();


		});
           
              	  

     });
		
		$(document).ready(function(){
			$(".registerbtn").click(function(){
				$("button").animate({top: '40px'});
				$(".registerbox").animate({left: '40%',bottom: '200px'},);
				$(".registerbox").show();
				$("h1").hide();
				$(".loginbox").hide();
			

		});
           
              	  

     });
		
		
 
		
	</script>
	<style type="text/css">
	.main{
		position: absolute;
	   bottom: 0;
	   left: 0;
	   right: 0;
	   height:15%;
	   background-color: #f2f2f2a3;
	   border: 4px;
	   border-top-right-radius: 10px;
	   border-top-left-radius: 10px;
	   width: 100%;
	   color: #0067b8;
	   font-size: 42px;
	   text-align: center;
	   font-family: verdana;
	   

	}
	.loginbox{
		
		position: absolute;
	   height: 250px;
		text-align: center;
		bottom: 10%;
		left: 40%;
		
		display: none;
		

	}
	.loginbox form input[type="text"],input[type="password"]
	{
		height: 40px;
		width: 250px;
	   
		border-radius: 15px;
	}
	.loginbox form input[type="submit"]
	{
		width:150px;
		background-color: white;
		color:#01eb01;
		height: 40px;
		border:2px;
		border-radius: 10px;
	}
	.loginbtn{
		width:400px;
		height:100px;
		
		border-radius: 0px;
		border-top-right-radius: 50px;
		border-bottom-right-radius: 50px;
		background-color: #00e11199;
		color:white;
		position: absolute;
		left:0;
		top:400px;
		font-weight: bold;
		font-size: 22px;
	    
	}
	.registerbtn{
		width:400px;
		height:100px;
		border-radius: 0px;
		border-top-left-radius: 50px;
		border-bottom-left-radius: 50px;
	
		background-color: #ff0505ab;
		color:white;
		position: absolute;
		right:0;
		top:400px;
		font-weight: bold;
		font-size: 22px
	}
	.registerbox{
		position:absolute;
		 bottom: 0;
		 left: 40%;
		 display: none;
		 border:2px solid;
		 border-radius: 15px;
		 background-color: white;
		 border-color: red;
		 font-family: garamond;
		 font-weight: bold;



	}
	.registerbox input[type="text"],select,input[type="number"],input[type="email"],table input[type="password"]
	{
		width: 200px;
		height:30px;
		border: 2px solid;
		border-radius:10px;
		border-color: red;



	}
	.registerbox input[type="submit"]{
		background-color: red;
		font-weight: bold;
		color:white;
		width:80px;
		height:40px;
		border-color: white;
		border-radius: 6px;
	}
</style>
</head>
<body background="gcover.jpg" style="background-size: cover; background-blend-mode: lighten;">

<div class="main">
<p>ONLINE EXAMINATION PORTAL</p>
</div>
<div>
	<center><h1 style="font-size: 80px; color:#517fff;font-family: chiller;">WELCOME</h1></center>
</div>
<button class="loginbtn"><u>login</u></button>
<button class="registerbtn"><u>Register</u></button>
<div class="loginbox" id="log">
	<form name="fr" method="post">
			<label><B>STUDENT LOGIN</B></label>
			</br></br><input type="text" name="regnum" value="" placeholder="Registration num" required="">
			</br></br><input type="password" name="pass" value="" placeholder="password">
			</br></br><input type="submit" name="submit" value="login">
		</form>
		</div>
		<div class="registerbox">
			 <table cellpadding="4px" cellspacing="4px">
			 	<form name="frm" method="post" onsubmit="passwordver(this)">
			 	<tr><td><label>First Name</label></td><td><input type="text" name="fname" required=""> </td></tr>
			 	<tr><td><label>Last Name</label></td><td><input type="text" name="lname" required=""></td></tr>
			 	<tr><td><label>Register Number</label></td><td><input type="text" name="regnum" required=""></td></tr>
			 	<tr><td><label>Course</label></td><td><select id="course" name="sel" onchange="myfun(this)" required=""><option value="0">select</option><option value="1">BSc</option><option value="2">B.tech</option></select></td></tr>
			 	<tr><td><label>Year</label></td><td><select id="year" name="year" required="" ></select></td></tr>
			 	<tr><td><label>Branch</label></td><td><select id="branch" name="branch" required=""></select></td></tr>
			 	<tr><td><label>mobile</label></td><td><input type="text" name="mobile" required=""></td></tr>
			 	<tr><td><label>email</label></td><td><input type="email" name="email" required=""></td></tr>
			 	<tr><td><label>password</label></td><td><input type="password" name="pass" required=""></td></tr>
			 	<tr><td>Re-enter password</td><td><input type="password" name="passcf" required=""></td></tr>
			 	<tr><td></td><td><input type="submit" name="register" value="Register"></td></tr>
			 	
			</form>
			 </table>
		</div>
		
</body>
</html>
<% if(request.getParameter("submit") == null)
			 		{
                      out.println(""); 
			 		}
else{
String regnum =request.getParameter("regnum");
String lpwd=request.getParameter("pass");
out.println(lpwd);

 try
 {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("jdbc:odbc:samp");
 Statement st=con.createStatement();
 //PreparedStatement stmt=con.prepareStatement("SELECT  PASSWORD FROM students where REGISTER_NUMBER=? ");
 //stmt.setString(1,str);
 ResultSet rs=st.executeQuery("SELECT  PASSWORD FROM students where REGISTER_NUMBER= '"+regnum+"' ");
 //ResultSet rs=stmt.executeQuery();
 while(rs.next()){
  //String tpass=;

 if((lpwd).equals (rs.getString(1)))
 {
 	session.setAttribute("rnum",regnum);
 	response.sendRedirect("home.jsp");

}
}
rs.close();
st.close();
con.close();

 }
 
catch(Exception e)
 {
 out.println("error"+e);
 }




}
if(request.getParameter("register") == null)
{    
	out.println("");
}
else{
  String name=request.getParameter("fname") + " " + request.getParameter("lname");
//String lastname=;
String regnum=request.getParameter("regnum");
String course=request.getParameter("sel");
String cyear=request.getParameter("year");
String sbranch=request.getParameter("branch");
String mobile=request.getParameter("mobile");
String emailid=request.getParameter("email");
String password=request.getParameter("pass");
String cnpassword=request.getParameter("passcf");
try{
if((password).equals (cnpassword)){
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("jdbc:odbc:samp");
Statement st=con.createStatement();
String idata="insert into students values('"+regnum+"','"+name+"','"+course+"','"+cyear+"','"+sbranch+"','"+mobile+"','"+emailid+"','"+password+"')";
st.executeUpdate(idata);
session.setAttribute("rnum",regnum);
response.sendRedirect("home.jsp");
st.close();
con.close();
}
else{
	out.println("<script type=\"text/javascript\">alert(\"passwords not match\")</script>");
}

}
catch(Exception e)
{
	out.println(e);
}

}
 %>



