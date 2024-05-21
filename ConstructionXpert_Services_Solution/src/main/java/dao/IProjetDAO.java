package dao;

import java.util.List;
import metier.Projet;

public interface IProjetDAO {
    public Projet save(Projet p);
    public List<Projet> findAll();
    public Projet getProjet(int id);
    public Projet update(Projet p);
    public void deleteProjet(int id);
}

