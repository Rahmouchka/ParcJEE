package entities;

import java.util.Date;

public class Location {
    private int codeLocation;
    private Client client;
    private Voiture voiture;
    private Date date_deb;
    private Date date_fin;

    public Location() {
    }

    public Location(Client client, Voiture voiture, Date date_deb, Date date_fin) {
        this.client = client;
        this.voiture = voiture;
        this.date_deb = date_deb;
        this.date_fin = date_fin;
    }

    public int getCodeLocation() {
        return codeLocation;
    }

    public void setCodeLocation(int codeLocation) {
        this.codeLocation = codeLocation;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Voiture getVoiture() {
        return voiture;
    }

    public void setVoiture(Voiture voiture) {
        this.voiture = voiture;
    }

    public Date getDate_deb() {
        return date_deb;
    }

    public void setDate_deb(Date date_deb) {
        this.date_deb = date_deb;
    }

    public Date getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }
}