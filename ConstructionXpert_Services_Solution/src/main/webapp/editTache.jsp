<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="metier.Tache" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Tâche</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Modifier Tâche</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="validerFormulaireTache(event);" action="EditTacheResponseServlet" method="POST">
                        <% Tache tache = (Tache) request.getAttribute("tache"); %>
                        <input type="hidden" name="id_tache" value="<%= tache.getId_tache() %>">
                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" id="description" name="description" value="<%= tache.getDescription() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="date_debut">Date de Début</label>
                            <input type="date" class="form-control" id="date_debut" name="date_debut" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(tache.getDateDebut()) %>" required>
                        </div>
                        <div class="form-group">
                            <label for="date_fin">Date de Fin</label>
                            <input type="date" class="form-control" id="date_fin" name="date_fin" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(tache.getDateFin()) %>" required>
                        </div>
                        <div class="form-group">
                            <label for="statut">Statut</label>
                            <input type="text" class="form-control" id="statut" name="statut" value="<%= tache.getStatut() %>" required>
                        </div>
                        <div id="message-erreur-tache"></div>
                        <input type="hidden" name="id_projet" value="<%= tache.getId_projet() %>">
                        <button type="submit" class="btn btn-success btn-block">Enregistrer</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

