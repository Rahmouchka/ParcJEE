package dao;


import entities.Location;
import utilitaire.SingletonConnexion;
import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImpDaoLocation implements IDaoLocation {
    private Connection con;
    //vaut mieux le déclarer ds le constructeur bich ka tbadel sgbd ma ysirech mochkla

    private ImpDaoClient daoClient=new ImpDaoClient();
    private ImpDaoVoiture daoVoiture=new ImpDaoVoiture();
    public ImpDaoLocation() {
        try {
            this.con = SingletonConnexion.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Échec d'obtention de la connexion", e);
        }
    }
    @Override
    public void ajouterLocation(Location loc) {
        System.out.println(loc.getClient().getCode_client());
        System.out.println(loc.getVoiture().getCode_voiture());
        System.out.println(loc.getDate_deb());
        System.out.println(loc.getDate_fin());
        try (PreparedStatement ps=con.prepareStatement("INSERT INTO location (codeClient, codeVoiture, dateDeb, dateFin) VALUES (?, ?, ?, ?)")){
            ps.setInt(1, loc.getClient().getCode_client());
            ps.setInt(2,loc.getVoiture().getCode_voiture());
            ps.setDate(3, (Date) loc.getDate_deb());
            ps.setDate(4, (Date) loc.getDate_fin());
            ps.executeUpdate();}
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void ajouter(int clt,int voit,Date deb,Date fin) {
        System.out.println(clt);
        System.out.println(voit);
        System.out.println(deb);
        System.out.println(fin);
        try (PreparedStatement ps=con.prepareStatement("INSERT INTO location (codeClient, codeVoiture, dateDeb, dateFin) VALUES (?, ?, ?, ?)")){
            ps.setInt(1, clt);
            ps.setInt(2,voit);
            ps.setDate(3, deb);
            ps.setDate(4, fin);
            ps.executeUpdate();}
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void modifierLocation(Location loc) {
        try (PreparedStatement ps=con.prepareStatement("UPDATE location SET codeClient = ?, codeVoiture = ?, dateDeb = ?,dateFin=? WHERE codeLocation= ?")){
            ps.setInt(1, loc.getClient().getCode_client());
            ps.setInt(2,loc.getVoiture().getCode_voiture());
            ps.setDate(3, (Date) loc.getDate_deb());
            ps.setDate(4, (Date) loc.getDate_fin());
            ps.setInt(5, loc.getCodeLocation());
            ps.executeUpdate();}
        catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Override
    public void supprimerLocation(Location loc) {
        try(PreparedStatement ps=con.prepareStatement("DELETE FROM location WHERE codeLocation = ?")) {
            ps.setInt(1, loc.getCodeLocation());
            ps.executeUpdate();}
        catch (Exception e) {
            e.printStackTrace();
        }

    }
    @Override
    public List<Location> listerLocation() {
        List<Location> locations = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM location")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setCodeLocation(rs.getInt(1));
                loc.setClient(daoClient.getClient(rs.getInt(2)));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt(3)));
                loc.setDate_deb(rs.getDate(4));
                loc.setDate_fin(rs.getDate(5));
                locations.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locations;
    }

    @Override
    public List<Location> getLocalisationByClient(int code_client) {
        List<Location> locations = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM location WHERE codeClient = ?")) {
            ps.setInt(1, code_client);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setCodeLocation(rs.getInt("codeLocation"));
                loc.setClient(daoClient.getClient(rs.getInt("codeClient")));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt("codeVoiture")));
                loc.setDate_deb(rs.getDate("dateDeb"));
                loc.setDate_fin(rs.getDate("dateFin"));
                locations.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locations;
    }
    @Override
    public List<Location> getLocationByVoiture(int code_voiture) {
        List<Location> locations = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM location WHERE codeVoiture = ?")) {
            ps.setInt(1, code_voiture);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setCodeLocation(rs.getInt("codeLocation"));
                loc.setClient(daoClient.getClient(rs.getInt("codeClient")));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt("codeVoiture")));
                loc.setDate_deb(rs.getDate("dateDeb"));
                loc.setDate_fin(rs.getDate("dateFin"));
                locations.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locations;
    }
    @Override
    public List<Location> getLocationByPlageDeDate(Date date_deb, Date date_fin) {
        List<Location> locations = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM location WHERE dateDeb >= ? AND dateFin <= ?")) {
            ps.setDate(1, date_deb);
            ps.setDate(2, date_fin);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setCodeLocation(rs.getInt("codeLocation"));
                loc.setClient(daoClient.getClient(rs.getInt("codeClient")));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt("codeVoiture")));
                loc.setDate_deb(rs.getDate("dateDeb"));
                loc.setDate_fin(rs.getDate("dateFin"));
                locations.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locations;
    }

    @Override
    public Location getLocationByCode(int code) {
        Location loc = new Location();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM location WHERE codeLocation = ?")) {
            ps.setInt(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                loc.setCodeLocation(rs.getInt("codeLocation"));
                loc.setClient(daoClient.getClient(rs.getInt("codeClient")));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt("codeVoiture")));
                loc.setDate_deb(rs.getDate("dateDeb"));
                loc.setDate_fin(rs.getDate("dateFin"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return loc;
    }
    public List<Location> getLocationsEnCours() {
        List<Location> locations = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM location WHERE  CURRENT_DATE BETWEEN dateDeb and dateFin")) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setCodeLocation(rs.getInt("codeLocation"));
                loc.setClient(daoClient.getClient(rs.getInt("codeClient")));
                loc.setVoiture(daoVoiture.getVoiture(rs.getInt("codeVoiture")));
                loc.setDate_deb(rs.getDate("dateDeb"));
                loc.setDate_fin(rs.getDate("dateFin"));
                locations.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return locations;
    }

    public boolean isVoitureDisponible(int voitureId, Date dateDeb, Date dateFin) {
        boolean disponible = true;

        try {
            String sql = "SELECT * FROM location WHERE codeVoiture = ? AND (" +
                    "(? BETWEEN dateDeb AND dateFin) OR " +
                    "(? BETWEEN dateDeb AND dateFin) OR " +
                    "(dateDeb BETWEEN ? AND ?) OR " +
                    "(dateFin BETWEEN ? AND ?))";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, voitureId);
            ps.setDate(2, new java.sql.Date(dateDeb.getTime()));
            ps.setDate(3, new java.sql.Date(dateFin.getTime()));
            ps.setDate(4, new java.sql.Date(dateDeb.getTime()));
            ps.setDate(5, new java.sql.Date(dateFin.getTime()));
            ps.setDate(6, new java.sql.Date(dateDeb.getTime()));
            ps.setDate(7, new java.sql.Date(dateFin.getTime()));

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                disponible = false;
            }



        } catch (Exception e) {
            e.printStackTrace();
        }

        return disponible;
    }

}

