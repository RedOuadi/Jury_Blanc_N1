<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Ressource" %>
<%@ page import="dao.RessourceDAOImpl" %>
<%@ page import="metier.Tache" %>
<%@ page import="dao.TacheDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter Ressource</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    // Retrieve the list of tasks to populate the dropdown
    TacheDAOImpl tacheDAO = new TacheDAOImpl();
    List<Tache> listeTaches = tacheDAO.findAll();
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Ajouter Ressource</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="return validerFormulaireRessource();" action="AddRessourceServlet" method="POST">
                        <div class="form-group">
                            <label for="nom">Nom</label>
                            <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom">
                        </div>
                        <div class="form-group">
                            <label for="type">Type</label>
                            <input type="text" class="form-control" id="type" name="type" placeholder="Type">
                        </div>
                        <div class="form-group">
                            <label for="quantite">Quantité</label>
                            <input type="number" class="form-control" id="quantite" name="quantite" placeholder="Quantité">
                        </div>
                        <div class="form-group">
                            <label for="fournisseur">Fournisseur</label>
                            <input type="text" class="form-control" id="fournisseur" name="fournisseur" placeholder="Fournisseur">
                        </div>
                        <div class="form-group">
                            <label for="id_tache">Tâche</label>
                            <select class="form-control" id="id_tache" name="id_tache">
                                <% for (Tache tache : listeTaches) { %>
                                <option value="<%= tache.getId_tache() %>"><%= tache.getDescription() %></option>
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

