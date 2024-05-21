package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import metier.Projet;


public class ProjetDAOImpl implements IProjetDAO {

    private Connection connection;

    public ProjetDAOImpl() {
        connection = SingletonConnection.getConnection();
    }

    @Override
    public Projet save(Projet p) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO projet(nom, description, date_debut, date_fin, budget) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, p.getNom());
            ps.setString(2, p.getDescription());
            ps.setDate(3, new java.sql.Date(p.getDateDebut().getTime()));
            ps.setDate(4, new java.sql.Date(p.getDateFin().getTime()));
            ps.setDouble(5, p.getBudget());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public List<Projet> findAll() {
        List<Projet> projets = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM projet");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Projet projet = new Projet();
                projet.setId_projet(rs.getInt("id_projet"));
                projet.setNom(rs.getString("nom"));
                projet.setDescription(rs.getString("description"));
                projet.setDateDebut(rs.getDate("date_debut"));
                projet.setDateFin(rs.getDate("date_fin"));
                projet.setBudget(rs.getDouble("budget"));
                projets.add(projet);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projets;
    }

    @Override
    public Projet getProjet(int id) {
        Projet projet = null;
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM projet WHERE id_projet = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                projet = new Projet();
                projet.setId_projet(rs.getInt("id_projet"));
                projet.setNom(rs.getString("nom"));
                projet.setDescription(rs.getString("description"));
                projet.setDateDebut(rs.getDate("date_debut"));
                projet.setDateFin(rs.getDate("date_fin"));
                projet.setBudget(rs.getDouble("budget"));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projet;
    }

    @Override
    public Projet update(Projet p) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE projet SET nom=?, description=?, date_debut=?, date_fin=?, budget=? WHERE id_projet=?");
            ps.setString(1, p.getNom());
            ps.setString(2, p.getDescription());
            ps.setDate(3, new java.sql.Date(p.getDateDebut().getTime()));
            ps.setDate(4, new java.sql.Date(p.getDateFin().getTime()));
            ps.setDouble(5, p.getBudget());
            ps.setInt(6, p.getId_projet());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    @Override
    public void deleteProjet(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM projet WHERE id_projet = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
