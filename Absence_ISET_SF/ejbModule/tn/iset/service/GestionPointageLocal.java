package tn.iset.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Local;

import tn.iset.model.Pointage;
import tn.iset.model.dto.AbsenceDTO;

@Local
public interface GestionPointageLocal {

	void saveAll(ArrayList<Pointage> poi);
	Pointage findByDateEnseig(Date date, int idBase);
	List<AbsenceDTO> findAbsenceByDateRang(Object dateFormatDeb, Date dateFormatFin);
	List<Pointage> findByEnseignant(int COD_enseig);
	Pointage update(Pointage p);
	Pointage findById(int numPointage);

}
