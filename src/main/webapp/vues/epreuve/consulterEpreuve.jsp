<%-- 
    Document   : consulterEpreuve.jsp
    Created on : 11 sept. 2024, 09:02:10
    Author     : SIO2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sio.paris2024.model.Athlete"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PARIS 2024</title>
    </head>
    <body>
        <%
                ArrayList<Athlete> lesAthletes = (ArrayList)request.getAttribute("pLesAthletes");
        %>            
       
             <table>  
                <thead>
                    <tr>             
                        <th>id</th>
                        <th>nom</th>      
                        <th>prenom</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            for (Athlete a : lesAthletes)
                            {              
                                out.println("<tr><td>");
                                out.println(a.getId());
                                out.println("</td>");

                                out.println("<td>");
                                out.println(a.getNom());
                                out.println("</td>");;     
                                
                                out.println("<td>");
                                out.println(a.getPrenom());
                                out.println("</td>");;    
                            }
                        %>
                    </tr>
                </tbody>
            </table>
</html>