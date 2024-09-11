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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>paris 2024</title>
    </head>
    <body>
        <h1>NOUVELLE EPREUVE</h1>
        
            <%
                FormEpreuve form = (FormEpreuve)request.getAttribute("form");
            %>
        
        <form class="form-inline" action="ajouter" method="POST">
                <label for="nom">NOM : </label>
                <input id="nom" type="text" name="nom"  size="30" maxlength="30">
                </br>
                            
                <%-- Champ Liste des pays --%>
                <label for="sports">Sports : </label>
                <select name="idSport">
                    <%
                        ArrayList<Sport> lesSports= (ArrayList)request.getAttribute("pLesSports");
                        for (int i=0; i<lesSports.size();i++){
                            Sport s = lesSports.get(i);
                            out.println("<option value='" + s.getId()+"'>" + s.getNom()+"</option>" );
                        }
                    %>
                </select>
                </br>            
                               
            <input type="submit" name="valider" id="valider" value="Valider"/>
            </form>
        
        
        
        
    </body>
</html>