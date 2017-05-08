<%-- 
    Document   : mainpage
    Created on : May 3, 2017, 9:30:25 AM
    Author     : elbosso
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Projekt"%>
<%@page import="DTO.Opgave"%>
<%@page import="DTO.Aftale"%>
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
              String usrname = (String) session.getAttribute("user");
                List<Projekt> projlist = null;
                int   stdnummer = Integer.parseInt(usrname.substring(1));
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
                        ol = Iserv.getOpgaver(p.getId(), stdnummer);
                    }catch(Exception e){
                    }
                    
                    
                    List<Aftale> al = new ArrayList<Aftale>();
                  
                    
                    try{
                        al = Iserv.getAftaler(p.getId(), stdnummer);
                    }catch(Exception e){
                    }
                            
                    
                    i++;
                    %>
                    
                    <br>
                    <tr>     
                    
                        <th><% out.println("Projekt: "+ i); %></th>
                        <th><% out.println(p.getDesc()); %></th>
                        <th><% out.println(p.getNavn()); %></th>
                    </tr>
                      
                    <tr>
                        <th> Opgaver: </th>
                    <tr>
                    </tr>
                    
                    <%
                            
                          for(Opgave opg: ol){      
                  %>
               
                <tr>
                    <th><% out.print(opg.getId()); %></th>
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
                    <th><% out.print(aft.getId()); %></th>
                    <th><% out.print(aft.getNavn()); %></th>
                    <th><% out.print(aft.getBeskrivelse()); %></th>                 
                    <th><% out.print(aft.getTidspunkt()); %></th>
                    <th><% out.print(aft.getLokation()); %></th>
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
                        <form method="get">
        

            aftaledate: <input type="text" name="tidspunkt"><br>
            aftalelokation: <input type="text" name="lokation"><br>
            aftalename: <input type="text" name="navn"><br>
            aftaledesc: <input type="text" name="aftaledesc"><br>
            projektid: <input type="text" name="proid"><br>
            <button type="submit" onclick="onButton(text.toString()); onButton(aftaledate.toString(),aftalelokation.toString(),aftaleid.toString(),aftalename.toString(), aftaledesc.toString())
                    " id="create aftale" name="opretAft">Opret Aftale</button>
                    <%          //String date = request.getParameter("tidspunkt");
                        
                                if(request.getParameter("opretAft") != null){
                                String lokation = request.getParameter("lokation");
                                String aftalenavn = request.getParameter("navn");
                                String desc = request.getParameter("aftaledesc");
                                String dato = request.getParameter("tidspunkt");
                                String lol = request.getParameter("proid");
                                int proid = Integer.parseInt(lol);
                                try{
                                    Iserv.CreateAftale(new Aftale(1, aftalenavn, desc, dato , lokation), stdnummer, proid);
                                }catch(Exception e){
                                    out.println("IKKE OPRETTET AF ÅRSAGER");
                                }
                                }
                        %>
        </form>
        <br><br>                    
        Opret en opgave her:
        <form method="get">
        

            
            opgavename: <input type="text" name="opgnavn"><br>
            opgavedesc: <input type="text" name="opgdesc"><br>
            projektid: <input type="text" name="proidto"><br>
            <button type="submit" onclick="onButton(opgid.toString()); onButton(opgid.toString(),opgnavn.toString(),opgdesc.toString())
                    " id="create opgave" name="opretOpg">Opret Opgave</button>
                    <%          
                                if(request.getParameter("opretOpg") != null){
                                    String opgnavn = request.getParameter("opgnavn");
                                    String opgdesc = request.getParameter("opgdesc");
                                    String lol = request.getParameter("proidto");
                                    int proid = Integer.parseInt(lol);
                                    try{
                                        Iserv.CreateOpgave(new Opgave(1, opgnavn, opgdesc), stdnummer, proid);
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }
                        %>
        </form> 
            
                    
              
              
        </form> 
        <br>
        Slet en aftale <br>
        <form method="get">
        Projekt id: <input type="text" name="prodelid"><br>
        Aftale id: <input type="text" name="Afid"><br>
        Opgave id: <input type="text" name="opid"><br>
        <button type="submit" onclick="onButton(prodelid.toString(),.toString())
                    " id="Del aftale" name="Delaftale">Delete Aftale</button>
        <button type="submit" onclick="onButton(prodelid.toString(),.toString())
                    " id="Del opgave" name="Delopgave">Delete Opgave</button>
        <button type="submit" onclick="onButton(prodelid.toString(),.toString())
                    " id="Del projekt" name="DelProjekt">Delete Projekt</button>
        
        
             <%          
                                if(request.getParameter("Delaftale") != null){
                                    String prodelid = request.getParameter("prodelid");
                                    int Projdelete = Integer.parseInt(prodelid);
                                        
                                    String Afid= request.getParameter("Afid");
                                    int Aftaldelete = Integer.parseInt(Afid);
                                
                                    try{
                                        Iserv.DeleteAftale(Aftaldelete, stdnummer, Projdelete );
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }
                                if(request.getParameter("Delopgave") != null){
                                    String prodelid = request.getParameter("prodelid");
                                    int Projdelete = Integer.parseInt(prodelid);
                                        
                                    String Opid= request.getParameter("opid");
                                    int Opgavdelete = Integer.parseInt(Opid);
                                
                                    try{
                                        Iserv.DeleteOpgave(Opgavdelete, stdnummer, Projdelete );
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }
                                if(request.getParameter("DelProjekt") != null){
                                    String prodelid = request.getParameter("prodelid");
                                    int Projdelete = Integer.parseInt(prodelid);
                                      
                                    try{
                                        Iserv.DeleteProjekt(Projdelete);
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }
                        %>
          
        </form>
                        
                 <br>
                        Tilføj et medlem til et Projekt:
                        <form method="get">
                        Projekt id: <input type="text" name="proide"><br>
                        studienummer: <input type="text" name="medist"><br>
                            
                        <button type="submit" onclick="onButton(proide.toString(),medist.toString())
                        " id="create medlem" name="CreMedlem">Tilføj medlem</button>
                            
                        <%          
                                if(request.getParameter("CreMedlem") != null){
                                    String prodelid = request.getParameter("proide");
                                    int projid = Integer.parseInt(prodelid);
                                        
                                    String Afid= request.getParameter("medist");
                                    Afid = Afid.substring(1);
                                    int studie = Integer.parseInt(Afid);
                                
                                    try{
                                        Iserv.AddMedlem(studie, projid);
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                        e.printStackTrace();    
                                    }
                                }
                        %>
                        </form>
                        
                        </form>
                        
                        <br>
                        Fjern et medlem fra et Projekt:
                        <form method="get">
                        Projekt id: <input type="text" name="projide"><br>
                        studienummer: <input type="text" name="medlem"><br>
                            
                        <button type="submit" onclick="onButton(projide.toString(),medlem.toString())
                        " id="create medlem" name="delMedlem">Tilføj medlem</button>
                            
                        <%          
                                if(request.getParameter("delMedlem") != null){
                                    String prodelid = request.getParameter("projide");
                                    int projid = Integer.parseInt(prodelid);
                                        
                                    String Afid= request.getParameter("medlem");
                                    Afid = Afid.substring(1);
                                    int studie = Integer.parseInt(Afid);
                                
                                    try{
                                        Iserv.DeleteMedlem(studie, projid);
                                    }catch(Exception e){
                                        out.println("IKKE OPRETTET AF ÅRSAGER");
                                    }
                                }
                        %>
                        </form>       
      
            </body>
</html>