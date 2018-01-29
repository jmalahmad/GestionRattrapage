package tn.iset.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * The persistent class for the pointage database table.
 * 
 */
@Entity
@NamedQueries(value = { @NamedQuery(name = "Pointage.findAll", query = "SELECT p FROM Pointage p"),
		@NamedQuery(name = "Pointage.removeAllByEnseignementDate", query = "DELETE FROM Pointage p WHERE p.date=:date "),
		@NamedQuery(name = "Pointage.findByDateEnseig", query = "SELECT p FROM Pointage p where p.date=:date and (p.enseignement.idBase=:idBase or p.ratrappage.idRat=:idBase)"),
		@NamedQuery(name = "Pointage.findByDateRat", query = "SELECT p FROM Pointage p where p.date=:date and p.ratrappage.idRat=:idRat"),
		@NamedQuery(name = "Pointage.findAbsenceEnseignByDateRang", query = "SELECT NEW tn.iset.model.dto.AbsenceDTO(p.enseignement.enseig.nomEnsi,p.enseignement.salle.nomSalle, p.enseignement.niveaux.nom_niveau,p.enseignement.seance.nomSeance) "
                + "FROM Pointage p where (p.date BETWEEN :dateDeb and :dateFin) and p.regularise is false"),
		@NamedQuery(name = "Pointage.findAbsenceRatByDateRang", query = "SELECT NEW tn.iset.model.dto.AbsenceDTO(p.ratrappage.enseignement.enseig.nomEnsi,p.ratrappage.enseignement.salle.nomSalle, p.ratrappage.enseignement.niveaux.nom_niveau,p.ratrappage.enseignement.seance.nomSeance) "
        + "FROM Pointage p  where (p.date BETWEEN :dateDeb and :dateFin)  and p.regularise is false"),
		@NamedQuery(name = "Pointage.findFromEnseignByEnseignant", query = "SELECT p FROM Pointage p where p.enseignement.enseig.COD_enseig=:COD_enseig  and regularise is false"),
		@NamedQuery(name = "Pointage.findFromRatByEnseignant", query = "SELECT p FROM Pointage p where p.ratrappage.enseignement.enseig.COD_enseig=:COD_enseig and regularise is false")
		

})

public class Pointage implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idPointage;

	@Column(name = "dateSeanceOrigine")
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@Column(name = "dateSaisieOperateur")
	@Temporal(TemporalType.TIMESTAMP)
	private Date datePointage;

	
	private boolean regularise;
	
	public Date getDatePointage() {
		return datePointage;
	}

	public void setDatePointage(Date datePointage) {
		this.datePointage = datePointage;
	}

	// bi-directional many-to-one association to Enseignement
	@ManyToOne
	private Enseignement enseignement;

	// bi-directional many-to-one association to Enseignement
	@ManyToOne
	private Ratrappage ratrappage;

	public Pointage() {
	}

	public int getIdPointage() {
		return this.idPointage;
	}

	public void setIdPointage(int idPointage) {
		this.idPointage = idPointage;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Enseignement getEnseignement() {
		return this.enseignement;
	}

	public Ratrappage getRatrappage() {
		return ratrappage;
	}

	public void setRatrappage(Ratrappage ratrappage) {
		this.ratrappage = ratrappage;
	}

	public void setEnseignement(Enseignement enseignement) {
		this.enseignement = enseignement;
	}

	public boolean isRegularise() {
		return regularise;
	}

	public void setRegularise(boolean regularise) {
		this.regularise = regularise;
	}

}