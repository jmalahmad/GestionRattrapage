package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;


/**
 * The persistent class for the jours database table.
 * 
 */
@Entity
@Table(name="jours")
@NamedQuery(name="Jour.findAll", query="SELECT j FROM Jour j")
public class Jour implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="cod_jour")
	private int codJour;

	@Column(name="nom_jour")
	private String nomJour;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="jour")
	@JsonIgnore
	private List<Enseignement> enseignements;

	
	
	public Jour(int codJour, String nomJour) {
		super();
		this.codJour = codJour;
		this.nomJour = nomJour;
	}

	public Jour() {
	}

	public int getCodJour() {
		return this.codJour;
	}

	public void setCodJour(int codJour) {
		this.codJour = codJour;
	}

	public String getNomJour() {
		return this.nomJour;
	}

	public void setNomJour(String nomJour) {
		this.nomJour = nomJour;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setJour(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setJour(null);

		return enseignement;
	}

}