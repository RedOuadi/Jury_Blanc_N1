<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projet" %>
<%@ page import="dao.ProjetDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter Tâche</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    // Retrieve the list of projects to populate the dropdown
    ProjetDAOImpl projetDAO = new ProjetDAOImpl();
    List<Projet> listeProjets = projetDAO.findAll();
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
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Ajouter Tâche</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="validerFormulaireTache(event);" action="AddTacheServlet" method="POST">

                    <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="Description">
                        </div>
                        <div class="form-group">
                            <label for="date_debut">Date de Début</label>
                            <input type="date" class="form-control" id="date_debut" name="date_debut">
                        </div>
                        <div class="form-group">
                            <label for="date_fin">Date de Fin</label>
                            <input type="date" class="form-control" id="date_fin" name="date_fin">
                        </div>
                        <div class="form-group">
                            <label for="statut">Statut</label>
                            <input type="text" class="form-control" id="statut" name="statut" placeholder="Statut">
                        </div>
                        <div class="form-group">
                            <label for="id_projet">Projet</label>
                            <select class="form-control" id="id_projet" name="id_projet">
                                <% for (Projet projet : listeProjets) { %>
                                <option value="<%= projet.getId_projet() %>"><%= projet.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <div id="message-erreur-tache"></div>
                        <button type="submit" class="btn btn-success btn-block">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
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


<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/valide.js"></script>
<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

