package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import metier.Tache;


public class TacheDAOImpl implements ITacheDAO {

    private Connection connection;

    public TacheDAOImpl() {
        connection = SingletonConnection.getConnection();
    }

    @Override
    public Tache save(Tache t) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO tache(description, date_debut, date_fin, statut, id_projet) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, t.getDescription());
            ps.setDate(2, new java.sql.Date(t.getDateDebut().getTime()));
            ps.setDate(3, new java.sql.Date(t.getDateFin().getTime()));
            ps.setString(4, t.getStatut());
            ps.setInt(5, t.getProjet().getId_projet());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    @Override
    public List<Tache> findAll() {
        List<Tache> taches = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM tache");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tache tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setDescription(rs.getString("description"));
                tache.setDateDebut(rs.getDate("date_debut"));
                tache.setDateFin(rs.getDate("date_fin"));
                tache.setStatut(rs.getString("statut"));
                // Assuming Projet object is set elsewhere, as fetching it here would require a join
                taches.add(tache);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return taches;
    }

    @Override
    public Tache getTache(int id) {
        Tache tache = null;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM tache WHERE id_tache = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setDescription(rs.getString("description"));
                tache.setDateDebut(rs.getDate("dateDebut"));
                tache.setDateFin(rs.getDate("dateFin"));
                tache.setStatut(rs.getString("statut"));
                // Assuming Projet object is set elsewhere, as fetching it here would require a join
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public Tache update(Tache t) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE tache SET description=?, date_debut=?, date_fin=?, statut=?, id_projet=? WHERE id_tache=?");
            ps.setString(1, t.getDescription());
            ps.setDate(2, new java.sql.Date(t.getDateDebut().getTime()));
            ps.setDate(3, new java.sql.Date(t.getDateFin().getTime()));
            ps.setString(4, t.getStatut());
            ps.setInt(5, t.getProjet().getId_projet());
            ps.setInt(6, t.getId_tache());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    @Override
    public void deleteTache(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM tache WHERE id_tache = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
