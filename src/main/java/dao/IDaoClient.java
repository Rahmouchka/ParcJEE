package dao;

import entities.Client;

import java.util.ArrayList;
import java.util.List;

public interface IDaoClient {
    public void ajouterClient(Client clt);
    public void supprimerClient(int id);
    public void modifierClient(Client clt);
    Client getClient(int id);
    ArrayList<Client> getClients();
    Client rechercheByNumCIN(int numCIN);
    Client rechercheByNom(String nom);
}
