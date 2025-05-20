package entities;

public class Parc {
    private int num_parc;
    private String libelle;
    private int capacite;
    private String localisation;

    public Parc(){}

    public Parc(int num_parc, String libelle, int capacite, String localisation) {
        this.num_parc = num_parc;
        this.libelle = libelle;
        this.capacite = capacite;
        this.localisation = localisation;
    }
    public int getNum_parc() {
        return num_parc;
    }
    public void setNum_parc(int num_parc) {
        this.num_parc = num_parc;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public int getCapacite() {
        return capacite;
    }

    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }
}

