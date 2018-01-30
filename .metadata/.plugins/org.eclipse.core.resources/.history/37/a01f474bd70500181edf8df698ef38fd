package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the datever database table.
 * 
 */
@Entity
@NamedQuery(name="Datever.findAll", query="SELECT d FROM Datever d")
public class Datever implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idDateVer;

	private String dateVer;

	public Datever() {
	}

	public int getIdDateVer() {
		return this.idDateVer;
	}

	public void setIdDateVer(int idDateVer) {
		this.idDateVer = idDateVer;
	}

	public String getDateVer() {
		return this.dateVer;
	}

	public void setDateVer(String dateVer) {
		this.dateVer = dateVer;
	}

}