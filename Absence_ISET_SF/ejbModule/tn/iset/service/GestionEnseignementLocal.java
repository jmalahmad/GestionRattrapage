package tn.iset.service;

import java.util.ArrayList;
import java.util.Date;

import javax.ejb.Local;

import tn.iset.model.Enseignement;
import tn.iset.model.dto.EnseignementDTO;

@Local
public interface GestionEnseignementLocal {

	ArrayList<EnseignementDTO> findEnseigByDateSeances(Date date, int jour, int[] idSeances);

	Enseignement findById(int idBase);

	Enseignement saveRatrappage(Enseignement enseignement);

	ArrayList<Enseignement> getAll();

	ArrayList<EnseignementDTO> findRattrapageByDateSeances(Date date, Date jour, int[] seances);

	ArrayList<Enseignement> findEnseignementByEns(int idEns);

	Enseignement findByNumPointage(int numPointage);
}
