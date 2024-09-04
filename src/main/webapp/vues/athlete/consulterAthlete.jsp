<%-- 
    Document   : listerAthletes
    Created on : 14 août 2024, 12:27:51
    Author     : zakina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Athlete"%>
<%@page import="sio.paris2024.model.Pays"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARIS 2024</title>
    </head>
    <body>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARIS 2024</title>
    </head>
    <body>
        <%
                Athlete a = (Athlete)request.getAttribute("pAthlete");
                
                LocalDate dateAujourdhui = LocalDate.now(); 
                LocalDate DateNaissance = a.getDateNaiss();
                int age = 0;
                age = Period.between(DateNaissance, dateAujourdhui).getYears();
        %>
        <h1><%  out.println(a.getNom());%> <%  out.println(a.getPrenom());%></h1>
            
                         
            <table>
            <tr>
                <td>Id: </td><td><%  out.println(a.getId());%></td>
            </tr>
            <tr>
                <td>Date de Naissance: </td><td><%  out.println(a.getDateNaiss());%></td>
            </tr>
            <tr>
                <td>Pays : </td><td><%  out.println(a.getPays().getNom());%></td>
            </tr>
             <tr>
                <td>Âge : </td><td><% out.println(age + " ans"); %></td> <!-- Affichage de l'âge -->
            </tr>
        </table>
</html>
