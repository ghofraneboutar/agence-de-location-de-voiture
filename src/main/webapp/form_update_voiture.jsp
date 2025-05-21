<%@ page import="entities.Parc" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.Voiture" %><%--
  Created by IntelliJ IDEA.
  User: moham
  Date: 4/23/2025
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mise à jour Voiture</title>
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
    List<Parc> parcs = (List<Parc>) request.getAttribute("parcs");
    Voiture v=(Voiture) request.getAttribute("voiture_to_update");

%>
<div class="container mt-5">
    <h1>Ajouter Voiture</h1>
    <form action="${pageContext.request.contextPath}/voiture/update?id=<%=v.getCode_voiture()%>" method="post">

        <div class="form-floating mb-4">
            <input type="text" id="matricule" class="form-control" placeholder="Entrez matricule de la voiture" name="matricule"
                   required
            value="<%=v.getMatricule()%>">
            <label for="matricule"><i class="fa-solid fa-car"></i> Matricule</label>
        </div>

        <div class="form-floating mb-4">
            <input type="text" id="marque" class="form-control" placeholder="Entrez marque de la voiture"
                   name="marque"
                   required   value="<%=v.getMarque()%>">
            <label for="marque"><i class="fa-solid fa-car"></i> Marque</label>
        </div>
        <div class="form-floating mb-4">
            <input type="text" id="modele" class="form-control" placeholder="Entrez modèle de la voiture"
                   name="modele"
                   required   value="<%=v.getModele()%>">
            <label for="modele"><i class="fa-solid fa-car"></i> Modèle</label>
        </div>
        <div class="form-floating mb-4">
            <input type="number" step="0.1" id="kilometrage" class="form-control" placeholder="Entrez kilometrage de la voiture"
                   name="kilometrage"
                   required   value="<%=v.getKilometrage()%>">
            <label for="kilometrage"><i class="fa-solid fa-gauge"></i> Kilometrage</label>
        </div>
        <div class="form-floating mb-4">
            <select name="parc" id="parc" class=" form-select" required>


                <%
                    if (parcs != null) {
                        for (Parc p : parcs) {
                %>
                <option value="<%=p.getNum_parc()%>"

                <%
                    if(p.getNum_parc()==v.getParc().getNum_parc()){
                %>selected<%
                    }
                %>
                >   <%=p.getLibelle()%></option>
                <% }
                } %>
            </select>
            <label for="parc"><i class="fa-solid fa-warehouse"></i> Parc</label>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
            <input type="submit" class="form-control btn btn-primary" value="Mettre à jour voiture">
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
