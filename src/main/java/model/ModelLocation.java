package model;

import dao.IDaoLocation;
import dao.ImpDaoLocation;
import entities.Location;

import java.sql.Date;
import java.util.List;



public class ModelLocation {
    private Location location;
    private IDaoLocation daoLocation;

    // Constructeur avec injection de dépendance
    public ModelLocation() {
        this.daoLocation = new ImpDaoLocation();
    }

    public void setLocation(Location loc) {
        this.location = loc;

    }

    public void ajouterLocation() {
        this.daoLocation.ajouterLocation(location);

    }
    public Location getLocationByCode(int code) {
        return daoLocation.getLocationByCode(code);
    }
    public void supprimerLocation() {
        this.daoLocation.supprimerLocation(location);}

    public void modifierLocation() {
        this.daoLocation.modifierLocation(location);
    }
    public List<Location> getLocations(){
        return daoLocation.listerLocation();
    }
    public List<Location>getLocationsCourrante(){
        return daoLocation.getLocationsEnCours();
    }
    public boolean isVoitureDisponible(int voitureId, Date dateDeb, Date dateFin) {
        return daoLocation.isVoitureDisponible(voitureId, dateDeb, dateFin);
    }
    public void ajouter (int clt,int voit ,Date deb,Date fin) {
        this.daoLocation.ajouter(clt, voit, deb, fin);
    }
    public List<Location> getLocationByClient(int code){
        return daoLocation.getLocalisationByClient(code);
    }
}