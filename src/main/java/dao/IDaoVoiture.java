package dao;


import entities.Voiture;

import java.util.ArrayList;
import java.util.List;

public interface IDaoVoiture {
    void ajouterVoiture(Voiture voiture);

    void supprimerVoiture(int id);

    ArrayList<Voiture> getVoitures();

    Voiture getVoiture(int id);

    Voiture getVoitureByMatricule(String mat);

    List<Voiture> getVoituresDisponibles();

    void modifierVoiture(Voiture voiture);
}
