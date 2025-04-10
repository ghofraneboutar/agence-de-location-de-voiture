package dao;

import entities.Parc;

import java.util.ArrayList;

public interface IDaoParc {
    void ajouterParc(Parc parc);
    void supprimerParc(int code);
    void modifierParc(Parc parc);
    Parc getParc(int id);
    ArrayList<Parc> getParcs();

}
