package dao;

import entities.Location;

import java.sql.Date;
import java.util.List;

public interface IDaoLocation {
    void ajouterLocation(Location loc);
    void modifierLocation(Location loc);
    void supprimerLocation(Location loc);
    List<Location> listerLocation();
    Location getLocationByCode(int code);
    List<Location> getLocalisationByClient(int code_client);
    List<Location> getLocationByVoiture(int code_voiture);
    List<Location> getLocationByPlageDeDate(Date date_deb, Date date_fin);
    List<Location> getLocationsEnCours();
    boolean isVoitureDisponible(int voitureId, Date dateDeb, Date dateFin);
    void ajouter(int clt,int voit ,Date deb,Date fin);
}
