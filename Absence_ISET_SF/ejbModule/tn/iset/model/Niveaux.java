package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;


/**
 * The persistent class for the niveaux database table.
 * 
 */
@Entity
@NamedQuery(name="Niveaux.findAll", query="SELECT n FROM Niveaux n")
public class Niveaux implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="COD_NIVEAU")
	private int codNiveau;

	private String nom_niveau;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="niveaux")
	@JsonIgnore
	private List<Enseignement> enseignements;

	public Niveaux() {
	}

	public int getCodNiveau() {
		return this.codNiveau;
	}

	public void setCodNiveau(int codNiveau) {
		this.codNiveau = codNiveau;
	}

	public String getNom_niveau() {
		return this.nom_niveau;
	}

	public void setNom_niveau(String nom_niveau) {
		this.nom_niveau = nom_niveau;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setNiveaux(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setNiveaux(null);

		return enseignement;
	}

}