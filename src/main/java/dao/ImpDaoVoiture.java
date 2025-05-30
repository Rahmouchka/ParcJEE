package dao;


import entities.Parc;
import entities.Voiture;
import utilitaire.SingletonConnexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImpDaoVoiture implements IDaoVoiture {
    private Connection con;
    //vaut mieux la déclarer ds le constructeur bich ka tbadel sgbd ma tsirech mochkla

    private ImpDaoParc daoParc = new ImpDaoParc();

    public ImpDaoVoiture() {
        try {
            this.con = SingletonConnexion.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Échec d'obtention de la connexion", e);
        }
    }
    @Override
    public void ajouterVoiture(Voiture voiture) {
        try {
            PreparedStatement query = con.prepareStatement("insert into voiture values(null,?,?,?,?,?)");
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }

    @Override
    public void supprimerVoiture(int id) {
        try {
            PreparedStatement query = con.prepareStatement("delete from voiture where codeVoiture=?");
            query.setInt(1, id);
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public ArrayList<Voiture> getVoitures() {
        ArrayList<Voiture> voitures = new ArrayList<>();
        try {
            PreparedStatement query = con.prepareStatement("select * from voiture");
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                Parc parc = new Parc();
                parc = daoParc.getParc(rs.getInt("codeParc"));
                Voiture voiture = new Voiture();
                voiture.setCode_voiture(rs.getInt("codeVoiture"));
                voiture.setMatricule(rs.getString("matricule"));
                voiture.setModele(rs.getString("modele"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setKilometrage(rs.getFloat("kilometrage"));
                voiture.setParc(parc);
                voitures.add(voiture);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voitures;
    }
    @Override
    public Voiture getVoitureByMatricule(String mat) {
        try {
            PreparedStatement query = con.prepareStatement("select * from voiture where matricule=?");
            query.setString(1, mat);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {

                Parc parc;
                parc = daoParc.getParc(rs.getInt("codeParc"));


                return new Voiture(rs.getInt("codeVoiture"),rs.getString("matricule"),rs.getString("marque"),rs.getString("modele"),rs.getFloat("kilometrage"),parc);
            }else{
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public Voiture getVoiture(int id) {

        try {
            PreparedStatement query = con.prepareStatement("select * from voiture where codeVoiture=?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {

                Parc parc;
                parc = daoParc.getParc(rs.getInt("codeParc"));


                return new Voiture(rs.getInt("codeVoiture"),rs.getString("matricule"),rs.getString("marque"),rs.getString("modele"),rs.getFloat("kilometrage"),parc);
            }else{
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Voiture> getVoituresDisponibles() {
        List<Voiture> voitures = new ArrayList<>();
        String sql = "SELECT * FROM voiture WHERE codeVoiture NOT IN (" +
                "SELECT codeVoiture FROM location WHERE dateDeb <= CURRENT_DATE AND dateFin >= CURRENT_DATE)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voiture voiture = new Voiture();
                voiture.setCode_voiture(rs.getInt("codeVoiture"));
                voiture.setMatricule(rs.getString("matricule"));
                voiture.setModele(rs.getString("modele"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setKilometrage(rs.getFloat("kilometrage"));
                voiture.setParc(daoParc.getParc(rs.getInt("codeParc")));
                voitures.add(voiture);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return voitures;
    }

    @Override
    public void modifierVoiture(Voiture voiture) {
        try {
            PreparedStatement query = this.con.prepareStatement("update voiture set matricule=?,modele=? ,marque=?,kilometrage=? ,codeParc=? where codeVoiture=?");
            query.setString(1, voiture.getMatricule());
            query.setString(2, voiture.getModele());
            query.setString(3, voiture.getMarque());
            query.setFloat(4, voiture.getKilometrage());
            query.setInt(5, voiture.getParc().getNum_parc());
            query.setInt(6, voiture.getCode_voiture());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}

