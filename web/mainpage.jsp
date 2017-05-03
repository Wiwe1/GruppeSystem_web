<%-- 
    Document   : mainpage
    Created on : May 3, 2017, 9:30:25 AM
    Author     : elbosso
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
<!DOCTYPE html>
<%
        
    if(session.getAttribute("login")== null);



   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gruppesys</title>
       
        
    </head>
    <body>
        <h1>Velkommen til dit eget lolleren gruppesys</h1>
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
                %>
                <table style="width:75%">
                <%
                int i = 0;
                for(Projekt p : projlist){
                    List<Opgave> ol = new ArrayList<Opgave>();
                    ol.add(new Opgave(1, "lol", "lol"));
                    ol.add(new Opgave(1, "lol", "lol"));ol.add(new Opgave(1, "lol", "lol"));
                    
                    
                    try{
                        //ol = Iserv.getOpgaver(p.getId(), stdnummer);
                    }catch(Exception e){
                    }
                    
                    
                    List<Aftale> al = new ArrayList<Aftale>();
                    al.add(new Aftale(1, "gg", "dræb mig", new Date(1), "din mor"));
                    al.add(new Aftale(1, "gg", "dræb mig", new Date(1), "din mor"));
                    al.add(new Aftale(1, "gg", "dræb mig", new Date(1), "din mor"));
                    
                    try{
                        //al = Iserv.getAftaler(p.getId(), stdnummer);
                    }catch(Exception e){
                    }
                            
                    
                    i++;
                    %>
                    
                    <tr>           
                        <th><% out.println("Projekt: "+ i); %></th>
                        <th><% out.println(p.getDesc()); %></th>
                        <th><% out.println(p.getNavn()); %></th>
                        <th><% out.println(p.getKalender()); %></th>
                    </tr>
                      
                    <tr>
                        <th> Opgaver: </th>
                    <tr>
                    </tr>
                    
                    <%
                            
                          for(Opgave opg: ol){      
                  %>
               
                  <tr>
                  <th><% out.print(opg.getNavn()); %></th>
                 <th><% out.print(opg.getBeskrivelse()); %></th>                 
              
                 </tr>
                                
                            
                           
<%                          
                       }     
                    %>
                    
                    <tr>
                        <th> Aftaler: </th>
                    <tr>
                    </tr>
                    
                    <%
                            
                          for(Aftale aft: al){      
                  %>
               
                  <tr>
                  <th><% out.print(aft.getNavn()); %></th>
                 <th><% out.print(aft.getBeskrivelse()); %></th>                 
              
                 </tr>
                                
                            
                           
<%                          
                       }     
                    %>
                    
                    
                       <%  }

              %>            
                </table>
                <br><br><br><br><br><br><br>
                
                Her laver du et nyt projekt:
                <form method="get">
        

            
            projectname: <input type="text" name="projectname"><br>
            projectdesc: <input type="text" name="projectdesc"><br>
            groupname: <input type="text" name="groupname"><br>
            <button type="submit" onclick="onButton(text.toString()); onButton(projectname.toString(),projectdesc.toString(),groupname.toString(),adminid.toString())
                    " id="create project" name="opretProj">Opret Projekt</button>
                    <%         
            
                                if(request.getParameter("opretProj") != null){
                                    int   proid = 1;
                                    String proname = request.getParameter("projectname");
                                    String prondesc = request.getParameter("projectdesc");
                                    String grpname= request.getParameter("groupname");
                                    try{
                                    Iserv.CreateProjekt(new Projekt(proid,proname,prondesc,grpname,stdnummer), stdnummer);
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }

                        %>
                    
        </form>
                        <br><br>
                        Opret en aftale her:
                        <form method="get" action="groupting.jsp">
        

            aftaledate: <input type="text" name="tidspunkt"><br>
            aftalelokation: <input type="text" name="lokation"><br>
            aftaleid: <input type="text" name="id"><br>
            aftalename: <input type="text" name="navn"><br>
            aftaledesc: <input type="text" name="aftaledesc"><br>
            <button type="submit" onclick="onButton(text.toString()); onButton(aftaledate.toString(),aftalelokation.toString(),aftaleid.toString(),aftalename.toString(), aftaledesc.toString())
                    " id="create aftale" name="opretAft">Opret Aftale</button>
                    <%          //String date = request.getParameter("tidspunkt");
                        
                                if(request.getParameter("opretAft") != null){
                                String lokation = request.getParameter("lokation");
                                String aftid = request.getParameter("id");
                                int aftaleid = Integer.parseInt(aftid);
                                String aftalenavn = request.getParameter("navn");
                                String desc = request.getParameter("aftaledesc");
                                try{
                                Iserv.CreateAftale(new Aftale(aftaleid, aftalenavn, desc, new Date(1,1,1), lokation), stdnummer, 1000);
                                }catch(Exception e){
                                    
                                }
                                }
                        %>
        </form>
        <br><br>
        Opret en opgave her:
        <form method="get" action="groupting.jsp">
        

            
            opgaveid: <input type="text" name="opgid"><br>
            opgavename: <input type="text" name="opgnavn"><br>
            opgavedesc: <input type="text" name="opgdesc"><br>
            <button type="submit" onclick="onButton(opgid.toString()); onButton(opgid.toString(),opgnavn.toString(),opgdesc.toString())
                    " id="create opgave" name="opretOpg">Opret Opgave/button>
                    <%          
                                if(request.getParameter("opretOpg") != null){
                                String opgnavn = request.getParameter("opgnavn");
                                String opgdesc = request.getParameter("opgdesc");
                                String ids = request.getParameter("opgid");
                                int opgid = Integer.parseInt(ids);
                                try{
                                Iserv.CreateOpgave(new Opgave(opgid, opgnavn, opgdesc), stdnummer, 1000);
                                }catch(Exception e){
                                    
                                }
                                }
                        %>
        </form> 
            
                    
              
              
    </body>
</html>
