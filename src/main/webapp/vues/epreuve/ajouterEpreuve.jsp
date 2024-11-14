<%-- 
    Document   : ajouterEpreuve
    Created on : 11 sept. 2024, 10:37:22
    Author     : SIO2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.paris2024.model.Epreuve"%>
<%@page import="sio.paris2024.model.Sport"%>
<%@page import="sio.paris2024.form.FormEpreuve"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vues/css/formulaire.css">
    <title>Formulaire Épreuve</title>
</head>
<style>
    .flecheimg {
        pointer-events: none;
        position: absolute;
        margin-left: -40px;
        margin-top: 67px;
        transform: translateY(-50%) rotate(-90deg); /* Rotation de la flèche */
        z-index: 40;
    }

    form .button:hover + .flecheimg {
        filter: brightness(0); /* Transforme l'image en noir */
    }
    
    /* Conteneur pour le bouton retour */
    .back-container {
        position: relative;
        top: -92px;
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
        <h2>Ajouter votre épreuve sur Paris 2024</h2>
        
        <%
            FormEpreuve form = (FormEpreuve)request.getAttribute("form");
        %>

        <form action="ajouter" method="POST">
            <input type="text" placeholder="Nom" name="nomepreuve" required>

            <select name="idSport" required>
                <option value="" disabled selected>Veuillez choisir votre Sport</option>
                <%
                    ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
                    for (int i = 0; i < lesSports.size(); i++) {
                        Sport s = lesSports.get(i);
                        out.println("<option value='" + s.getId() + "'>" + s.getNom() + "</option>");
                    }
                %>
            </select>

            <input class="button" type="submit" name="valider" id="valider" value="Continuer" style="margin-top:50px"/>
            <img src="${pageContext.request.contextPath}/vues/images/fleche.svg" class="flecheimg" alt="fleche"/>
        </form>
    </div>
</body>
</html>
