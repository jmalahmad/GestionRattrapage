package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.Date;
import java.util.List;

/**
 * The persistent class for the enseignement database table.
 * 
 */
@Entity
@NamedQueries({ @NamedQuery(name = "Enseignement.findAll", query = "SELECT e FROM Enseignement e"),
		@NamedQuery(name = "Enseignement.findByDateSeance", query = "SELECT e FROM Enseignement e where e.seance.COD_senace=:seance and e.jour.codJour=:jour"),
		@NamedQuery(name = "Enseignement.findEnseignementByEns", query = "SELECT e FROM Enseignement e where e.enseig.COD_enseig=:idEns"),
		@NamedQuery(name = "Enseignement.findByNumPointage", query = "SELECT e FROM Enseignement e, Pointage p where e.idBase=p.enseignement.idBase and p.idPointage=:idPointage")

})
public class Enseignement implements Serializable {
	private static final long serialVersionUID = 1L;


	@Id
	private int idBase;



	
	private int annee1;

	private int cours;

	private int module;

	private int par15;

	private int semestre1;
	

	// bi-directional many-to-one association to Ensig
	@ManyToOne
	@JoinColumn(name = "COD_enseig")
	@JsonIgnore
	private Enseig enseig;

	// bi-directional many-to-one association to Niveaux
	@ManyToOne
	@JoinColumn(name = "COD_NIVEAU")
	private Niveaux niveaux;

	// bi-directional many-to-one association to Salle
	@ManyToOne
	@JoinColumn(name = "COD_salle")
	private Salle salle;

	// bi-directional many-to-one association to Jour
	@ManyToOne
	@JoinColumn(name = "cod_jour")
	private Jour jour;

	// bi-directional many-to-one association to Seance
	@ManyToOne
	@JoinColumn(name = "COD_senace")
	private Seance seance;

	// bi-directional many-to-one association to Dep
	@ManyToOne
	@JoinColumn(name = "COD_dep")
	@JsonIgnore
	private Dep dep;

	// bi-directional many-to-one association to Mat
	@ManyToOne
	@JoinColumn(name = "COD_mat")
	private Mat mat;

	// bi-directional many-to-one association to Pointage
	@OneToMany(mappedBy = "enseignement")
	@JsonIgnore
	private List<Pointage> pointages;

	public Enseignement() {
	}

	public int getIdBase() {
		return this.idBase;
	}

	public void setIdBase(int idBase) {
		this.idBase = idBase;
	}

	public int getAnnee1() {
		return this.annee1;
	}

	public void setAnnee1(int annee1) {
		this.annee1 = annee1;
	}

	public int getCours() {
		return this.cours;
	}

	public void setCours(int cours) {
		this.cours = cours;
	}

	public int getModule() {
		return this.module;
	}

	public void setModule(int module) {
		this.module = module;
	}

	public int getPar15() {
		return this.par15;
	}

	public void setPar15(int par15) {
		this.par15 = par15;
	}

	public int getSemestre1() {
		return this.semestre1;
	}

	public void setSemestre1(int semestre1) {
		this.semestre1 = semestre1;
	}

	public Enseig getEnseig() {
		return this.enseig;
	}

	public void setEnseig(Enseig enseig) {
		this.enseig = enseig;
	}

	public Niveaux getNiveaux() {
		return this.niveaux;
	}

	public void setNiveaux(Niveaux niveaux) {
		this.niveaux = niveaux;
	}

	public Salle getSalle() {
		return this.salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

	public Jour getJour() {
		return this.jour;
	}

	public void setJour(Jour jour) {
		this.jour = jour;
	}

	public Seance getSeance() {
		return this.seance;
	}

	public void setSeance(Seance seance) {
		this.seance = seance;
	}

	public Dep getDep() {
		return this.dep;
	}

	public void setDep(Dep dep) {
		this.dep = dep;
	}

	public Mat getMat() {
		return this.mat;
	}

	public void setMat(Mat mat) {
		this.mat = mat;
	}

	public List<Pointage> getPointages() {
		return this.pointages;
	}

	public void setPointages(List<Pointage> pointages) {
		this.pointages = pointages;
	}

	public Pointage addPointage(Pointage pointage) {
		getPointages().add(pointage);
		pointage.setEnseignement(this);

		return pointage;
	}

	public Pointage removePointage(Pointage pointage) {
		getPointages().remove(pointage);
		pointage.setEnseignement(null);

		return pointage;
	}



}