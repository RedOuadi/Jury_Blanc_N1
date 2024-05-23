<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projet" %>
<%@ page import="dao.ProjetDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
    // Initialize the DAO and retrieve the list of projects
    ProjetDAOImpl projetDAO = new ProjetDAOImpl();
    List<Projet> listeProjets = projetDAO.findAll();
%>
<div class="container">
    <h1 class="mt-5">Liste des Projets</h1>
    <a href="addProjet.jsp" class="btn btn-primary mb-3">Ajouter Projet</a>
    <div class="row">
        <% for (Projet projet : listeProjets) { %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><%= projet.getNom() %></h5>
                    <h6 class="card-subtitle mb-2 text-muted">ID: <%= projet.getId_projet() %></h6>
                    <p class="card-text">
                        <strong>Description:</strong> <%= projet.getDescription() %><br>
                        <strong>Date de Début:</strong> <%= projet.getDateDebut() %><br>
                        <strong>Date de Fin:</strong> <%= projet.getDateFin() %><br>
                        <strong>Budget:</strong> <%= projet.getBudget() %>
                    </p>
                    <div class="d-flex justify-content-between">
                        <a href="EditProjetServlet?idProjet=<%= projet.getId_projet() %>" class="btn btn-warning btn-sm">Modifier</a>
                        <a href="DeleteProjetServlet?idProjet=<%= projet.getId_projet() %>" class="btn btn-danger btn-sm">Supprimer</a>
                        <a href="afficherTache.jsp?projectId=<%= projet.getId_projet() %>" class="btn btn-info btn-sm">Gérer les Tâches</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>







