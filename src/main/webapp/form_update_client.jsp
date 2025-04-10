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
</head>
<body>
<%
    Client client = (Client) request.getAttribute("client_to_update");
%>
<div class="container mt-5">
    <h1>Mettre à jour client</h1>
    <form action="/client/update?id=<%=client.getCode_client()%>" method="post">

        <div class="form-floating mb-4">
            <input type="text" id="num_cin" class="form-control" placeholder="Entrez votre CIN" name="num_cin"
                   value="<%=client.getNum_cin()%>" required>
            <label for="num_cin"><i class="fa-solid fa-id-card"></i>Numéro CIN</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="nom" class="form-control" placeholder="Entrez votre nom" name="nom"
                   value="<%=client.getNom()%>" required>
            <label for="nom"><i class="fa-solid fa-user"></i>Nom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="prenom" class="form-control" placeholder="Entrez votre prénom" name="prenom"
                   value="<%=client.getPrenom()%>" required>
            <label for="prenom"><i class="fa-solid fa-user"></i>Prénom</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" id="age" class="form-control" placeholder="Entrez votre age" name="age"
                   value="<%=client.getAge()%>" required>
            <label for="age"><i class="fa-solid fa-user"></i>Age</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="adresse" class="form-control" placeholder="Entrez votre adresse" name="adresse"
                   value="<%=client.getAdresse()%>" required>
            <label for="adresse"><i class="fa-solid fa-location-dot"></i>Adresse</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="num_permis" class="form-control" placeholder="Entrez votre numéro permis"
                   name="num_permis"
                   value="<%=client.getNum_permis()%>" required>
            <label for="num_permis"><i class="fa-solid fa-id-card"></i></i>Numéro permis</label>
        </div>
        <div class="form-floating mb-4">
            <input type="email" id="email" class="form-control" placeholder="Entrez votre adresse email" name="email"
                   value="<%=client.getEmail()%>" required>
            <label for="email"><i class="fas fa-envelope me-2"></i>Adresse email</label>
        </div>
        <div class="form-floating mb-4">
            <input type="tel" id="tel" class="form-control" placeholder="Entrez votre téléphone" name="tel"
                   value="<%=client.getTel()%>" required>
            <label for="tel"><i class="fa-solid fa-phone"></i>Téléphone</label>
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
