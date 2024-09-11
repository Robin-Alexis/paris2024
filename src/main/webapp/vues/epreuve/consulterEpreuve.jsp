<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sio.paris2024.model.Athlete"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulter Epreuve</title>
    </head>
    <body>
        <h1>Liste des Athlètes de l'Épreuve</h1>
        
        <%
            ArrayList<Athlete> lesAthletes = (ArrayList<Athlete>) request.getAttribute("pLesAthletes");
            if (lesAthletes != null && !lesAthletes.isEmpty()) {
        %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (Athlete a : lesAthletes) { 
                    %>
                        <tr>
                            <td><%= a.getId() %></td>
                            <td><%= a.getNom() %></td>
                            <td><%= a.getPrenom() %></td>
                        </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p>Aucun athlète n'est associé à cette épreuve.</p>
        <%
            }
        %>
    </body>
</html>