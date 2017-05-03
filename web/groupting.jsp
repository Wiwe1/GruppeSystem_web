<%-- 
    Document   : test
    Created on : Apr 19, 2017, 1:35:12 PM
    Author     : djw
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Aftale"%>
<%@page import="DTO.Aftale"%>
<%@page import="DTO.Opgave"%>
<%@page import="DTO.Projekt"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>

<%@page import="transport.ServerInterface"%>

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
            
            ServerInterface Iserv = new transport.Client().lol();
              String usrname = request.getParameter("user");
                List<Projekt> projlist = null;
                int   stdnummer = 154694;    //Integer.parseInt(usrname.substring(1));
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
              
            
                    
              <%    List<Opgave> opglist = new ArrayList<Opgave>();
                    for(Projekt p:projlist){
                            List<Opgave> ol = new ArrayList<Opgave>();
                            try{
                            ol = Iserv.getOpgaver(p.getId(), stdnummer);
                            }catch(Exception e){
                                
                            }
                            
                            for(Opgave opg: ol){
                                opglist.add(opg);
                                
                  %>
               
                  
                  <td><% out.print(opg.getNavn()); %></td>
                 <td><% out.print(opg.getBeskrivelse()); %></td>                 
                 <td><% out.print(opg.getAnsvarlige()); %></td>                 
              
                 
                                
                            
                           
<%                          
        <form method="get" action="L
                            }
                            List<Aftale> aflist = new ArrayList<Aftale>();
                            
                            try{
                            aflist = Iserv.getAftaler(p.getId(), stdnummer);
                            }catch(Exception e){
                            }
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
                                try{
                                Iserv.CreateProjekt(new Projekt(proid,proname,prondesc,grpname,adid), stdnummer);
                                }catch(Exception e){
                                    
                                }

                        %>
        </form>
        
        <form method="get" action="groupting.jsp">
        

            aftaledate: <input type="text" name="tidspunkt"><br>
            aftalelokation: <input type="text" name="lokation"><br>
            aftaleid: <input type="text" name="id"><br>
            aftalename: <input type="text" name="navn"><br>
            aftaledesc: <input type="text" name="aftaledesc"><br>
            <button type="submit" onclick="onButton(text.toString()); onButton(aftaledate.toString(),aftalelokation.toString(),aftaleid.toString(),aftalename.toString(), aftaledesc.toString())
                    " id="create aftale" name="login">Login</button>
                    <%          //String date = request.getParameter("tidspunkt");
                                String lokation = request.getParameter("lokation");
                                String aftid = request.getParameter("id");
                                int aftaleid = Integer.parseInt(aftid);
                                String aftalenavn = request.getParameter("navn");
                                String desc = request.getParameter("aftaledesc");
                                try{
                                Iserv.CreateAftale(new Aftale(aftaleid, aftalenavn, desc, new Date(1,1,1), lokation), stdnummer, 1000);
                                }catch(Exception e){
                                    
                                }
                        %>
        </form>
        
        <form method="get" action="groupting.jsp">
        

            
            opgaveid: <input type="text" name="opgid"><br>
            opgavename: <input type="text" name="opgnavn"><br>
            opgavedesc: <input type="text" name="opgdesc"><br>
            <button type="submit" onclick="onButton(opgid.toString()); onButton(opgid.toString(),opgnavn.toString(),opgdesc.toString())
                    " id="create opgave" name="login">Login</button>
                    <%          
                                String opgnavn = request.getParameter("opgnavn");
                                String opgdesc = request.getParameter("opgdesc");
                                String ids = request.getParameter("opgid");
                                int opgid = Integer.parseInt(ids);
                                try{
                                Iserv.CreateOpgave(new Opgave(opgid, opgnavn, opgdesc), stdnummer, 1000);
                                }catch(Exception e){
                                    
                                }
                        %>
        </form>

</body>
</html>
