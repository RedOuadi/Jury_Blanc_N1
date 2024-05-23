package web;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import metier.Ressource;
import dao.RessourceDAOImpl;

@WebServlet("/EditRessourceServlet")







public class editRessourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'ID de la ressource à partir de la requête
        int idRessource = Integer.parseInt(request.getParameter("idRessource"));

        // Récupérer les détails de la ressource correspondant à cet ID depuis la base de données
        RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
        Ressource ressource = ressourceDAO.getRessource(idRessource);

        // Stocker cet objet Ressource dans l'attribut de requête
        request.setAttribute("ressource", ressource);

        // Transférer la requête à la page JSP pour afficher le formulaire d'édition
        request.getRequestDispatcher("editRessource.jsp").forward(request, response);
    }




}
