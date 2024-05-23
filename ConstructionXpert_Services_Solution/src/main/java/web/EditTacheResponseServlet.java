package web;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Tache;
import dao.TacheDAOImpl;

@WebServlet("/EditTacheResponseServlet")
public class EditTacheResponseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        int idTache = Integer.parseInt(request.getParameter("id_tache"));
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));
        String statut = request.getParameter("statut");
        int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        // Créer un objet Tache avec les informations mises à jour
        Tache updatedTache = new Tache();
        updatedTache.setId_tache(idTache);
        updatedTache.setDescription(description);
        updatedTache.setDateDebut(dateDebut);
        updatedTache.setDateFin(dateFin);
        updatedTache.setStatut(statut);
        updatedTache.setId_projet(id_projet);

        // Mettre à jour la tâche en utilisant DAO
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        tacheDAO.update(updatedTache);

        // Rediriger vers la liste des tâches du projet
        response.sendRedirect("afficherTache.jsp?projectId=" + id_projet);
    }
}

