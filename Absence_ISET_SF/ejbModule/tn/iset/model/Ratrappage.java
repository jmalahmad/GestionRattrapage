package tn.iset.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the enseignement database table.
 * 
 */

@Entity
@NamedQueries({ @NamedQuery(name = "Ratrappage.findAll", query = "SELECT r FROM Ratrappage r"),
		@NamedQuery(name = "Ratrappage.findRatByDateandEnseig", query = "SELECT r FROM Ratrappage r where r.dateRattrapage=:dateAbs and r.enseignement.idBase=:codeEnseig and r.cloture=:cloture"),
		@NamedQuery(name = "Ratrappage.findByDateSeance", query = "SELECT r FROM Ratrappage r where r.seance.COD_senace=:seance and r.dateRattrapage=:jour and r.cloture is False") })
public class Ratrappage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name = "mySeqGen", sequenceName = "mySeq", initialValue = 2500, allocationSize = 100)
	@GeneratedValue(generator = "mySeqGen")
	private int idRat;

	
	//Date de la seance ratee
	@Column(name = "dateSeance")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateSeance;

	//Date du ratrappage prevu
	@Column(name = "dateRattrapage")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateRattrapage;

	
	//Date de la seance d'origine
	@Column(name = "dateSeanceOrigine")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateSeanceOrigine;

	@Column(name = "dateEnregistrementOperateur")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateEnregistrementOperateur;

	// bi-directional many-to-one association to Salle
	@ManyToOne
	@JoinColumn(name = "COD_salle")
	private Salle salle;

	@ManyToOne
	private Enseignement enseignement;

	@OneToOne
	private Ratrappage ratDuRat;

	private boolean cloture;

	// bi-directional many-to-one association to Seance
	@ManyToOne
	@JoinColumn(name = "COD_senace")
	private Seance seance;

	private String type;

	public Ratrappage() {
	}

	public Ratrappage(Date dateSeance, Date dateRattrapage, Enseignement enseignement, Seance seance, String type) {
		super();
		this.dateSeance = dateSeance;
		this.dateRattrapage = dateRattrapage;
		this.enseignement = enseignement;
		this.seance = seance;
		this.setType(type);
	}

	public Ratrappage(Date dateSeanceOrigine, Date dateRatrappageRate, Date dateNouveauRattrapage,
			Date dateEnregistrementOperateur, Salle salle, Enseignement enseignement, Ratrappage ratDuRat,
			boolean cloture, Seance seance, String type) {
		super();
		this.dateSeance = dateRatrappageRate;
		this.dateRattrapage = dateNouveauRattrapage;
		this.dateSeanceOrigine = dateSeanceOrigine;
		this.dateEnregistrementOperateur = dateEnregistrementOperateur;
		this.salle = salle;
		this.enseignement = enseignement;
		this.ratDuRat = ratDuRat;
		this.cloture = cloture;
		this.seance = seance;
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getIdRat() {
		return idRat;
	}

	public void setIdRat(int idRat) {
		this.idRat = idRat;
	}

	public Date getDateSeance() {
		return dateSeance;
	}

	public void setDateSeance(Date dateSeance) {
		this.dateSeance = dateSeance;
	}

	public Date getDateRattrapage() {
		return dateRattrapage;
	}

	public void setDateRattrapage(Date dateRattrapage) {
		this.dateRattrapage = dateRattrapage;
	}

	public Enseignement getEnseignement() {
		return enseignement;
	}

	public void setEnseignement(Enseignement enseignement) {
		this.enseignement = enseignement;
	}

	public Seance getSeance() {
		return seance;
	}

	public void setSeance(Seance seance) {
		this.seance = seance;
	}

	public Date getDateSeanceOrigine() {
		return dateSeanceOrigine;
	}

	public void setDateSeanceOrigine(Date dateSeanceOrigine) {
		this.dateSeanceOrigine = dateSeanceOrigine;
	}

	public Date getDateEnregistrementOperateur() {
		return dateEnregistrementOperateur;
	}

	public void setDateEnregistrementOperateur(Date dateEnregistrementOperateur) {
		this.dateEnregistrementOperateur = dateEnregistrementOperateur;
	}

	public Ratrappage getRatDuRat() {
		return ratDuRat;
	}

	public void setRatDuRat(Ratrappage ratDuRat) {
		this.ratDuRat = ratDuRat;
	}

	public boolean isCloture() {
		return cloture;
	}

	public void setCloture(boolean cloture) {
		this.cloture = cloture;
	}

	public Salle getSalle() {
		return salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

}