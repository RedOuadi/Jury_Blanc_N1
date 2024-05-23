package web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import metier.Tache;
import dao.TacheDAOImpl;

@WebServlet("/EditTacheServlet")
public class EditTacheServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la tâche à partir de la requête
        int idTache = Integer.parseInt(request.getParameter("idTache"));

        // Récupérer les détails de la tâche correspondant à cet ID depuis la base de données
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        Tache tache = tacheDAO.getTache(idTache);

        // Stocker cet objet Tache dans l'attribut de requête
        request.setAttribute("tache", tache);

        // Transférer la requête à la page JSP pour afficher le formulaire d'édition
        request.getRequestDispatcher("editTache.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        int idTache = Integer.parseInt(request.getParameter("id_tache"));
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("date_debut");
        String dateFinStr = request.getParameter("date_fin");
        String statut = request.getParameter("statut");
        int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        // Créer une nouvelle instance de Tache et définir ses propriétés
        Tache tache = new Tache();
        tache.setId_tache(idTache);
        tache.setDescription(description);

        // Parse and set dateDebut and dateFin
        try {
            Date dateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutStr);
            tache.setDateDebut(dateDebut);
            Date dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinStr);
            tache.setDateFin(dateFin);
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the parsing exception (e.g., log it, send an error response, etc.)
        }

        tache.setStatut(statut);
        tache.setId_projet(id_projet);

        // Mettre à jour la tâche en utilisant le DAO
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        tacheDAO.update(tache);

        // Rediriger vers la liste des tâches du projet
        response.sendRedirect("afficherTache.jsp?projectId=" + id_projet);
    }
}
