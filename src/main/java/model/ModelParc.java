package model;



import dao.IDaoParc;
import dao.ImpDaoParc;
import entities.Parc;

import java.util.ArrayList;


public class ModelParc {
    private Parc parc;
    private IDaoParc daoParc;

    // Constructeur avec injection de dépendance
    public ModelParc() {
        this.daoParc = new ImpDaoParc();
    }

    public Parc getParc() {
        return parc;
    }

    public ArrayList<Parc> getParcs() {
        return this.daoParc.getParcs();
    }

    public void setParc(Parc parc) {
        this.parc = parc;
    }

    public Parc getParc(int code) {
        return this.daoParc.getParc(code);
    }

    public ArrayList<Parc> list(){
        return this.daoParc.getParcs();
    }

    public void add() {
        this.daoParc.ajouterParc(this.parc);
    }

    public void update() {
        this.daoParc.modifierParc(this.parc);
    }

    public void delete() {
        this.daoParc.supprimerParc(this.parc.getNum_parc());
    }

}