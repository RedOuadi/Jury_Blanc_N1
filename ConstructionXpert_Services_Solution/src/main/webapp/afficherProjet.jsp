<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="metier.Projet"%>
<%@ page import="dao.ProjetDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des projets</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%
    // Initialiser le DAO et récupérer la liste des projets
    ProjetDAOImpl projetDAO = new ProjetDAOImpl();
    List<Projet> listeProjets = projetDAO.findAll();

%>
<h1>Liste des projets</h1>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom du Projet</th>
        <th>Description</th>
        <th>Date de Début</th>
        <th>Date de Fin</th>
        <th>Budget</th>
    </tr>
    </thead>
    <tbody>
    <% for (Projet projet : listeProjets) { %>
    <tr>
        <td><%= projet.getId_projet() %></td>
        <td><%= projet.getNom() %></td>
        <td><%= projet.getDescription() %></td>
        <td><%= projet.getDateDebut() %></td>
        <td><%= projet.getDateFin() %></td>
        <td><%= projet.getBudget() %></td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>





