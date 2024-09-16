/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.paris2024.model;

import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author zakina
 */
public class Athlete {
    
    private int id;
    private String nom ;
    private Pays pays ;
    private String prenom;
    private LocalDate dateNaiss;
    private String urlImage; // Ajoutez cet attribut
    private Sport sport;
    private ArrayList<Epreuve> lesEpreuves;
 
    public Athlete() {
    }

    public Athlete(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public Athlete(int id, String nom, Pays pays, String prenom, LocalDate dateNaiss, String urlImage) {
        this.id = id;
        this.nom = nom;
        this.pays = pays;
        this.prenom = prenom;
        this.dateNaiss = dateNaiss;
        this.urlImage = urlImage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Pays getPays() {
        return pays;
    }

    public void setPays(Pays pays) {
        this.pays = pays;
    }

    public String getPrenom() {
        return prenom;
    }

    public LocalDate getDateNaiss() {
        return dateNaiss;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setDateNaiss(LocalDate dateNaiss) {
        this.dateNaiss = dateNaiss;
    }       

    public Sport getSport() {
        return sport;
    }

    public void setSport(Sport sport) {
        this.sport = sport;
    }

    public ArrayList<Epreuve> getLesEpreuves() {
        return lesEpreuves;
    }

    public void setLesEpreuves(ArrayList<Epreuve> lesEpreuves) {
        this.lesEpreuves = lesEpreuves;
    }
    
    public void addUneEpreuve(Epreuve uneEpreuve){
        if (lesEpreuves == null){
            lesEpreuves = new ArrayList<Epreuve>();
        }
        lesEpreuves.add(uneEpreuve);
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }
}
