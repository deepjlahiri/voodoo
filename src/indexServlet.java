

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.fourspaces.couchdb.*;


/**
 * Servlet implementation class indexServlet
 */
@WebServlet("/indexServlet")
public class indexServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
 public static Session dbSession = new Session("localhost", 5984);   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public indexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  //Session dbSession = new Session("localhost", 5984);
  //String dbname = "users";
    
  //Database db = dbSession.getDatabase(dbname);
  //Document doc = new Document();
  
  String usr = request.getParameter("Username");
  String pwd = request.getParameter("Password");
  String str=new String("[\""+usr+"\",\""+pwd+"\"]");
  
  HttpClient httpclient = new DefaultHttpClient();
  String url= new String("http://localhost:5984/users/_design/loginview/_view/login?key="+URLEncoder.encode(str,"UTF-8"));
  HttpGet get = new HttpGet(url);
  HttpResponse response1 = httpclient.execute(get);
  HttpEntity entity = response1.getEntity();
  InputStream instream = entity.getContent();

  BufferedReader reader = new BufferedReader(new InputStreamReader(instream));
  String strdata = null;
   
  StringBuilder builder = new StringBuilder();
   
  while ((strdata = reader.readLine()) != null) {
     builder.append(strdata);     
   }
  String testStr = builder.toString();
  String lookUp = "\"rows\":[]";
  int i = testStr.indexOf(lookUp);
   
  if (i != -1)
  {
	   request.getRequestDispatcher("/invalidLogin.jsp").forward(request, response);
	   //response.sendRedirect("invalidLogin.jsp");
  }
  else
  {
	   request.getRequestDispatcher("/home.jsp").forward(request, response);
	   //response.sendRedirect("home.jsp");
  }
    
 }

}
