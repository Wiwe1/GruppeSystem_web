/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Server;

import DALException.DALException;


import java.net.MalformedURLException;
import java.util.List;
import Data.Aftale;
import Data.Bruger;
import Data.Opgave;
import Data.Projekt;
import javax.jws.WebMethod;

/**
 *
 * @author djw
 */
public interface ServerInterface {
    
     @WebMethod public Bruger login(int studienummer, String password)  throws MalformedURLException;
   @WebMethod public List<Projekt> getProjekter(int studienummer) throws DALException;
   @WebMethod public List<Opgave> getOpgaver(int projektnummer, int studienummer)throws DALException;
   @WebMethod public List<Aftale> getAftaler(int projektnummer, int studienummer)throws DALException;
   @WebMethod public boolean CreateAftale(Aftale a, int studienummer, int projektnummer)throws DALException;
   @WebMethod public boolean CreateOpgave(Opgave a, int studienummer, int projektnummer)throws DALException;
   @WebMethod public boolean CreateProjekt(Projekt a, int studienummer)throws DALException;
   @WebMethod public boolean DeleteAftale(Aftale a, int studienummer, int projektnummer)throws DALException;
   @WebMethod public boolean DeleteOpgave(Opgave a, int studienummer, int projektnummer)throws DALException;
@WebMethod public boolean DeleteProjekt(Projekt a, int studienummer)throws DALException;

    
}
