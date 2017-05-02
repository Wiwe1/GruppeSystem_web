<%-- 
    Document   : Login
    Created on : Apr 19, 2017, 10:37:31 AM
    Author     : djw
--%>

<%@page import="GruppeSystem_Konsol.GruppeSystem_client"%>
<%@page import="Server.ServerInterface"%>
<%@page import="Server.ServerInterface"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
         <%
             String usrname ="";
            String pwd = "";
                
         ServerInterface Iserv = new GruppeSystem_client().lol();
           if(request.getParameter("login")!=null){
            usrname =request.getParameter("user");
            pwd = request.getParameter("password");
                  int   stdnummer = Integer.parseInt(usrname.substring(1));
            out.println(usrname + " " + pwd);       
         
            out.println( Iserv.login(stdnummer,pwd));
          if( Iserv.login(stdnummer,pwd)!=null) {
      session.setAttribute("login","true");               
        String redirectURL ="test.jsp";
        response.sendRedirect(redirectURL);
  
        }
          else{
         session.removeAttribute("login");
         response.sendRedirect("index.html");
        out.println("Forkert login");
          }
          
        }
        
          %>
          
            
        
        
        
    </body>
</html>
