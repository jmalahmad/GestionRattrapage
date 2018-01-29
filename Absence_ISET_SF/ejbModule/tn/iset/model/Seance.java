package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;


/**
 * The persistent class for the seances database table.
 * 
 */
@Entity
@Table(name="seances")
@NamedQueries({ @NamedQuery(name="Seance.findAll", query="SELECT s FROM Seance s")	})

public class Seance implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int COD_senace;

	private String duree;

	@Column(name="nom_seance")
	private String nomSeance;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="seance")
	@JsonIgnore
	private List<Enseignement> enseignements;

	public Seance() {
	}

	public int getCOD_senace() {
		return this.COD_senace;
	}

	public void setCOD_senace(int COD_senace) {
		this.COD_senace = COD_senace;
	}

	public String getDuree() {
		return this.duree;
	}

	public void setDuree(String duree) {
		this.duree = duree;
	}

	public String getNomSeance() {
		return this.nomSeance;
	}

	public void setNomSeance(String nomSeance) {
		this.nomSeance = nomSeance;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setSeance(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setSeance(null);

		return enseignement;
	}

}