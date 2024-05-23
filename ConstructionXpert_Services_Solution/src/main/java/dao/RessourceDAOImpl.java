package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import metier.Ressource;

public class RessourceDAOImpl implements IRessourceDAO {

    private Connection connection;

    public RessourceDAOImpl() {
        connection = SingletonConnection.getConnection();
    }

    @Override
    public Ressource save(Ressource r) {
        String query = "INSERT INTO ressource (nom, type, quantite, fournisseur, id_tache) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getFournisseur());
            ps.setInt(5, r.getId_tache());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                r.setId_ressource(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public List<Ressource> findAll() {
        List<Ressource> ressources = new ArrayList<>();
        String query = "SELECT * FROM ressource";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ressource r = new Ressource();
                r.setId_ressource(rs.getInt("id_ressource"));
                r.setNom(rs.getString("nom"));
                r.setType(rs.getString("type"));
                r.setQuantite(rs.getInt("quantite"));
                r.setFournisseur(rs.getString("fournisseur"));
                r.setId_tache(rs.getInt("id_tache"));
                ressources.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ressources;
    }

    @Override
    public Ressource getRessource(int id) {
        Ressource r = null;
        String query = "SELECT * FROM ressource WHERE id_ressource=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r = new Ressource();
                r.setId_ressource(rs.getInt("id_ressource"));
                r.setNom(rs.getString("nom"));
                r.setType(rs.getString("type"));
                r.setQuantite(rs.getInt("quantite"));
                r.setFournisseur(rs.getString("fournisseur"));
                r.setId_tache(rs.getInt("id_tache"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public Ressource update(Ressource r) {
        String query = "UPDATE ressource SET nom=?, type=?, quantite=?, fournisseur=?, id_tache=? WHERE id_ressource=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getFournisseur());
            ps.setInt(5, r.getId_tache());
            ps.setInt(6, r.getId_ressource());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public void deleteRessource(int id) {
        String query = "DELETE FROM ressource WHERE id_ressource=?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

