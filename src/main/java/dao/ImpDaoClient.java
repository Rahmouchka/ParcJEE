package dao;


import entities.Client;
import utilitaire.SingletonConnexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ImpDaoClient implements IDaoClient {
    private Connection con;
    //vaut mieux le déclarer ds le constructeur bich ka tbadel sgbd ma ysirech mochkla
    public ImpDaoClient() {
        try {
            this.con = SingletonConnexion.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Échec d'obtention de la connexion", e);
        }
    }
    @Override
    public void ajouterClient(Client client) {
        try {
            PreparedStatement query = con.prepareStatement("insert into client values (null,?,?,?,?,?,?,?,?)");
            query.setInt(1, client.getNcin());
            query.setString(2, client.getNom());
            query.setString(3, client.getPrenom());
            query.setInt(4, client.getAge());
            query.setString(5, client.getAdresse());
            query.setInt(6, client.getNum_permis());
            query.setString(7, client.getEmail());
            query.setInt(8, client.getTel());
            query.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de l'ajout du client", e);
        }

    }

    @Override
    public void supprimerClient(int id) {
        try {
            PreparedStatement query = con.prepareStatement("delete from client where codeclient=?");
            query.setInt(1, id);
            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la suppression du client", e);
        }
    }

    @Override
    public void modifierClient(Client client) {
        try {
            PreparedStatement query = con.prepareStatement("update client set cin=?,nom=?, prenom=?,age=?,adresse=?,numPermis=?,email=?,tel=? where cin=?");
            query.setInt(1, client.getNcin());
            query.setString(2, client.getNom());
            query.setString(3, client.getPrenom());
            query.setInt(4, client.getAge());
            query.setString(5, client.getAdresse());
            query.setInt(6, client.getNum_permis());
            query.setString(7, client.getEmail());
            query.setInt(8, client.getTel());
            query.setInt(9, client.getNcin());
            query.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la modification du client", e);
        }
    }
    @Override
    public Client getClient(int id) {

        try {
            PreparedStatement query = con.prepareStatement("select * from client where codeClient=?");
            query.setInt(1, id);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                return new Client(
                        rs.getInt("codeclient"),
                        rs.getInt("cin"),
                        rs.getInt("numpermis"),
                        rs.getString("nom"),
                        rs.getString("prenom"),
                        rs.getInt("age"),
                        rs.getString("adresse"),
                        rs.getInt("tel"),
                        rs.getString("email")
                );
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    public ArrayList<Client> getClients() {

        ArrayList<Client> clients = new ArrayList<>();
        try {
            PreparedStatement query = con.prepareStatement("select * from client");
            ResultSet rs = query.executeQuery();
            while (rs.next()) {
                clients.add(new Client(
                        rs.getInt("codeclient"),
                        rs.getInt("cin"),
                        rs.getInt("numpermis"),
                        rs.getString("nom"),
                        rs.getString("prenom"),
                        rs.getInt("age"),
                        rs.getString("adresse"),
                        rs.getInt("tel"),
                        rs.getString("email")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return clients;
    }
    @Override
    public Client rechercheByNumCIN(int numCIN) {
        Client client = new Client();
        try {
            PreparedStatement query = con.prepareStatement("select * from client where cin=?");
            query.setInt(1, numCIN);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                client.setNcin(rs.getInt("cin"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setAge(rs.getInt("age"));
                client.setAdresse(rs.getString("adresse"));
                client.setNum_permis(rs.getInt("numpermis"));
                client.setEmail(rs.getString("email"));
                client.setTel(rs.getInt("tel"));
                client.setCode_client(rs.getInt("codeclient"));
            }
            return client;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Client rechercheByNom(String nom) {
        Client client = new Client();
        try {
            PreparedStatement query = con.prepareStatement("select * from client where nom=?");
            query.setString(1, nom);
            ResultSet rs = query.executeQuery();
            if (rs.next()) {
                client.setNcin(rs.getInt("cin"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setAge(rs.getInt("age"));
                client.setAdresse(rs.getString("adresse"));
                client.setNum_permis(rs.getInt("numpermis"));
                client.setEmail(rs.getString("email"));
                client.setTel(rs.getInt("tel"));
                client.setCode_client(rs.getInt("codeclient"));

            }
            return client;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

