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

@WebServlet("/AddTacheServlet")
public class AddTacheServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("date_debut");
        String dateFinStr = request.getParameter("date_fin");
        String statut = request.getParameter("statut");
        int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        // Create a new Tache object
        Tache newTache = new Tache();
        newTache.setDescription(description);

        // Parse and set dateDebut and dateFin
        try {
            Date dateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(dateDebutStr);
            newTache.setDateDebut(dateDebut);
            Date dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(dateFinStr);
            newTache.setDateFin(dateFin);
        } catch (ParseException e) {
            e.printStackTrace();
            // Handle the parsing exception (e.g., log it, send an error response, etc.)
        }

        newTache.setStatut(statut);
        newTache.setId_projet(id_projet);

        // Save the task using DAO
        TacheDAOImpl tacheDAO = new TacheDAOImpl();
        tacheDAO.save(newTache);

        // Redirect back to the task list page for the project
        response.sendRedirect("afficherTache.jsp?projectId=" + id_projet);
    }
}
