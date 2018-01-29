package tn.iset.model.dto;

public class AbsenceDTO {
private String nomEns;
private String nomSalle;
private String nomGroupe;
private String nomSeance;
public String getNomEns() {
	return nomEns;
}
public void setNomEns(String nomEns) {
	this.nomEns = nomEns;
}
public String getNomSalle() {
	return nomSalle;
}
public void setNomSalle(String nomSalle) {
	this.nomSalle = nomSalle;
}
public String getNomGroupe() {
	return nomGroupe;
}
public void setNomGroupe(String nomGroupe) {
	this.nomGroupe = nomGroupe;
}
public String getNomSeance() {
	return nomSeance;
}
public void setNomSeance(String nomSeance) {
	this.nomSeance = nomSeance;
}
public AbsenceDTO(String nomEns, String nomSalle, String nomGroupe, String nomSeance) {
	super();
	this.nomEns = nomEns;
	this.nomSalle = nomSalle;
	this.nomGroupe = nomGroupe;
	this.nomSeance = nomSeance;
}

}
