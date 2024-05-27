<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="metier.Ressource" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Modifier Ressource</title>
  <!-- Include Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header bg-primary text-white">
          <h2 class="card-title">Modifier Ressource</h2>
        </div>
        <div class="card-body">
          <form onsubmit="validerFormulaireRessource(event);" action="EditRessourceResponseServlet" method="POST">
            <%-- Assurez-vous que l'objet ressource n'est pas null avant de l'utiliser --%>
            <% if (request.getAttribute("ressource") != null) { %>
            <% Ressource ressource = (Ressource) request.getAttribute("ressource"); %>
            <input type="hidden" name="id_ressource" value="<%= ressource.getId_ressource() %>">
            <div class="form-group">
              <label for="nom">Nom</label>
              <input type="text" class="form-control" id="nom" name="nom" value="<%= ressource.getNom() %>" required>
            </div>
            <div class="form-group">
              <label for="type">Type</label>
              <input type="text" class="form-control" id="type" name="type" value="<%= ressource.getType() %>" required>
            </div>
            <div class="form-group">
              <label for="quantite">Quantité</label>
              <input type="number" class="form-control" id="quantite" name="quantite" value="<%= ressource.getQuantite() %>" required>
            </div>
            <div class="form-group">
              <label for="fournisseur">Fournisseur</label>
              <input type="text" class="form-control" id="fournisseur" name="fournisseur" value="<%= ressource.getFournisseur() %>" required>
            </div>
              <div id="message-erreur-ressource"></div>
            <input type="hidden" name="id_tache" value="<%= ressource.getId_tache() %>">
            <button type="submit" class="btn btn-success btn-block">Enregistrer</button>
            <% } else { %>
            <p>La ressource à modifier n'est pas disponible.</p>
            <% } %>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>


