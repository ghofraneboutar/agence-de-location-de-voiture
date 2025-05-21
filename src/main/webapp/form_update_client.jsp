<%@ page import="entities.Client" %><%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 4/9/2025
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mettre à jour client</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css">
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

                    <a href="${pageContext.request.contextPath}/parc" class="nav-link active" aria-current="page">
                        <i class="fa-solid fa-warehouse"></i> Gestion parcs
                    </a>
                </li>
                <li class="nav-item">

                    <a href="${pageContext.request.contextPath}/voiture" class="nav-link active" aria-current="page">
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
    Client client = (Client) request.getAttribute("client_to_update");
%>
<div class="container mt-5">
    <h1>Mettre à jour client</h1>
    <form action="${pageContext.request.contextPath}/client/update?id=<%=client.getCode_client()%>" method="post">

        <div class="form-floating mb-4">
            <input type="text" id="num_cin" class="form-control" placeholder="Entrez votre CIN" name="num_cin"
                   value="<%=client.getNum_cin()%>" required>
            <label for="num_cin"><i class="fa-solid fa-id-card"></i> Numéro CIN</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="nom" class="form-control" placeholder="Entrez votre nom" name="nom"
                   value="<%=client.getNom()%>" required>
            <label for="nom"><i class="fa-solid fa-user"></i> Nom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="prenom" class="form-control" placeholder="Entrez votre prénom" name="prenom"
                   value="<%=client.getPrenom()%>" required>
            <label for="prenom"><i class="fa-solid fa-user"></i> Prénom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="age" class="form-control" placeholder="Entrez votre age" name="age"
                   value="<%=client.getAge()%>" required>
            <label for="age"><i class="fa-solid fa-user"></i> Age</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="adresse" class="form-control" placeholder="Entrez votre adresse" name="adresse"
                   value="<%=client.getAdresse()%>" required>
            <label for="adresse"><i class="fa-solid fa-location-dot"></i> Adresse</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="num_permis" class="form-control" placeholder="Entrez votre numéro permis"
                   name="num_permis"
                   value="<%=client.getNum_permis()%>" required>
            <label for="num_permis"><i class="fa-solid fa-id-card"></i> Numéro permis</label>
        </div>
        <div class="form-floating mb-4">
            <input type="email" id="email" class="form-control" placeholder="Entrez votre adresse email" name="email"
                   value="<%=client.getEmail()%>" required>
            <label for="email"><i class="fas fa-envelope me-2"></i> Adresse email</label>
        </div>
        <div class="form-floating mb-4">
            <input type="tel" id="tel" class="form-control" placeholder="Entrez votre téléphone" name="tel"
                   value="<%=client.getTel()%>" required>
            <label for="tel"><i class="fa-solid fa-phone"></i> Téléphone</label>
        </div>
        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-primary" value="Mettre à jour Client">
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
