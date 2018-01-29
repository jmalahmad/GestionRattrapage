package tn.iset.service;

import java.util.List;

import javax.ejb.Local;

import tn.iset.model.Seance;

@Local
public interface GestionSeanceLocal {

	List<Seance> getAll();
	Seance findById(int idSeance);
	

}
