/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.paris2024.form;

import jakarta.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import sio.paris2024.model.Athlete;
import sio.paris2024.model.Pays;
import sio.paris2024.model.Sport;

/**
 *
 * @author zakina
 */
public class FormAthlete {
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }
    
    //méthode de validation du champ de saisie nom
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
        throw new Exception( "Le nom d'athlete doit contenir au moins 3 caractères." );
        }
    }

    private void setErreur( String champ, String message ) {
    erreurs.put(champ, message );
    }    
    
    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }   
    }
    
    
    public Athlete ajouterAthlete(HttpServletRequest request) {
        Athlete ath = new Athlete();

        String nom = getDataForm(request, "nom");
        String prenom = getDataForm(request, "prenom");

        String dateNaissanceStr = getDataForm(request, "dateNaiss");
        LocalDate dateNaissance = null;

        if (dateNaissanceStr != null && !dateNaissanceStr.isEmpty()) {
            try {
                dateNaissance = LocalDate.parse(dateNaissanceStr);
            } catch (Exception e) {
                setErreur("dateNaiss", "La date de naissance est invalide.");
            }
        } else {
            setErreur("dateNaiss", "Veuillez renseigner une date de naissance.");
        }

        // Vérification pour idPays
        String idPaysStr = getDataForm(request, "idPays");
        int idPays = 0; // Valeur par défaut, si nécessaire
        if (idPaysStr != null && !idPaysStr.isEmpty()) {
            try {
                idPays = Integer.parseInt(idPaysStr);
            } catch (NumberFormatException e) {
                setErreur("idPays", "Le pays sélectionné est invalide.");
            }
        } else {
            setErreur("idPays", "Veuillez sélectionner un pays.");
        }

        // Vérification pour idSport
        String idSportStr = getDataForm(request, "idSport");
        int idSport = 0; // Valeur par défaut, si nécessaire
        if (idSportStr != null && !idSportStr.isEmpty()) {
            try {
                idSport = Integer.parseInt(idSportStr);
            } catch (NumberFormatException e) {
                setErreur("idSport", "Le sport sélectionné est invalide.");
            }
        } else {
            setErreur("idSport", "Veuillez sélectionner un sport.");
        }

        try {
            validationNom(nom);
        } catch (Exception e) {
            setErreur("nom", e.getMessage());
        }

        ath.setNom(nom);
        ath.setPrenom(prenom);
        ath.setDateNaiss(dateNaissance);

        if (erreurs.isEmpty()) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }

        Pays p = new Pays(idPays);
        Sport s = new Sport(idSport);
        ath.setPays(p);
        ath.setSport(s);

        return ath;
    }

}
