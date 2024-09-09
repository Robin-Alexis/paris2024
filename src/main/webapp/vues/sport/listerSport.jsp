<%-- 
    Document   : listerSport
    Created on : 9 sept. 2024, 10:59:02
    Author     : SIO2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Sport"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARIS 2024</title>
        
        <title>Paris 2024</title>

        <style>
            body {
		padding-top: 50px;
            }
                .special {
		padding-top:50px;
	}
        </style>
    </head>
    <body>
       <div class="container special">
            <h2 class="h2">Liste des sports</h2>
		<div class="table-responsive">
                <%
                    ArrayList<Sport> lesSports = (ArrayList)request.getAttribute("pLesSports");
                %>
                <table class="table table-striped table-sm">  
                <thead>
                    <tr>             
                        <th>id</th>
                        <th>nom</th>              
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            for (Sport s : lesSports)
                            {              
                                out.println("<tr><td>");
                                out.println(s.getId());
                                out.println("</td>");

                                out.println("<td><a href ='../ServletSport/consulter?idSport="+ s.getId()+ "'>");
                                out.println(s.getNom());
                                out.println("</a></td>");;       
                            }
                        %>
                    </tr>
                </tbody>
                </table>
                </div>
       </div>
    </body>
</html>