package web;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import metier.Ressource;
import dao.RessourceDAOImpl;

@WebServlet("/EditRessourceResponseServlet")
public class editRessourceResponseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        int idRessource = Integer.parseInt(request.getParameter("id_ressource"));
        String nom = request.getParameter("nom");
        String type = request.getParameter("type");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String fournisseur = request.getParameter("fournisseur");
        int idTache = Integer.parseInt(request.getParameter("id_tache"));

        // Créer un objet Ressource avec les informations mises à jour
        Ressource updatedRessource = new Ressource();
        updatedRessource.setId_ressource(idRessource);
        updatedRessource.setNom(nom);
        updatedRessource.setType(type);
        updatedRessource.setQuantite(quantite);
        updatedRessource.setFournisseur(fournisseur);
        updatedRessource.setId_tache(idTache);

        // Mettre à jour la ressource en utilisant DAO
        RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
        ressourceDAO.update(updatedRessource);

        // Rediriger vers la page de gestion des ressources de la tâche
        response.sendRedirect("afficherRessource.jsp?idTache=" + idTache);
    }
}
