package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the dep database table.
 * 
 */
@Entity
@NamedQuery(name="Dep.findAll", query="SELECT d FROM Dep d")
public class Dep implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int COD_dep;

	@Column(name="nom_dep")
	private String nomDep;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="dep")
	private List<Enseignement> enseignements;

	public Dep() {
	}

	public int getCOD_dep() {
		return this.COD_dep;
	}

	public void setCOD_dep(int COD_dep) {
		this.COD_dep = COD_dep;
	}

	public String getNomDep() {
		return this.nomDep;
	}

	public void setNomDep(String nomDep) {
		this.nomDep = nomDep;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setDep(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setDep(null);

		return enseignement;
	}

}