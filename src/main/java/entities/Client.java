package entities;

public class Client {
    private int code_client;
    private int ncin;
    private String nom;
    private String prenom;
    private String adresse;
    private int age;
    private int num_permis;
    private String email;
    private int tel;

    public Client(){}
    public Client(int code_client, int ncin, int num_permis, String nom, String prenom, int age, String adresse, int tel, String email) {
        this.code_client = code_client;
        this.ncin = ncin;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.age = age;
        this.num_permis = num_permis;
        this.email = email;
        this.tel = tel;
    }


    public int getNum_permis() {
        return num_permis;
    }

    public void setNum_permis(int num_permis) {
        this.num_permis = num_permis;
    }

    public int getCode_client() {
        return code_client;
    }

    public void setCode_client(int code_client) {
        this.code_client = code_client;
    }

    public int getNcin() {
        return ncin;
    }

    public void setNcin(int ncin) {
        this.ncin = ncin;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }


}
