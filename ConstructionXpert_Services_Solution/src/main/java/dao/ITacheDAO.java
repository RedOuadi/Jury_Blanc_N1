package dao;

import java.util.List;
import metier.Tache;

public interface ITacheDAO {
    public Tache save(Tache t);
    public List<Tache> findAll();
    public Tache getTache(int id);
    public Tache update(Tache t);
    public void deleteTache(int id);
}

