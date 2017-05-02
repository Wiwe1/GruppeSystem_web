/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transport;

import DALException.DALException;
import DTO.Aftale;
import DTO.Bruger;
import DTO.Opgave;
import DTO.Projekt;
import java.net.MalformedURLException;
import java.util.List;


public class ServerInterfaceImpl implements ServerInterface {

    @Override
    public Bruger login(int studienummer, String password) throws MalformedURLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Projekt> getProjekter(int studienummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Opgave> getOpgaver(int projektnummer, int studienummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Aftale> getAftaler(int projektnummer, int studienummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean CreateAftale(Aftale a, int studienummer, int projektnummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean CreateOpgave(Opgave a, int studienummer, int projektnummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean CreateProjekt(Projekt a, int studienummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean DeleteAftale(Aftale a, int studienummer, int projektnummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean DeleteOpgave(Opgave a, int studienummer, int projektnummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean DeleteProjekt(Projekt a, int studienummer) throws DALException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
