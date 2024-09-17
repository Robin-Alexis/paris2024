<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Athlete"%>
<%@page import="sio.paris2024.model.Pays"%>
<%@page import="sio.paris2024.model.Sport"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PARIS 2024</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <style>
        body {
            padding-top: 50px;
        }
        .special {
            padding-top: 50px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a href="../ServletAthlete/lister" class="navbar-brand">Système de gestion des athlètes</a>
            </div>
        </div>
    </nav>

    <div class="container special">
        <h2 class="h2">Liste des athlètes</h2>
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>nom</th>
                        <th>prenom</th>
                        <th>date naissance</th>
                        <th>pays</th>
                        <th>image</th>
                        <th>Sport</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Athlete> lesAthletes = (ArrayList<Athlete>) request.getAttribute("pLesAthletes");
                        for (Athlete a : lesAthletes) {
                            String imageName = a.getUrlImage();
                            String imagePays = a.getPays().getUrlImage();
                            String imageSport = a.getSport().getUrlImage();
                    %>
                    <tr>
                        <td><%= a.getId() %></td>
                        <td><a href='../ServletAthlete/consulter?idAthlete=<%= a.getId() %>'><%= a.getNom() %></a></td>
                        <td><%= a.getPrenom() %></td>
                        <td><%= a.getDateNaiss() %></td>
                        <td><img src="<%= request.getContextPath() %>/vues/images/<%= imagePays %>" alt="<%= a.getPays().getNom() %>"/> <%= a.getPays().getNom() %></td>
                        <td>
                            <img src="<%= request.getContextPath() %>/vues/images/<%= imageName %>" alt="Photo de <%= a.getNom() %>"/>
                        </td>
                        <td><img src="<%= request.getContextPath() %>/vues/images/<%= imageSport %>" alt="<%= a.getSport().getNom() %>"/> <%= a.getSport().getNom() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
