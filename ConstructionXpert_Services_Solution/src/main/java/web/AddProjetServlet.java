
package web;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.Projet;
import dao.ProjetDAOImpl;

@WebServlet("/AddProjetServlet")
public class AddProjetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String nom = request.getParameter("nom_proj");
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        // Create a new project object
        Projet newProjet = new Projet();
        newProjet.setNom(nom);
        newProjet.setDescription(description);
        newProjet.setDateDebut(dateDebut);
        newProjet.setDateFin(dateFin);
        newProjet.setBudget(budget);

        // Save the project using DAO
        ProjetDAOImpl projetDAO = new ProjetDAOImpl();
        projetDAO.save(newProjet);

        // Redirect back to the project list page
        response.sendRedirect("afficherProjet.jsp");
    }
}

