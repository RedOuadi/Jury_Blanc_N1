<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="metier.Projet" %>
<%@ page import="dao.ProjetDAOImpl" %>
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
    // Initialize the DAO and retrieve the list of projects
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
        <th>Actions</th> <!-- New column for actions -->
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
        <td>
            <!-- Edit button -->
            <a href="editProjet.jsp?idProjet=<%= projet.getId_projet() %>">Edit</a>
            <!-- Delete button -->
            <a href="deleteProjet.jsp?idProjet=<%= projet.getId_projet() %>">Delete</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<!-- Add Project button -->
<a href="addProjet.jsp">Ajouter Projet</a>
</body>
</html>





