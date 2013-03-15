<%@ page language="java" import="java.sql.*,java.io.*,java.util.*" errorPage="" %>
<%@ page language="java" import="com.fourspaces.couchdb.*,org.apache.http.client.methods.*,org.apache.http.*,org.apache.http.client.*,org.apache.http.impl.client.*" errorPage="" %>
<%
String content=request.getParameter("status");
try{
	
	String msg=new String();
	int i;

	Session dbSession = new Session("localhost", 5984);
	String dbname = "posts";
	//i=5;
	java.util.Date date= new java.util.Date();
	//String dt = (new Timestamp(date.getTime()).toString());
	//String usr=request.getAttribute("Username");
	String user=session.getAttribute("username").toString();
	Database db = dbSession.getDatabase(dbname);
	Document doc = new Document();
	//doc.setId(Integer.toString(6));
	doc.put("author",user);
	doc.put("post_body", content);
	doc.put("timestamp", new Timestamp(date.getTime()));
	doc.put("type","post");
	db.saveDocument(doc);
  }
catch (Exception e){}
%>