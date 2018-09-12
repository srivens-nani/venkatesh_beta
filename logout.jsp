<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("rnum")!= null){
	session.invalidate();
	

	response.sendRedirect("intro.jsp");
}
else{
out.print("session is on");
response.sendRedirect("intro.jsp");
	
}
%>