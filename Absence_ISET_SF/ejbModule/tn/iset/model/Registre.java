package tn.iset.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the registre database table.
 * 
 */
@Entity
@NamedQueries(value={
@NamedQuery(name="Registre.findAll", query="SELECT r FROM Registre r"),
@NamedQuery(name="Registre.findByEmailPassword", query="SELECT r FROM Registre r where r.email=:login and r.password=:password")})
public class Registre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String email;

	private String datedenaissance;

	private String password;

	private String username;

	public Registre() {
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDatedenaissance() {
		return this.datedenaissance;
	}

	public void setDatedenaissance(String datedenaissance) {
		this.datedenaissance = datedenaissance;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}