<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="metier.Ressource" %>
<%@ page import="dao.RessourceDAOImpl" %>
<%@ page import="metier.Tache" %>
<%@ page import="dao.TacheDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gérer les Ressources</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    // Vérifier si le paramètre "idTache" est présent et non null dans la requête
    String idTacheParam = request.getParameter("idTache");
    int idTache = 0; // Valeur par défaut si le paramètre est manquant ou null
    if (idTacheParam != null && !idTacheParam.isEmpty()) {
        idTache = Integer.parseInt(idTacheParam);
    }

    // Si le paramètre "idTache" est égal à zéro, vous pouvez choisir de gérer ce cas selon votre logique métier

    TacheDAOImpl tacheDAO = new TacheDAOImpl();
    Tache tache = tacheDAO.getTache(idTache);

    RessourceDAOImpl ressourceDAO = new RessourceDAOImpl();
    List<Ressource> ressources = new ArrayList<>();
    for (Ressource ressource : ressourceDAO.findAll()) {
        if (ressource.getId_tache() == idTache) {
            ressources.add(ressource);
        }
    }
%>
<div class="container">
    <h1 class="mt-5">Gérer les Ressources pour la tâche: <%= tache != null ? tache.getDescription() : "Tâche non trouvée" %></h1>
    <a href="addRessource.jsp?idTache=<%= idTache %>" class="btn btn-primary mb-3">Ajouter Ressource</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Nom</th>
            <th scope="col">Type</th>
            <th scope="col">Quantité</th>
            <th scope="col">Fournisseur</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <% if (ressources.isEmpty()) { %>
        <tr>
            <td colspan="6">Aucune ressource trouvée pour cette tâche.</td>
        </tr>
        <% } else { %>
        <% for (Ressource ressource : ressources) { %>
        <tr>
            <th scope="row"><%= ressource.getId_ressource() %></th>
            <td><%= ressource.getNom() %></td>
            <td><%= ressource.getType() %></td>
            <td><%= ressource.getQuantite() %></td>
            <td><%= ressource.getFournisseur() %></td>
            <td>
                <a href="EditRessourceServlet?idRessource=<%= ressource.getId_ressource() %>" class="btn btn-warning btn-sm">Modifier</a>
                <a href="DeleteRessourceServlet?idRessource=<%= ressource.getId_ressource() %>" class="btn btn-danger btn-sm">Supprimer</a>
            </td>
        </tr>
        <% } %>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>


