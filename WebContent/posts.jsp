<%@ page language="java" import="java.sql.*,java.io.*" errorPage="" %>
<%@ page language="java" import="com.fourspaces.couchdb.*,org.apache.http.client.methods.*,org.apache.http.*,org.apache.http.client.*,org.apache.http.impl.client.*" errorPage="" %>
<html>
<head></head><body>
<%
String content=request.getParameter("content");
String msg=new String();
int i;

Session dbSession = new Session("localhost", 5984);
String dbname = "user_feeds";
i=1;


Database db = dbSession.getDatabase(dbname);
Document doc = new Document();
doc.setId(Integer.toString(i));

doc.put("feedbody", content);
db.saveDocument(doc);
doc=db.getDocument(Integer.toString(i));
String st= new String(doc.toString());
i++;

String[] split = st.split("feedbody\":\"");
//String sub0 = split[0];
String sub1 = split[1];
//System.out.println(sub0);
String[] splits = sub1.split("\"");
msg = splits[0];

%>
<li>
<div align="left">
<span ><%= msg %> </span>
</div>
</li>
</body>