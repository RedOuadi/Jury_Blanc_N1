package web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.RessourceDAOImpl;
import metier.Ressource;

@WebServlet("/DeleteRessourceServlet")
public class DeleteRessourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la ressource à supprimer depuis l'URL
        int idRessource = Integer.parseInt(request.getParameter("idRessource"));

        // Récupérer la ressource pour obtenir le idTache
        RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
        Ressource ressource = ressourceDAO.getRessource(idRessource);
        int idTache = ressource.getId_tache();

        // Supprimer la ressource de la base de données
        ressourceDAO.deleteRessource(idRessource);

        // Rediriger vers la page d'affichage des ressources avec le idTache comme paramètre
        response.sendRedirect("afficherRessource.jsp?idTache=" + idTache);
    }
}

