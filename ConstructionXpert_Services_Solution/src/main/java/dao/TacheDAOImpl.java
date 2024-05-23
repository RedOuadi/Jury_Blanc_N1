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
    public Tache save(Tache tache) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO Tache (description, dateDebut, dateFin, statut, id_projet) VALUES (?, ?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, tache.getDescription());
            ps.setDate(2, new java.sql.Date(tache.getDateDebut().getTime()));
            ps.setDate(3, new java.sql.Date(tache.getDateFin().getTime()));
            ps.setString(4, tache.getStatut());
            ps.setInt(5, tache.getId_projet());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                tache.setId_tache(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public List<Tache> findAll() {
        List<Tache> taches = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Tache");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tache tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setDescription(rs.getString("description"));
                tache.setDateDebut(rs.getDate("dateDebut"));
                tache.setDateFin(rs.getDate("dateFin"));
                tache.setStatut(rs.getString("statut"));
                tache.setId_projet(rs.getInt("id_projet"));
                taches.add(tache);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return taches;
    }

    @Override
    public Tache getTache(int id) {
        Tache tache = null;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Tache WHERE id_tache = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tache = new Tache();
                tache.setId_tache(rs.getInt("id_tache"));
                tache.setDescription(rs.getString("description"));
                tache.setDateDebut(rs.getDate("dateDebut"));
                tache.setDateFin(rs.getDate("dateFin"));
                tache.setStatut(rs.getString("statut"));
                tache.setId_projet(rs.getInt("id_projet"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public Tache update(Tache tache) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "UPDATE Tache SET description = ?, dateDebut = ?, dateFin = ?, statut = ?, id_projet = ? WHERE id_tache = ?"
            );
            ps.setString(1, tache.getDescription());
            ps.setDate(2, new java.sql.Date(tache.getDateDebut().getTime()));
            ps.setDate(3, new java.sql.Date(tache.getDateFin().getTime()));
            ps.setString(4, tache.getStatut());
            ps.setInt(5, tache.getId_projet());
            ps.setInt(6, tache.getId_tache());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    @Override
    public void deleteTache(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM Tache WHERE id_tache = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


