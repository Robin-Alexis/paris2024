/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sio.paris2024.servlet;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sio.paris2024.database.DaoEpreuve;
import sio.paris2024.database.DaoSport;
import sio.paris2024.form.FormEpreuve;
import sio.paris2024.model.Athlete;
import sio.paris2024.model.Epreuve;
import sio.paris2024.model.Sport;

/**
 *
 * @author SIO2
 */
public class ServletEpreuve extends HttpServlet {
    
    Connection cnx ;
    
    @Override
    public void init()
    {     
        ServletContext servletContext=getServletContext();
        
        System.out.println("SERVLKET CONTEXT=" + servletContext.getContextPath());
        cnx = (Connection)servletContext.getAttribute("connection"); 
        
        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(ServletSport.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEpreuve</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEpreuve at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = request.getRequestURI();  
        
        
        if(url.equals("/paris2024/ServletEpreuve/consulter"))
        { 
            int idEpreuve = Integer.parseInt((String)request.getParameter("idEpreuve"));
            
            ArrayList<Athlete> lesAthletes = null;
            try {
                lesAthletes = DaoEpreuve.getLesAthletesEpreuveById(cnx, idEpreuve);
            } catch (SQLException ex) {
                Logger.getLogger(ServletSport.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("pLesAthletes", lesAthletes);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
           getServletContext().getRequestDispatcher("/vues/epreuve/consulterEpreuve.jsp").forward(request, response);
        }
        
        if(url.equals("/paris2024/ServletEpreuve/ajouter"))
        {                   
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            this.getServletContext().getRequestDispatcher("/vues/epreuve/ajouterEpreuve.jsp" ).forward( request, response );
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        FormEpreuve form = new FormEpreuve();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Epreuve epv = form.ajouterEpreuve(request);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pEpreuve", epv );
		
        if (form.getErreurs().isEmpty()){
            Epreuve epreuveInsere =  DaoEpreuve.addEpreuve(cnx, epv);
            if (epreuveInsere != null ){
                request.setAttribute( "pEpreuve", epreuveInsere );
                getServletContext().getRequestDispatcher("/vues/epreuve/consulterEpreuve.jsp").forward(request, response);
            }
            else 
            {
                // Cas oùl'insertion en bdd a échoué
                //renvoyer vers une page d'erreur 
            }
           
        }
        else
        { 
            // il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            this.getServletContext().getRequestDispatcher("/vues/epreuve/ajouterEpreuve.jsp" ).forward( request, response );
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}