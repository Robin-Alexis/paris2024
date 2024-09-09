/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.paris2024.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sio.paris2024.model.Epreuve;

/**
 *
 * @author SIO2
 */
public class DaoEpreuve {
        
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;
    
    public static ArrayList<Epreuve> getLesEpreuvesSportById(Connection cnx, int idSport) throws SQLException{
        ArrayList<Epreuve> lesEpreuves = new ArrayList<Epreuve>();
            try{
                requeteSql = cnx.prepareStatement("select e.id as e_id, e.nom as e_nom " + 
                        "from epreuve e " +
                        "inner join sport s " +
                        "on e.sport_id = s.id " +
                        "where s.id = ?;");
                requeteSql.setInt(1, idSport);
                resultatRequete = requeteSql.executeQuery();
                
                while(resultatRequete.next()){
                    Epreuve e = new Epreuve();
                    e.setId(resultatRequete.getInt("e_id"));
                    e.setNom(resultatRequete.getString("e_nom"));
                    
                    lesEpreuves.add(e);
                }
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("La requête de getLesEpreuvesSportById a généré une erreur");
            }
            return lesEpreuves;
    }
}
