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


