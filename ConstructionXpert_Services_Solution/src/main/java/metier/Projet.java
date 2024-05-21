package metier;

import java.util.Date;
import java.util.List;

public class Projet {
    private int id_projet;
    private String nom;
    private String description;
    private Date dateDebut;
    private Date dateFin;
    private double budget;
    private List<Tache> taches;

    // Constructor
    public Projet() {}

    public Projet(int id_projet, String nom, String description, Date dateDebut, Date dateFin, double budget) {
        this.id_projet = id_projet;
        this.nom = nom;
        this.description = description;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.budget = budget;
    }

    // Getters and setters
    public int getId_projet() {
        return id_projet;
    }

    public void setId_projet(int id_projet) {
        this.id_projet = id_projet;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }

    public List<Tache> getTaches() {
        return taches;
    }

    public void setTaches(List<Tache> taches) {
        this.taches = taches;
    }


    @Override
    public String toString() {
        return "Projet{" +
                "id_projet=" + id_projet +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", dateDebut=" + dateDebut +
                ", dateFin=" + dateFin +
                ", budget=" + budget +
                '}';
    }
}


