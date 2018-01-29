package tn.iset.model;

import java.io.Serializable;

import javax.jms.JMSSessionMode;
import javax.persistence.*;
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.ArrayList;
import java.util.List;


/**
 * The persistent class for the mat database table.
 * 
 */
@Entity
@NamedQueries({ @NamedQuery(name = "Mat.findMatByEnseig", query = "SELECT m FROM Mat m "),
@NamedQuery(name="Mat.findAll", query="SELECT m FROM Mat m")})
public class Mat implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int COD_matiere;

	private String abv;

	private String nom_matiere;

	//bi-directional many-to-one association to Enseignement
//	@OneToMany(fetch = FetchType.EAGER, mappedBy="mat")
	@OneToMany(mappedBy="mat")
	@JsonIgnore
	private List<Enseignement> enseignements=new ArrayList<>();

	public Mat() {
	}

	public int getCOD_matiere() {
		return this.COD_matiere;
	}

	public void setCOD_matiere(int COD_matiere) {
		this.COD_matiere = COD_matiere;
	}

	public String getAbv() {
		return this.abv;
	}

	public void setAbv(String abv) {
		this.abv = abv;
	}

	public String getNom_matiere() {
		return this.nom_matiere;
	}

	public void setNom_matiere(String nom_matiere) {
		this.nom_matiere = nom_matiere;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setMat(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setMat(null);

		return enseignement;
	}

}