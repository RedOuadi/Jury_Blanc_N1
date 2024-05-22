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

@WebServlet("/EditProjetServlet")
public class EditProjetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        int idProjet = Integer.parseInt(request.getParameter("id_projet"));
        String nom = request.getParameter("nom_proj");
        String description = request.getParameter("description");
        Date dateDebut = Date.valueOf(request.getParameter("date_debut"));
        Date dateFin = Date.valueOf(request.getParameter("date_fin"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        // Create a project object with updated information
        Projet updatedProjet = new Projet(idProjet, nom, description, dateDebut, dateFin, budget);

        // Update the project using DAO
        ProjetDAOImpl projetDAO = new ProjetDAOImpl();
        projetDAO.update(updatedProjet);

        // Redirect back to the project list page
        response.sendRedirect("afficherProjet.jsp");
    }
}

