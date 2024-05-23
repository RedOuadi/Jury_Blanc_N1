<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="metier.Tache" %>
<%@ page import="dao.TacheDAOImpl" %>
<%@ page import="dao.ProjetDAOImpl" %>
<%@ page import="metier.Projet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Tâches</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    int projectId = Integer.parseInt(request.getParameter("projectId"));

    ProjetDAOImpl projetDAO = new ProjetDAOImpl();
    Projet projet = projetDAO.getProjet(projectId);

    TacheDAOImpl tacheDAO = new TacheDAOImpl();
    List<Tache> listeTaches = new ArrayList<>();
    for (Tache tache : tacheDAO.findAll()) {
        if (tache.getId_projet() == projectId) {
            listeTaches.add(tache);
        }
    }


%>
<div class="container">
    <h1 class="mt-5">Tâches pour le projet: <%= projet.getNom() %></h1>
    <a href="addTache.jsp?projectId=<%= projet.getId_projet() %>" class="btn btn-primary mb-3">Ajouter Tâche</a>
    <div class="row">
        <% if (listeTaches.isEmpty()) { %>
        <div class="col-12 mb-4">
            <div class="card">
                <div class="card-body">
                    <p class="card-text">Aucune tâche trouvée pour ce projet.</p>
                </div>
            </div>
        </div>
        <% } else { %>
        <% for (Tache tache : listeTaches) { %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= tache.getDescription() %></h5>
                    <p class="card-text">
                        <strong>Date de Début:</strong> <%= tache.getDateDebut() %><br>
                        <strong>Date de Fin:</strong> <%= tache.getDateFin() %><br>
                        <strong>Statut:</strong> <%= tache.getStatut() %>
                    </p>
                    <div class="d-flex justify-content-between">
                        <a href="EditTacheServlet?idTache=<%= tache.getId_tache() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <a href="DeleteTacheServlet?idTache=<%= tache.getId_tache() %>" class="btn btn-danger btn-sm">Supprimer</a>
                        <a href="afficherRessource.jsp?projectId=<%= tache.getId_tache() %>" class="btn btn-info btn-sm">Gérer les Ressources</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
    </div>
</div>

</body>
</html>







