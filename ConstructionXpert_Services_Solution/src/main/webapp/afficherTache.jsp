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
    // Vérifier si le paramètre "projectId" est présent et non null dans la requête
    String projectIdParam = request.getParameter("projectId");
    int projectId = 0; // Valeur par défaut si le paramètre est manquant ou null
    if (projectIdParam != null && !projectIdParam.isEmpty()) {
        projectId = Integer.parseInt(projectIdParam);
    }

    // Si le paramètre "projectId" est égal à zéro, vous pouvez choisir de gérer ce cas selon votre logique métier

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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="images/construction.svg" alt="Logo" width="30" height="30">
        <span class="ml-2 text" style="font-size: 1.5rem; font-weight: bold; color: #0e7fb9">ConstructionXpert</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ">
            <li class="nav-item active">
                <a class="nav-link" href="afficherProjet.jsp">Projets</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h1 class="mt-5">Tâches pour le projet: <%= projet != null ? projet.getNom() : "Projet non trouvé" %></h1>
    <a href="addTache.jsp?projectId=<%= projectId %>" class="btn btn-primary mb-3">Ajouter Tâche</a>
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
                        <a href="afficherRessource.jsp?idTache=<%= tache.getId_tache() %>" class="btn btn-info btn-sm">Gérer les Ressources</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
        <% } %>
    </div>
</div>

<footer class="bg-dark text-white py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <p>
                    Copyright &copy; <script>document.write(new Date().getFullYear());</script><br>
                    ConstructionXpert Services <i class="icon-heart" aria-hidden="true"></i>
                </p>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>








