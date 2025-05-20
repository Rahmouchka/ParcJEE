package entities;

import java.util.Date;

public class Location {
    private Client client_id;
    private Voiture Voiture_id;
    private Date date_deb;

    public Date getDate_fin() {
        return date_fin;
    }

    public Location(Client client_id, Voiture voiture_id, Date date_deb, Date date_fin) {
        this.client_id = client_id;
        Voiture_id = voiture_id;
        this.date_deb = date_deb;
        this.date_fin = date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public Date getDate_deb() {
        return date_deb;
    }

    public void setDate_deb(Date date_deb) {
        this.date_deb = date_deb;
    }

    public Voiture getVoiture_id() {
        return Voiture_id;
    }

    public void setVoiture_id(Voiture voiture_id) {
        Voiture_id = voiture_id;
    }

    public Client getClient_id() {
        return client_id;
    }

    public void setClient_id(Client client_id) {
        this.client_id = client_id;
    }

    private Date date_fin;
}
