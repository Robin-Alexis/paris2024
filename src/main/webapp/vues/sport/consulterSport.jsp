<%-- 
    Document   : consulterSport.jsp
    Created on : 9 sept. 2024, 14:07:07
    Author     : SIO2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Epreuve"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARIS 2024</title>
    </head>
    <body>
        <%
                ArrayList<Epreuve> lesEpreuves = (ArrayList)request.getAttribute("pLesEpreuves");
        %>            
       
             <table>  
                <thead>
                    <tr>             
                        <th>id</th>
                        <th>nom</th>           
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            for (Epreuve e : lesEpreuves)
                            {              
                                out.println("<tr><td>");
                                out.println(e.getId());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(e.getNom());
                                out.println("</a></td>");;      
                            }
                        %>
                    </tr>
                </tbody>
            </table>
</html>