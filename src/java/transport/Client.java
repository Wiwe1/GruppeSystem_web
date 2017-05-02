/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transport;

import transport.ServerInterface;   
import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;

/**
 *
 * @author djw
 */
public class Client {
    
    public Client(){
    
    
    
    }
    
   
     public ServerInterface lol() throws MalformedURLException {
       URL url = new URL("http://ubuntu4.javabog.dk:42072/server?wsdl");
        QName qname = new QName("http://server/", "ServerImplService");
        Service service = Service.create(url, qname);
        ServerInterface ISrv = service.getPort(ServerInterface.class);  
    
        return ISrv;
     } 
}