package tn.iset.model.util;

import java.util.ArrayList;
import java.util.List;

import tn.iset.model.Enseignement;
import tn.iset.model.Jour;
import tn.iset.model.Ratrappage;
import tn.iset.model.dto.EnseignementDTO;

public class EnseignementUtil {
	public static EnseignementDTO enseignementToEnseignementDTO(Enseignement ens) {
		EnseignementDTO ensDTO = new EnseignementDTO(ens.getIdBase(), ens.getAnnee1(), ens.getCours(), ens.getModule(),
				ens.getPar15(), ens.getSemestre1(), ens.getEnseig(), ens.getNiveaux(), ens.getSalle(), ens.getJour(),
				ens.getSeance(), ens.getDep(), ens.getMat(), ens.getPointages(), false);
		return ensDTO;
	}
	public static List<EnseignementDTO> enseignementsToEnseignementDTO(List<Enseignement> enseignements) {
		List<EnseignementDTO> ensDTO = new ArrayList<>();
		for (Enseignement ens : enseignements) {
			ensDTO.add(enseignementToEnseignementDTO(ens));
		}
		return ensDTO ;
	}
	public static EnseignementDTO ratrappageToEnseignementDTO(Ratrappage rat) {
		String[] jours = {"Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"};
		Enseignement enseignement = findEnseignementFromRatrappage(rat);
		EnseignementDTO ensDTO = new EnseignementDTO(rat.getIdRat(), enseignement.getAnnee1(), enseignement.getCours(), enseignement.getModule(),
				enseignement.getPar15(), enseignement.getSemestre1(), enseignement.getEnseig(), enseignement.getNiveaux(), rat.getSalle(), new Jour(rat.getDateRattrapage().getDay(), jours[rat.getDateRattrapage().getDay()]),
				rat.getSeance(), enseignement.getDep(), enseignement.getMat(), enseignement.getPointages(),true);
		return ensDTO;
	}
	private static Enseignement findEnseignementFromRatrappage(Ratrappage rat) {
		if(rat.getEnseignement()==null)
			return findEnseignementFromRatrappage(rat.getRatDuRat());
		return rat.getEnseignement();
	}
	public static List<EnseignementDTO> ratrappagesToEnseignementDTO(List<Ratrappage> ratrappages) {
		List<EnseignementDTO> ensDTO = new ArrayList<>();
		for (Ratrappage ens : ratrappages) {
			ensDTO.add(ratrappageToEnseignementDTO(ens));
		}
		return ensDTO ;
	}
}
