package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ensig database table.
 * 
 */
@Entity
@NamedQuery(name="Enseig.findAll", query="SELECT e FROM Enseig e  order by e.nomEnsi ")
public class Enseig implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int COD_enseig;

	@Column(name="nom_ensi")
	private String nomEnsi;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="enseig")
	private List<Enseignement> enseignements;

	public Enseig() {
	}

	public int getCOD_enseig() {
		return this.COD_enseig;
	}

	public void setCOD_enseig(int COD_enseig) {
		this.COD_enseig = COD_enseig;
	}

	public String getNomEnsi() {
		return this.nomEnsi;
	}

	public void setNomEnsi(String nomEnsi) {
		this.nomEnsi = nomEnsi;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setEnseig(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setEnseig(null);

		return enseignement;
	}

}