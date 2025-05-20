package model;

import dao.IDaoClient;
import dao.ImpDaoClient;
import entities.Client;

import java.util.ArrayList;


public class ModelClient {
    private Client client;
    private IDaoClient daoClient;

    // Constructeur avec injection de dépendance
    public ModelClient() {
        this.daoClient = new ImpDaoClient();
    }

    public void add() {
        this.daoClient.ajouterClient(client);
    }

    public void delete() {
        this.daoClient.supprimerClient(client.getCode_client());
    }

    public void update() {
        this.daoClient.modifierClient(client);
    }

    public Client getClient(int id) {
        return daoClient.getClient(id);
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public ArrayList<Client> list() {
        return daoClient.getClients();
    }

}