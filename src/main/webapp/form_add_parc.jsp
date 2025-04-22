<%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 4/22/2025
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajout Parc</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
    <h1>Ajouter parc</h1>
    <form action="/parc/save" method="post">

        <div class="form-floating mb-4">
            <input type="text" id="libelle" class="form-control" placeholder="Entrez libellé du parc" name="libelle"
                   required>
            <label for="libelle"><i class="fa-solid fa-square-parking"></i> Libellé</label>
        </div>

        <div class="form-floating mb-4">
            <input type="text" id="localisation" class="form-control" placeholder="Entrez localisation du parc" name="localisation"
                   required>
            <label for="localisation"><i class="fa-solid fa-location-dot"></i> Localisation</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="capacite" class="form-control" placeholder="Entrez capacité du parc"
                   name="capacite"
                   required>
            <label for="capacite"><i class="fa-solid fa-warehouse"></i> Capacité</label>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-primary" value="Ajouter parc">
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
