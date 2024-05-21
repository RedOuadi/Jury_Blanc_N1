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
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO ressource(nom, type, quantite, fournisseur) VALUES (?, ?, ?, ?)");
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getFournisseur());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public List<Ressource> findAll() {
        List<Ressource> ressources = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM ressource");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ressource ressource = new Ressource();
                ressource.setId_ressource(rs.getInt("id_ressource"));
                ressource.setNom(rs.getString("nom"));
                ressource.setType(rs.getString("type"));
                ressource.setQuantite(rs.getInt("quantite"));
                ressource.setFournisseur(rs.getString("fournisseur"));
                ressources.add(ressource);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ressources;
    }

    @Override
    public Ressource getRessource(int id) {
        Ressource ressource = null;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM ressource WHERE id_ressource = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ressource = new Ressource();
                ressource.setId_ressource(rs.getInt("id_ressource"));
                ressource.setNom(rs.getString("nom"));
                ressource.setType(rs.getString("type"));
                ressource.setQuantite(rs.getInt("quantite"));
                ressource.setFournisseur(rs.getString("fournisseur"));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ressource;
    }

    @Override
    public Ressource update(Ressource r) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE ressource SET nom=?, type=?, quantite=?, fournisseur=? WHERE id_ressource=?");
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getFournisseur());
            ps.setInt(5, r.getId_ressource());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public void deleteRessource(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM ressource WHERE id_ressource = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
