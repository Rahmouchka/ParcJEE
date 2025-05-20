package dao;

import entities.Parc;
import utilitaire.SingletonConnexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImpDaoParc implements IDaoParc {
    private Connection con;
    //vaut mieux le déclarer ds le constructeur bich ka tbadel sgbd ma ysirech mochkla
    public ImpDaoParc() {
        try {
            this.con = SingletonConnexion.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Échec d'obtention de la connexion", e);
        }
    }

    @Override
    public void ajouterParc(Parc parc) {
        try {
            PreparedStatement query = this.con.prepareStatement("insert into parc values(null,?,?,?)");
            query.setString(1, parc.getLibelle());
            query.setInt(2, parc.getCapacite());
            query.setString(3, parc.getLocalisation());
            query.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void supprimerParc(int code) {
        try {
            PreparedStatement query = this.con.prepareStatement("delete from parc where codeParc=?");
            query.setInt(1, code);
            query.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void modifierParc(Parc parc) {
        try {
            PreparedStatement query = this.con.prepareStatement("update parc set libelle=?,capacite=?,localisation=? where codeParc=?");
            query.setString(1, parc.getLibelle());
            query.setInt(2, parc.getCapacite());
            query.setString(3, parc.getLocalisation());
            query.setInt(4, parc.getNum_parc());
            query.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Parc getParc(int id) {
        try {
            PreparedStatement query = con.prepareStatement("select * from parc where codeParc=?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                return new Parc(rs.getInt("codeParc"),rs.getString("libelle"),rs.getInt("capacite"),rs.getString("localisation"));
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ArrayList<Parc> getParcs() {
        ArrayList<Parc> parcs = new ArrayList<>();

        try (PreparedStatement query = this.con.prepareStatement("select * from parc")) {
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                Parc parc = new Parc();
                parc.setLibelle(rs.getString("libelle"));
                parc.setCapacite(rs.getInt("capacite"));
                parc.setLocalisation(rs.getString("localisation"));
                parc.setNum_parc(rs.getInt("codeParc"));
                parcs.add(parc);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return parcs;
    }

}

