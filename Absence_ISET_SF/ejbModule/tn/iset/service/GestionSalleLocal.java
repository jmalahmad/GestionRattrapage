package tn.iset.service;

import java.util.List;

import javax.ejb.Local;

import tn.iset.model.Salle;

@Local
public interface GestionSalleLocal {
	List<Salle> findEmptySallByDate(String codeJour, int codeSeance);

	Salle findById(int numSall);
}
