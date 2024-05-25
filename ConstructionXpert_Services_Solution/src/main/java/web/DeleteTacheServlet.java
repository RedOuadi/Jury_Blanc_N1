package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.TacheDAOImpl;
import metier.Tache;

import java.io.IOException;

@WebServlet("/DeleteTacheServlet")
public class DeleteTacheServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la tâche à supprimer depuis l'URL
        int idTache = Integer.parseInt(request.getParameter("idTache"));

        // Récupérer la tâche pour obtenir le projectId
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        Tache tache = tacheDAO.getTache(idTache);
        int projectId = tache.getId_projet();

        // Supprimer la tâche de la base de données
        tacheDAO.deleteTache(idTache);

        // Rediriger vers la page d'affichage des tâches avec le projectId comme paramètre
        response.sendRedirect("afficherTache.jsp?projectId=" + projectId);
    }
}


