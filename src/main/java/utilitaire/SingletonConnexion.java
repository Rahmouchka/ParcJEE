package utilitaire;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class SingletonConnexion {
    private static Connection con;
    static {
        try {
            Class.forName("org.mariadb.jdbc.Driver"); // Chargement explicite du driver
            con = DriverManager.getConnection(
                    "jdbc:mariadb://localhost:3307/gestionlocationvoitures",
                    "root",
                    "");
            System.out.println("Connexion établie avec succès !");
        } catch (Exception e) {
            System.err.println("Échec de la connexion à la base de données !");
            e.printStackTrace();
            con = null; // Explicitement null en cas d'échec
        }
    }

    public static Connection getConnection() throws SQLException {
        if (con == null || con.isClosed()) {
            // Tentative de reconnexion
            try {
                con = DriverManager.getConnection(
                        "jdbc:mariadb://localhost:3307/gestionlocationvoitures",
                        "root",
                        "");
            } catch (SQLException e) {
                throw new SQLException("Échec de la reconnexion à la base de données", e);
            }
        }
        return con;
    }

}
