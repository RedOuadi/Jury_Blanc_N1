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


}
