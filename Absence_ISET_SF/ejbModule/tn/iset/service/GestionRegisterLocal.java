package tn.iset.service;

import javax.ejb.Local;
import tn.iset.model.Registre;

@Local
public interface GestionRegisterLocal {
	Registre findByEmailPassword(String login, String password );

	Registre save(Registre registre);

	Registre findByEmail(String email);
}
