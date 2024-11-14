<%-- 
    Document   : ajouterPompier
    Created on : 18 mars 2024, 13:30:47
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.paris2024.model.Pays"%>
<%@page import="sio.paris2024.model.Sport"%>
<%@page import="sio.paris2024.model.Athlete"%>
<%@page import="sio.paris2024.form.FormAthlete"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vues/css/formulaire.css">
    <title>Formulaire Athlète</title>
</head>
<style>
    .flecheimg {
        pointer-events: none;
        position: absolute;
        margin-left: -40px;
        margin-top: 37px;
        transform: translateY(-50%) rotate(-90deg); /* Rotation de la flèche */
        z-index: 40;
    }

    form .button:hover + .flecheimg {
        filter: brightness(0); /* Transforme l'image en noir */
    }
    
    /* Conteneur pour le bouton retour */
    .back-container {
        position: relative;
        top: 30px;
        right: 110px;
        display: flex;
        align-items: center;
        cursor: pointer;
        width: 70px;
    }

    .back-container:hover {
        text-decoration: underline;
    }
</style>
<body>
    <div class="form-container">
         <a href="/paris2024/vues/ajouter.html" class="back-container">
            <img src="${pageContext.request.contextPath}/vues/images/fleche-svg.svg" alt="Flèche retour" class="back-arrow">
            <span class="back-text">Retour</span>
        </a>
        <img src="${pageContext.request.contextPath}/vues/images/Paris_2024.gif" alt="Logo" class="logo">
        <h1>Bienvenue !</h1>
        <h2>Ajouter votre athlète sur Paris 2024</h2>

        <%
            FormAthlete form = (FormAthlete) request.getAttribute("form");
        %>

        <form class="form-inline" action="ajouter" method="POST" enctype="multipart/form-data">
            <input id="nom" type="text" placeholder="Nom" name="nom" size="30" maxlength="30" required>
            <br>
            
            <input id="prenom" type="text" placeholder="Prénom" name="prenom" size="30" maxlength="30" required>
            <br>
            
            <input id="dateNaiss" type="date" placeholder="Date de Naissance" name="dateNaiss" required>
            <br>
            
            <select name="idPays" required>
                <option value="" disabled selected>Veuillez choisir votre Pays</option>
                <%
                    ArrayList<Pays> lesPays = (ArrayList) request.getAttribute("pLesPays");
                    for (int i = 0; i < lesPays.size(); i++) {
                        Pays p = lesPays.get(i);
                        out.println("<option value='" + p.getId() + "'>" + p.getNom() + "</option>");
                    }
                %>
            </select>
            <br>

            <select name="idSport" required>
                <option value="" disabled selected>Veuillez choisir votre Sport</option>
                <%
                    ArrayList<Sport> lesSports = (ArrayList) request.getAttribute("pLesSports");
                    for (int i = 0; i < lesSports.size(); i++) {
                        Sport s = lesSports.get(i);
                        out.println("<option value='" + s.getId() + "'>" + s.getNom() + "</option>");
                    }
                %>
            </select>
            <br>
            
            <div class="custom-file-upload">
                <input type="file" name="fichier" id="fichier" required>
                <label for="fichier" id="file-label">Ajouter une image</label>
            </div>
            <br>
            
            <input class="button" type="submit" name="valider" id="valider" value="Continuer"/>
            <img src="${pageContext.request.contextPath}/vues/images/fleche.svg" class="flecheimg" alt="fleche"/>
        </form>
    </div>

    <script>
        // JavaScript pour afficher le nom du fichier
        const fileInput = document.getElementById('fichier');
        const fileLabel = document.getElementById('file-label');

        fileInput.addEventListener('change', function(event) {
            const fileName = event.target.files[0]?.name || "Ajouter une image";
            fileLabel.textContent = fileName;
        });
    </script>
</body>
</html>
