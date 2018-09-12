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
	<title>Online Eamination</title>
	<link rel="stylesheet" type="text/css" href="prostyle.css">
	<style type="text/css">
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



<%
//entered anwers
try{
String qcount=request.getParameter("zval");
int qstnscount=Integer.parseInt(qcount);
int i;
int marks=0;
char a[]=new char[30];
char b[]=new char[20];

for(i=1;i<=qstnscount;i++)
{
	String anstr="question"+i;
	String marked_answer=request.getParameter("ans"+i);
	a[i]=marked_answer.charAt(0);
	
	

}




String fxname=request.getParameter("course");
String cnt=request.getParameter("zval");
int counter=Integer.parseInt(cnt);
 
int j=1;	


   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cosn=DriverManager.getConnection("jdbc:odbc:samp");
	Statement stc=cosn.createStatement();
	ResultSet rts=stc.executeQuery("SELECT ANSWER FROM questions WHERE CNAME='"+fxname+"' ORDER BY QID");
	while(rts.next()){
           String tmp=rts.getString(1);
                   
            b[j]=tmp.charAt(0);
           // b[j]=tmp.charAt(0);
            j++;
           }
   



    
    
 
  
  for(int c=1;c<=counter;c++){
         char q=a[c];
         char p=b[c];
       if(q==p)
       {     
             marks++;
       }

}

String rgnum=(String)session.getAttribute("rnum");
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection cod=DriverManager.getConnection("jdbc:odbc:samp");
	PreparedStatement ps=cod.prepareStatement("insert into results values(?,?,?,?) ");
	ps.setString(1,rgnum);
	ps.setString(2,fxname);
	ps.setInt(3,marks);
	ps.setInt(4,0);
	ps.executeUpdate();
	out.println("</br><div style=\"color:green;font-size: 36px;font-weight: bold;\"><center>Answers submitted sucessfully.!!</center></div>");
out.println("</br><div style=\"color:orange;font-size: 22px;\"><center>check back for results..</center></div>");
	
   
}


 
 catch(Exception e){
 out.println(e);
}



%>
<center><a href="home.jsp">Home</a></center>
</body>
</html>
<%
}
%>