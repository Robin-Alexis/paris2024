<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Athlete"%>
<%@page import="sio.paris2024.model.Pays"%>
<%@page import="sio.paris2024.model.Sport"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PARIS 2024 - Athlètes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vues/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vues/css/tableau.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/vues/images/favicon.ico">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="navbar-content">
            <ul class="nav-links left" style="margin-top: 20px;">
                <li><a href="/paris2024/ServletAthlete/lister">ATHLÈTES</a></li>
                <li><a href="/paris2024/ServletSport/lister"">SPORTS</a></li>
            </ul>
            <div class="logo">
                <a class="logotaille" href="${pageContext.request.contextPath}/index.html" >
                    <img src="${pageContext.request.contextPath}/vues/images/emblem-oly.svg" alt="Logo">
                </a>
                <h1 class="titrenav">ATHLÈTES</h1>
            </div>
            <ul class="nav-links right" style="margin-top: 20px;">
                <li><a href="/paris2024/vues/ajouter.html" class="btn-contact">AJOUTER</a></li>
            </ul>
                
            <div class="parallax-bg"></div>
            <div class="parallax-bg2"></div>
        </div>
    </nav>
                
    <!-- Navbar Static (can be adjusted as needed) -->
    <nav class="navbar-static">
        <div class="navbar-content">
            <ul class="nav-links left">
                <li><a href="/paris2024/ServletAthlete/lister">ATHLÈTES</a></li>
                <li><a href="/paris2024/ServletSport/lister">SPORTS</a></li>
            </ul>
            <ul class="nav-links right">
                <li><a href="/paris2024/vues/ajouter.html" class="btn-contact">AJOUTER</a></li>
            </ul>
        </div>
    </nav>

    <!-- Table des athlètes -->
    <main>
        <div class="table-container">
            <table class="table-athletes">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Équipe / CNO</th>
                        <th>Discipline</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Athlete> lesAthletes = (ArrayList<Athlete>) request.getAttribute("pLesAthletes");
                        for (Athlete a : lesAthletes) {
                            String imageName = a.getUrlImage(); // Image de l'athlète
                            String imagePays = a.getPays().getUrlImage(); // Drapeau du pays
                            String imageSport = a.getSport().getUrlImage(); // Icône du sport
                    %>
                    <tr>
                        <td>
                            <a href="/paris2024/ServletAthlete/consulter?idAthlete=<%= a.getId() %>">
                            <div class="row-content">
                                <img src="${pageContext.request.contextPath}/vues/images/<%= imageName %>" alt="<%= a.getNom() %>" class="athlete-img">
                                <%= a.getNom() %> <%= a.getPrenom() %>
                            </div>
                            </a>
                        </td>
                        <td>
                            <img src="${pageContext.request.contextPath}/vues/images/<%= imagePays %>" alt="<%= a.getPays().getNom() %>" class="pays-img">
                            <%= a.getPays().getNom() %>
                        </td>
                        <td>
                            <a href="../ServletSport/consulter?idSport=<%= a.getSport().getId() %>" style="display:block; width:100%;">
                                <img src="${pageContext.request.contextPath}/vues/images/<%= imageSport %>" alt="<%= a.getSport().getNom() %>" class="sport-img">
                                <%= a.getSport().getNom() %>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    
                    
                </tbody>
            </table>
        </div>
     </main>
        <footer class="footer">
            <div class="footer-content">
                <!-- Logo à gauche -->
                <div class="footer-logo">
                    <img src="${pageContext.request.contextPath}/vues/images/emblem-oly.svg" alt="Logo Olympique" style="margin-top: 10px;">
                </div>
        
                <!-- Liens au milieu -->
                <div class="footer-links">
                    <ul>
                        <li><a href="/paris2024/ServletAthlete/lister">Athlètes</a></li>
                        <li><a href="/paris2024/ServletSport/lister">Sports</a></li>
                        <li><a href="#">Sites</a></li>
                        <li><a href="#">Épreuves</a></li>
                    </ul>
                </div>
        
                <!-- Réseaux sociaux à droite -->
                <div class="footer-social">
                    <a href="https://www.facebook.com/Paris2024" target="_blank"><img src="${pageContext.request.contextPath}/vues/images/icons8-facebook-nouveau.svg" alt="Facebook"></a>
                    <a href="https://x.com/Paris2024" target="_blank"><img src="${pageContext.request.contextPath}/vues/images/icons8-x.svg" alt="Twitter"></a>
                    <a href="https://www.instagram.com/paris2024" target="_blank"><img src="${pageContext.request.contextPath}/vues/images/icons8-instagram.svg" alt="Instagram"></a>
                    <a href="https://www.youtube.com/@paris2024officiel" target="_blank"><img src="${pageContext.request.contextPath}/vues/images/icons8-youtube.svg" alt="YouTube"></a>
                </div>
            </div>
            
            <!-- Nouvelle section pour les droits réservés -->
            <div class="footer-bottom">
                <hr class="footer-separator">
                <p class="footer-text">© 2024 All rights reserved</p>
            </div>
        </footer>
<style>
    .parallax-bg {
        position: absolute;
        top: -500px;
        left: 0;
        width: 117%;
        height: 500%;
        background: url('<%= pageContext.getServletContext().getContextPath() %>/vues/images/bottom.svg') center center;
        background-size: cover;
        transform: translateZ(0);
        will-change: transform;
        z-index: -1;
        pointer-events: none;
    }

    .parallax-bg2 {
        position: absolute;
        top: -400px;
        left: 27px;
        width: 100%;
        height: 400%;
        background: url('<%= pageContext.getServletContext().getContextPath() %>/vues/images/top.svg') repeat center center;
        background-size: cover;
        transform: translateZ(0);
        will-change: transform;
        z-index: -1;
        pointer-events: none;
    }

    .navbar-static {
        display: none; 
        position: fixed;
        justify-content: space-between;
        top: 0;
        left: 0;
        width: 100%;
        height: 65px; 
        background-image: url('<%= pageContext.getServletContext().getContextPath() %>/vues/images/fond.png');
        background-repeat: no-repeat;
        background-size: cover;
        z-index: 1000;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    
    a {
        text-decoration:none;
        color:black;
    }
</style>




    <script src="${pageContext.request.contextPath}/vues/script/script.js"></script>
</body>
</html>
