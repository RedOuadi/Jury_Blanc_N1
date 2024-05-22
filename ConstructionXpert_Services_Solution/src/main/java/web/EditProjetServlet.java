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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID du projet à partir de la requête
        int idProjet = Integer.parseInt(request.getParameter("idProjet"));

        // Récupérer les détails du projet correspondant à cet ID depuis la base de données
        ProjetDAOImpl projetDAO = new ProjetDAOImpl();
        Projet projet = projetDAO.getProjet(idProjet);

        // Stocker cet objet Projet dans l'attribut de requête
        request.setAttribute("projet", projet);

        // Transférer la requête à la page JSP pour afficher le formulaire d'édition
        request.getRequestDispatcher("editProjet.jsp").forward(request, response);
    }
}


