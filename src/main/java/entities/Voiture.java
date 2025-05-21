package entities;

public class Voiture {
    private int code_voiture;
    private String matricule;
    private String marque;
    private String modele;
    private float kilometrage;
    private Parc parc;
    private String image; // Added image attribute

    public Voiture(int code_voiture, String matricule, String marque, String modele, float kilometrage, Parc parc, String image) {
        this.code_voiture = code_voiture;
        this.matricule = matricule;
        this.marque = marque;
        this.modele = modele;
        this.kilometrage = kilometrage;
        this.parc = parc;
        this.image = image;
    }

    public Voiture() {
    }

    public Voiture(int codeVoiture, String matricule, String marque, String modele, float kilometrage, Parc parc) {
    }

    public int getCode_voiture() {
        return code_voiture;
    }

    public void setCode_voiture(int code_voiture) {
        this.code_voiture = code_voiture;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public String getModele() {
        return modele;
    }

    public void setModele(String modele) {
        this.modele = modele;
    }

    public float getKilometrage() {
        return kilometrage;
    }

    public void setKilometrage(float kilometrage) {
        this.kilometrage = kilometrage;
    }

    public Parc getParc() {
        return parc;
    }

    public void setParc(Parc parc) {
        this.parc = parc;
    }

    public String getImageUrl() {
        return image;
    }

    public void setImageUrl(String imageUrl) {
        this.image = imageUrl;
    }
}