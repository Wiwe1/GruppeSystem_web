<%-- 
    Document   : test
    Created on : Apr 19, 2017, 1:35:12 PM
    Author     : djw
--%>

<%@page import="Data.Projekt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@page import="GruppeSystem_Konsol.GruppeSystem_client"%>
<%@page import="Server.ServerInterface"%>

<%@page import="connector.Connector"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<%
        
    if(session.getAttribute("login")== null);



   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        
    </head>
    <body>
      
         <%      
            
            ServerInterface Iserv = new GruppeSystem_client().lol();
              String usrname = request.getParameter("user");
                List<Projekt> projlist = null;
                int   stdnummer = Integer.parseInt(usrname.substring(1));
                try{
                 projlist= Iserv.getProjekter(stdnummer);

                }catch(Exception e){
                        e.printStackTrace();
                           out.print("Dine projekter kunne ikke findes");
                        
        }
                for(Projekt p:projlist){
                
                    %>
                    
                           <tr>
                  <td><% out.print(p.getDesc()); %></td>
                 <td><% out.print(p.getNavn()); %></td>
                 <td><% out.print(p.getKalender()); %></td>
                      </tr>
                       <%
            
 }
                
              %>                    
              
      
</body>
</html>
