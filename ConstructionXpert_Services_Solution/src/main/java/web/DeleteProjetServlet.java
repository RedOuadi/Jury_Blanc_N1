package web;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ProjetDAOImpl;

import java.io.IOException;

@WebServlet("/DeleteProjetServlet")
public class DeleteProjetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID du projet à supprimer depuis l'URL
        int idProjet = Integer.parseInt(request.getParameter("idProjet"));

        // Supprimer le projet de la base de données
        ProjetDAOImpl projetDAO = new ProjetDAOImpl();
        projetDAO.deleteProjet(idProjet);

        // Rediriger vers la page d'affichage des projets après la suppression
        response.sendRedirect("afficherProjet.jsp");
    }
}

