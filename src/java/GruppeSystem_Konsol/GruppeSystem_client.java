/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GruppeSystem_Konsol;

import Server.ServerInterface;
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

/**
 *
 * @author djw
 */
public class GruppeSystem_client {
    
    public GruppeSystem_client(){
    
    
    
    }
    
   
     public ServerInterface lol() throws MalformedURLException {
       URL url = new URL("http://[::]:8080/server");
        QName qname = new QName("http://Server/", "GruppeSysImplService");
        Service service = Service.create(url, qname);
    ServerInterface ISrv = service.getPort(ServerInterface.class);
    
        return ISrv;
     } 
}
