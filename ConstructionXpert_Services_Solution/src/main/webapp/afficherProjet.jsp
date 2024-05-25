<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
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

    // Sort the list of projects by ID
    Collections.sort(listeProjets, new Comparator<Projet>() {
        @Override
        public int compare(Projet p1, Projet p2) {
            return Integer.compare(p1.getId_projet(), p2.getId_projet());
        }
    });
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
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Accueil</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="afficherProjet.jsp">Projets</a>
            </li>
        </ul>
    </div>
</nav>

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
<script src="js/main.js"></script>
</body>
</html>







