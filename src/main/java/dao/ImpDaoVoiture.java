package dao;


import utilitaire.SingletonConnexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImpDaoVoiture implements IDaoVoiture {
    private Connection con;
    //vaut mieux le déclarer ds le constructeur bich ka tbadel sgbd ma ysirech mochkla
    public ImpDaoVoiture() {
        try {
            this.con = SingletonConnexion.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException("Échec d'obtention de la connexion", e);
        }
    }
}

