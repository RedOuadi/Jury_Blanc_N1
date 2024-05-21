<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h1>Liste des projets</h1>
<table>
  <thead>
  <tr>
    <th>Nom du Projet</th>
    <th>Description</th>
    <th>Date de Début</th>
    <th>Date de Fin</th>
  </tr>
  </thead>
  <tbody>
  <!-- Utilisation de forEach pour itérer à travers une liste de projets -->
  <c:forEach var="projet" items="${listeProjets}">
    <tr>
      <td>${projet.nom}</td>
      <td>${projet.description}</td>
      <td>${projet.dateDebut}</td>
      <td>${projet.dateFin}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
