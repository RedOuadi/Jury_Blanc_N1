<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="metier.Projet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Modifier Projet</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Modifier Projet</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="return validerFormulaireProjet()" action="EditProjetResponseServlet" method="POST">
                        <% Projet projet = (Projet) request.getAttribute("projet"); %>
                        <input type="hidden" name="id_projet" value="<%= projet.getId_projet() %>">
                        <div class="form-group">
                            <label for="nom_projet">Nom du Projet</label>
                            <input type="text" class="form-control" id="nom_projet" name="nom_proj" value="<%= projet.getNom() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" id="description" name="description" value="<%= projet.getDescription() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="date_debut">Date de Début</label>
                            <input type="date" class="form-control" id="date_debut" name="date_debut" value="<%= projet.getDateDebut() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="date_fin">Date de Fin</label>
                            <input type="date" class="form-control" id="date_fin" name="date_fin" value="<%= projet.getDateFin() %>" required>
                        </div>
                        <div class="form-group">
                            <label for="budget">Budget</label>
                            <input type="number" class="form-control" id="budget" name="budget" value="<%= projet.getBudget() %>" required>
                        </div>
                        <button type="submit" class="btn btn-success btn-block">Enregistrer</button>
                    </form>
                </div>
            </div>
        </div>
   w </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/valide.js"></script>
</body>
</html>




