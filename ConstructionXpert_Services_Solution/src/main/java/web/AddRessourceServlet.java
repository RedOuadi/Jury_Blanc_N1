package web;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Ressource;
import dao.RessourceDAOImpl;

@WebServlet("/AddRessourceServlet")
public class AddRessourceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String nom = request.getParameter("nom");
        String type = request.getParameter("type");
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String fournisseur = request.getParameter("fournisseur");
        int id_tache = Integer.parseInt(request.getParameter("id_tache"));

        // Create a new Ressource object
        Ressource newRessource = new Ressource();
        newRessource.setNom(nom);
        newRessource.setType(type);
        newRessource.setQuantite(quantite);
        newRessource.setFournisseur(fournisseur);
        newRessource.setId_tache(id_tache);

        // Save the resource using DAO
        RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
        ressourceDAO.save(newRessource);

        // Redirect back to the resource list page for the task
        response.sendRedirect("afficherRessource.jsp?idTache=" + id_tache);
    }

}
