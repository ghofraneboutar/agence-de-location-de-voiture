package dao;

import entities.Voiture;

import java.util.ArrayList;

public interface IDaoVoiture {
    void ajouterVoiture(Voiture voiture);

    void supprimerVoiture(int id);

    ArrayList<Voiture> getVoitures();

    Voiture getVoiture(int id);

    void modifierVoiture(Voiture voiture);

}
