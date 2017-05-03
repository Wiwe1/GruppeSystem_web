<%-- 
    Document   : createproj
    Created on : May 3, 2017, 12:21:31 PM
    Author     : elbosso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%         
            
                                if(request.getParameter(button) != null)
                                String id = request.getParameter("id");
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
    </body>
</html>
