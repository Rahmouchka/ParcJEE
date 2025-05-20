package entities;

public class Voiture {
    private int code_voiture;
    private String matricule;
    private String modele;
    private String marque;

    public int getCode_voiture() {
        return code_voiture;
    }

    public Voiture(int code_voiture, String matricule, String modele, String marque, Float kilometrage, Parc parc_id) {
        this.code_voiture = code_voiture;
        this.matricule = matricule;
        this.modele = modele;
        this.marque = marque;
        this.kilometrage = kilometrage;
        this.parc_id = parc_id;
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

    public String getModele() {
        return modele;
    }

    public void setModele(String modele) {
        this.modele = modele;
    }

    public String getMarque() {
        return marque;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public Float getKilometrage() {
        return kilometrage;
    }

    public void setKilometrage(Float kilometrage) {
        this.kilometrage = kilometrage;
    }

    public Parc getParc_id() {
        return parc_id;
    }

    public void setParc_id(Parc parc_id) {
        this.parc_id = parc_id;
    }

    private Float kilometrage;
    private Parc parc_id;
}
