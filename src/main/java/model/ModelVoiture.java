package model;

import dao.IDaoVoiture;
import dao.ImpIDaoVoiture;
import entities.Voiture;

import java.util.List;

public class ModelVoiture {
    private Voiture voiture;
    private IDaoVoiture daoVoiture;

    public ModelVoiture() {
        this.daoVoiture = new ImpIDaoVoiture();
    }

    public Voiture getVoiture() {
        return voiture;
    }

    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }

    public void add() {
        this.daoVoiture.ajouterVoiture(voiture);
    }

    public void update() {
        this.daoVoiture.modifierVoiture(voiture);
    }

    public void delete() {
        this.daoVoiture.supprimerVoiture(voiture.getCode_voiture());
    }

    public Voiture getVoiture(int id) {
        return this.daoVoiture.getVoiture(id);
    }

    public List<Voiture> list() {
        return this.daoVoiture.getVoitures();
    }
}
