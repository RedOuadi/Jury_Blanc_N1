package dao;

import java.util.List;
import metier.Ressource;

public interface IRessourceDAO {
    public Ressource save(Ressource r);
    public List<Ressource> findAll();
    public Ressource getRessource(int id);
    public Ressource update(Ressource r);
    public void deleteRessource(int id);
}

