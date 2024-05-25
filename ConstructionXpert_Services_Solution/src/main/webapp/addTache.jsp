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
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Ajouter Tâche</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="return validerFormulaireTache();" action="AddTacheServlet" method="POST">

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
                        <button type="submit" class="btn btn-success btn-block">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="js/valide.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

