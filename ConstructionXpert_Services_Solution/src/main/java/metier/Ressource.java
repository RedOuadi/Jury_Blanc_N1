package metier;



public class Ressource {
    private int id_ressource;
    private String nom;
    private String type;
    private int quantite;
    private String fournisseur;

    private int id_tache;

    // Getters and setters
    public int getId_ressource() {
        return id_ressource;
    }

    public void setId_ressource(int id_ressource) {
        this.id_ressource = id_ressource;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }


    public void setFournisseur(String fournisseur) {
        this.fournisseur = fournisseur;
    }

    public String getFournisseur() {
        return fournisseur;
    }



    public int getId_tache() {
        return id_tache;
    }

    public void setId_tache(int id_tache) {
        this.id_tache = id_tache;
    }

}

