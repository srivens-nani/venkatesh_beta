<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
if(session.getAttribute("ads")!= null){
	session.invalidate();
	

	response.sendRedirect("admin_login.jsp");
}
else{

response.sendRedirect("admin_login.jsp");
	
}
%>