package web;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.RessourceDAOImpl;

@WebServlet("/DeleteRessourceServlet")
public class DeleteRessourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la ressource à supprimer depuis l'URL
        int idRessource = Integer.parseInt(request.getParameter("idRessource"));

        // Supprimer la ressource de la base de données
        RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
        ressourceDAO.deleteRessource(idRessource);

        // Rediriger vers la page d'affichage des ressources après la suppression
        response.sendRedirect("afficherRessource.jsp");
    }
}
