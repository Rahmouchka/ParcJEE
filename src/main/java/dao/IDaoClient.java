package dao;

import entities.Client;

import java.util.ArrayList;
import java.util.List;

public interface IDaoClient {
    void ajouterClient(Client clt);
    void supprimerClient(int id);
    void modifierClient(Client clt);
    Client getClient(int id);
    ArrayList<Client> getClients();
    Client rechercheByNumCIN(int numCIN);
    Client rechercheByNom(String nom);
}
