/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sio.paris2024.model;

import java.util.ArrayList;

/**
 *
 * @author SIO2
 */
public class Sport {
    
    private int id;
    private String nom ;
    private String urlImage;
    private ArrayList<Athlete> lesAthletes;
    private ArrayList<Epreuve> lesEpreuves;

    public Sport() {
    }

    public Sport(int id) {
        this.id = id;
    }

    public Sport(int id, String nom, String urlImage) {
        this.id = id;
        this.nom = nom;
        this.urlImage = urlImage;
    }

    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public ArrayList<Athlete> getLesAthletes() {
        return lesAthletes;
    }

    public void setLesAthletes(ArrayList<Athlete> lesAthletes) {
        this.lesAthletes = lesAthletes;
    }
    
    public void addUnAthlete(Athlete unAthlete){
        if (lesAthletes == null){
            lesAthletes = new ArrayList<Athlete>();
        }
        lesAthletes.add(unAthlete);
    }

    public ArrayList<Epreuve> getLesEpreuves() {
        return lesEpreuves;
    }
    
    public void setLesEpreuves(ArrayList<Epreuve> lsEpreuves) {
        this.lesEpreuves = lsEpreuves;
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
