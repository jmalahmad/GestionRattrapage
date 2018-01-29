package tn.iset.model.dto;

import java.io.Serializable;
import java.util.List;

import tn.iset.model.Dep;
import tn.iset.model.Enseig;
import tn.iset.model.Jour;
import tn.iset.model.Mat;
import tn.iset.model.Niveaux;
import tn.iset.model.Pointage;
import tn.iset.model.Salle;
import tn.iset.model.Seance;


/**
 * The persistent class for the enseignement database table.
 * 
 */

public class EnseignementDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	//check whether enseignement is Ratrappage
	private boolean ratrappage;

	private int idBase;

	private int pointage;

	public int getPointage() {
		return pointage;
	}

	public void setPointage(int pointage) {
		this.pointage = pointage;
	}

	private int annee1;

	private int cours;

	private int module;

	private int par15;

	private int semestre1;

	private Enseig ensig;

	private Niveaux niveaux;

	private Salle salle;

	private Jour jour;

	private Seance seance;

	private Dep dep;

	private Mat mat;

	private List<Pointage> pointages;

	public EnseignementDTO() {
	}
	
	
	

	public EnseignementDTO(int idBase, int annee1, int cours, int module, int par15, int semestre1,
			Enseig ensig, Niveaux niveaux, Salle salle, Jour jour, Seance seance, Dep dep, Mat mat,
			List<Pointage> pointages, boolean isRatrappage) {
		super();
		this.idBase = idBase;
		this.annee1 = annee1;
		this.cours = cours;
		this.module = module;
		this.par15 = par15;
		this.semestre1 = semestre1;
		this.ensig = ensig;
		this.niveaux = niveaux;
		this.salle = salle;
		this.jour = jour;
		this.seance = seance;
		this.dep = dep;
		this.mat = mat;
		this.pointages = pointages;
		this.ratrappage=isRatrappage;
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

	public Enseig getEnsig() {
		return this.ensig;
	}

	public void setEnsig(Enseig ensig) {
		this.ensig = ensig;
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

	public boolean isRatrappage() {
		return ratrappage;
	}

	public void setRatrappage(boolean ratrappage) {
		this.ratrappage = ratrappage;
	}


}