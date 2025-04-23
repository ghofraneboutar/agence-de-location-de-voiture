<%@ page import="entities.Parc" %><%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 4/22/2025
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mise à jour Parc</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            Agence Location
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="/">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/client" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-people-group"></i> Gestion clients
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/parc" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-warehouse"></i> Gestion parcs
                    </a>
                </li>
                <li class="nav-item">

                    <a href="/voiture" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-car"></i> Gestion voitures
                    </a>
                </li>

            </ul>
            <div class="d-flex">
                <ul class="navbar-nav mb-2 mb-lg-0">

                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-sign-in-alt me-1"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-user-plus me-1"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<%
    Parc parc = (Parc) request.getAttribute("parc_to_update");
%>
<div class="container mt-5">
    <h1>Mise à jour parc</h1>
    <form action="/parc/update?id=<%=parc.getNum_parc()%>" method="post">

        <div class="form-floating mb-4">
            <input type="text" id="libelle" class="form-control" placeholder="Entrez libellé du parc" name="libelle"
                   required
                   value="<%=parc.getLibelle()%>">
            <label for="libelle"><i class="fa-solid fa-square-parking"></i> Libellé</label>
        </div>

        <div class="form-floating mb-4">
            <input type="text" id="localisation" class="form-control" placeholder="Entrez localisation du parc"
                   name="localisation"
                   required
                   value="<%=parc.getLocalisation()%>">
            <label for="localisation"><i class="fa-solid fa-location-dot"></i> Localisation</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="capacite" class="form-control" placeholder="Entrez capacité du parc"
                   name="capacite"
                   required
                   value="<%=parc.getCapacite()%>">
            <label for="capacite"><i class="fa-solid fa-warehouse"></i> Capacité</label>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-primary" value="Mettre à jour parc">
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>

