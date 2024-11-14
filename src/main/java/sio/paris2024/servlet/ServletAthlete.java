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
import jakarta.servlet.http.Part;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sio.paris2024.database.DaoAthlete;
import sio.paris2024.database.DaoSport;
import sio.paris2024.database.DaoPays;
import sio.paris2024.form.FormAthlete;
import sio.paris2024.model.Athlete;
import sio.paris2024.model.Pays;
import sio.paris2024.model.Sport;

/**
 *
 * @author zakina
 */
public class ServletAthlete extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    public static final int TAILLE_TAMPON = 10240;
    public static final String CHEMIN_FICHIERS = "C:\\Users\\alexi\\Desktop\\Projet JO2024\\paris2024\\src\\main\\webapp\\vues\\images\\"; // A changer
    
    
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
            Logger.getLogger(ServletAthlete.class.getName()).log(Level.SEVERE, null, ex);
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
            out.println("<title>Servlet ServletAthlete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAthlete at " + request.getContextPath() + "</h1>");
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
       
        // Récup et affichage les athletes 
        if(url.equals("/paris2024/ServletAthlete/lister"))
        {              
            ArrayList<Athlete> lesAthletes = DaoAthlete.getLesAthletes(cnx);
            request.setAttribute("pLesAthletes", lesAthletes);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
           getServletContext().getRequestDispatcher("/vues/athlete/listerAthletes.jsp").forward(request, response);
        }
        
        if(url.equals("/paris2024/ServletAthlete/consulter"))
        { 
            int idAthlete = Integer.parseInt((String)request.getParameter("idAthlete"));
            Athlete a = DaoAthlete.getAthleteById(cnx, idAthlete);
            request.setAttribute("pAthlete", a);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
           getServletContext().getRequestDispatcher("/vues/athlete/consulterAthlete.jsp").forward(request, response);
        }
        
          if(url.equals("/paris2024/ServletAthlete/ajouter"))
        {                   
            ArrayList<Pays> lesPays = DaoPays.getLesPays(cnx);
            request.setAttribute("pLesPays", lesPays);
            
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            
            this.getServletContext().getRequestDispatcher("/vues/athlete/ajouterAthlete.jsp" ).forward( request, response );
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
             
        
        FormAthlete form = new FormAthlete();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Athlete ath = form.ajouterAthlete(request);
        
         // On récupère le champ du fichier
        Part part = request.getPart("fichier");
            
        // On vérifie qu'on a bien reçu un fichier
        String nomFichier = getNomFichier(part);
        
        // Si on a bien un fichier
        if (nomFichier != null && !nomFichier.isEmpty()) {
        // Traitement du fichier
            nomFichier = nomFichier.substring(nomFichier.lastIndexOf('/') + 1)
                   .substring(nomFichier.lastIndexOf('\\') + 1);
            ecrireFichier(part, nomFichier, CHEMIN_FICHIERS);

            // Stocker le nom du fichier dans l'objet ath
            ath.setUrlImage(nomFichier);
        }
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pAthlete", ath );
		
        if (form.getErreurs().isEmpty()){
            Athlete athleteInsere =  DaoAthlete.addAthlete(cnx, ath);
            if (athleteInsere != null ){
                request.setAttribute( "pAthlete", athleteInsere );
                this.getServletContext().getRequestDispatcher("/vues/athlete/consulterAthlete.jsp" ).forward( request, response );
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
            ArrayList<Pays> lesCasernes = DaoPays.getLesPays(cnx);
            request.setAttribute("pLesPays", lesCasernes);
            
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            
            
            this.getServletContext().getRequestDispatcher("/vues/athlete/ajouterAthlete.jsp" ).forward( request, response );
        }
        
        
        
        
        
        
        
    }
    
        
    private void ecrireFichier(Part part, String nomFichier, String chemin) throws IOException {
        BufferedInputStream entree = null;
        BufferedOutputStream sortie = null;
        try {
            entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
            sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin + nomFichier)), TAILLE_TAMPON);

            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        } finally {
            // Assurez-vous de fermer les flux dans le bloc finally pour éviter les fuites de ressources
            if (sortie != null) {
                try {
                    sortie.close();
                } catch (IOException e) {
                    // Log l'erreur
                    e.printStackTrace();
                }
            }
            if (entree != null) {
                try {
                    entree.close();
                } catch (IOException e) {
                    // Log l'erreur
                    e.printStackTrace();
                }
            }
        }
    }

    private static String getNomFichier( Part part ) {
        for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( contentDisposition.trim().startsWith( "filename" ) ) {
                return contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
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
