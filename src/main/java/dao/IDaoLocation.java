package dao;

import entities.Location;

import java.sql.Date;
import java.util.List;

public interface IDaoLocation {
    public void ajouterLocation(Location loc);
    public void modifierLocation(Location loc);
    public void supprimerLocation(Location loc);
    public List<Location> listerLocation();
    public Location getLocationByCode(int code);
    public List<Location> getLocalisationByClient(int code_client);
    public List<Location> getLocationByVoiture(int code_voiture);
    public List<Location> getLocationByPlageDeDate(Date date_deb, Date date_fin);
    public List<Location> getLocationsEnCours();
    public boolean isVoitureDisponible(int voitureId, Date dateDeb, Date dateFin);
    public void ajouter(int clt,int voit ,Date deb,Date fin);
}
