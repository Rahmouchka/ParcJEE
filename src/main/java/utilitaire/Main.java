package utilitaire;
import dao.ImpDaoClient;
import entities.Client;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) {
        try {
            Connection cnx = SingletonConnexion.getConnection();

            Client client = new Client(
                    0,
                    12345678,
                    987654321,
                    "Doe",
                    "John",
                    30,
                    "123 Main St",
                    1234567890,
                    "john.doe@example.com"
            );

            // 3. Ajouter le client
            ImpDaoClient daoClient = new ImpDaoClient();
            daoClient.ajouterClient(client);

            System.out.println("Client ajouté avec succès !");

        } catch (Exception e) {
            System.err.println("Erreur lors de l'ajout du client :");
            e.printStackTrace();
        }
    }
}