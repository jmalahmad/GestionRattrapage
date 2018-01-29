package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;


/**
 * The persistent class for the salles database table.
 * 
 */
@Entity
@Table(name="salles")
@NamedQueries({ @NamedQuery(name="Salle.findAll", query="SELECT s FROM Salle s"),
@NamedQuery(name="Salle.findEmptySallByDate", query="SELECT s FROM Salle s where s.COD_salle not in (select distinct room.COD_salle from Salle room , Enseignement e where (e.seance.COD_senace=:seance1 or e.seance.COD_senace=:seance2  or e.seance.COD_senace=:seance3 ) and e.jour.codJour=:jour and e.salle.COD_salle=room.COD_salle ) order by s.nomSalle ")})
public class Salle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int COD_salle;

	@Column(name="nom_salle")
	private String nomSalle;

	//bi-directional many-to-one association to Enseignement
	@OneToMany(mappedBy="salle")
	@JsonIgnore
	private List<Enseignement> enseignements;

	public Salle() {
	}

	public int getCOD_salle() {
		return this.COD_salle;
	}

	public void setCOD_salle(int COD_salle) {
		this.COD_salle = COD_salle;
	}

	public String getNomSalle() {
		return this.nomSalle;
	}

	public void setNomSalle(String nomSalle) {
		this.nomSalle = nomSalle;
	}

	public List<Enseignement> getEnseignements() {
		return this.enseignements;
	}

	public void setEnseignements(List<Enseignement> enseignements) {
		this.enseignements = enseignements;
	}

	public Enseignement addEnseignement(Enseignement enseignement) {
		getEnseignements().add(enseignement);
		enseignement.setSalle(this);

		return enseignement;
	}

	public Enseignement removeEnseignement(Enseignement enseignement) {
		getEnseignements().remove(enseignement);
		enseignement.setSalle(null);

		return enseignement;
	}

}