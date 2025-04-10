package model;

import dao.IDaoVoiture;
import dao.ImpIDaoVoiture;
import entities.Voiture;

import java.util.List;

public class ModelVoiture {
    private Voiture voiture;
    private IDaoVoiture daoVoiture;
    public ModelVoiture() {
        this.daoVoiture=new ImpIDaoVoiture();
    }
    public Voiture getVoiture() {
        return voiture;
    }
    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }

    public void add(Voiture voiture) {
        this.daoVoiture.ajouterVoiture(voiture);
    }
    public void update(Voiture voiture) {
        this.daoVoiture.modifierVoiture(voiture);
    }
    public void delete(Voiture voiture) {
        this.daoVoiture.supprimerVoiture(voiture.getCode_voiture());
    }
    public Voiture getVoiture(int id) {
        return this.daoVoiture.getVoiture(id);
    }
    public List<Voiture> getVoitures() {
        return this.daoVoiture.getVoitures();
    }
}
