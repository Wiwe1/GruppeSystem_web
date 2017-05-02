<%-- 
    Document   : test
    Created on : Apr 19, 2017, 1:35:12 PM
    Author     : djw
--%>

<%@page import="Data.Aftale"%>
<%@page import="Data.Aftale"%>
<%@page import="Data.Opgave"%>
<%@page import="Data.Projekt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>

<%@page import="GruppeSystem_Konsol.GruppeSystem_client"%>
<%@page import="Server.ServerInterface"%>

<%@page import="connector.Connector"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

out.print("banan");
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
              
            
                    
              <%
                    for(Projekt p:projlist){
                    
                            List<Opgave> opglist = Iserv.getOpgaver(p.getId(), stdnummer);
                            
                            
                            for(Opgave opg:opglist){
                                
                                
                  %>
               
                  
                  <td><% out.print(opg.getNavn()); %></td>
                 <td><% out.print(opg.getBeskrivelse()); %></td>                 
                 <td><% out.print(opg.getAnsvarlige()); %></td>                 
              
                 
                                
                            }
                           
<%
                              List<Aftale> aflist = Iserv.getAftaler(p.getId(), stdnummer);

                                 for(Aftale a: aflist){
                  %>                
                                      <td><% out.print(a.getNavn()); %></td>
                                    <td><% out.print(a.getBeskrivelse()); %></td>                 
                                    <td><% out.print(a.getAnsvarlige()); %></td> 
                                     <td><% out.print(a.getLokation()); %></td>  
                                     <td><% out.print(a.getTidspunkt()); %></td> 
                                       
<%
                            }

                    
                    
                    }
                  
                  %>
              
              <form method="get" action="groupting.jsp">
        

            projectname: <input type="text" name="id"><br>
            projectname: <input type="text" name="projectname"><br>
            projectdesc: <input type="text" name="projectdesc"><br>
            groupname: <input type="text" name="groupname"><br>
            adminid: <input type="text" autofocus name="adminid"><br>
            <button type="submit" onclick="onButton(text.toString()); onButton(projectname.toString(),projectdesc.toString(),groupname.toString(),adminid.toString())
                    " id="create project" name="login">Login</button>
                    <%          String id = request.getParameter("id");
                                int   proid = Integer.parseInt(id);
                                String a_id = request.getParameter("adminid");
                                int   adid = Integer.parseInt(a_id);
                                String proname = request.getParameter("projectname");
                                String prondesc = request.getParameter("projectdesc");
                                String grpname= request.getParameter("groupname");
                                
                                Iserv.CreateProjekt(new Projekt(proid,proname,prondesc,grpname,adid), stdnummer);

                        %>
        </form>
      
</body>
</html>
