package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.TacheDAOImpl;

import java.io.IOException;

@WebServlet("/DeleteTacheServlet")
public class DeleteTacheServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la tâche à supprimer depuis l'URL
        int idTache = Integer.parseInt(request.getParameter("idTache"));

        // Supprimer la tâche de la base de données
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        tacheDAO.deleteTache(idTache);

        // Rediriger vers la page d'affichage des tâches après la suppression
        response.sendRedirect("afficherTache.jsp");
    }
}

