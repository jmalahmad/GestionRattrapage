package tn.iset.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import tn.iset.model.Enseignement;
import tn.iset.model.Ratrappage;
import tn.iset.model.dto.EnseignementDTO;
import tn.iset.model.util.EnseignementUtil;

/**
 * Session Bean implementation class GestionEnseignement
 */
@Stateless
@Path("/GestionEnseignement")
@Produces(MediaType.APPLICATION_JSON)
public class GestionEnseignement implements GestionEnseignementLocal {

	/**
	 * Default constructor.
	 */
	public GestionEnseignement() {
		// TODO Auto-generated constructor stub
	}

	@PersistenceContext
	private EntityManager em;

	@EJB
	private GestionPointageLocal pointageService;

	@Override
	public ArrayList<EnseignementDTO> findEnseigByDateSeances(Date date, int jour, int[] seances) {
		ArrayList<EnseignementDTO> listEnseig = new ArrayList<>();
		// TODO Auto-generated method stub
		for (int seance : seances) {
			Query query = em.createNamedQuery("Enseignement.findByDateSeance");
			query.setParameter("seance", seance);
			query.setParameter("jour", jour);
			List<Enseignement> lstEns = query.getResultList();
			List<EnseignementDTO> listEnsTransfert = EnseignementUtil.enseignementsToEnseignementDTO(lstEns);
			for (EnseignementDTO enseignement : listEnsTransfert) {
				if (pointageService.findByDateEnseig(date, enseignement.getIdBase()) != null)
					enseignement.setPointage(1);
			}
			listEnseig.addAll(listEnsTransfert);
			
		}
		return listEnseig;
	}

	@Override
	public Enseignement findById(int idBase) {
		return em.find(Enseignement.class, idBase);
	}

	@Override
	public ArrayList<Enseignement> getAll() {
		Query query = em.createNamedQuery("Enseignement.findAll");
		ArrayList<Enseignement> lstEns = (ArrayList<Enseignement>) query.getResultList();
		return lstEns;
	}

	@Override
	public Enseignement saveRatrappage(Enseignement enseignement) {
		// TODO Auto-generated method stub
		return em.merge(enseignement);
	}
	@Override
	public ArrayList<EnseignementDTO> findRattrapageByDateSeances(Date date, Date jour, int[] seances) {
			ArrayList<EnseignementDTO> listRatrappage = new ArrayList<>();
		// TODO Auto-generated method stub
		for (int seance : seances) {
			Query query = em.createNamedQuery("Ratrappage.findByDateSeance");
			query.setParameter("seance", seance);
			query.setParameter("jour", jour);
			List<Ratrappage> lstRat = query.getResultList();
			List<EnseignementDTO> listRatTransfert = EnseignementUtil.ratrappagesToEnseignementDTO(lstRat);
			for (EnseignementDTO enseignement : listRatTransfert) {
				if (pointageService.findByDateEnseig(date, enseignement.getIdBase()) != null)
					enseignement.setPointage(1);
			}
			listRatrappage.addAll(listRatTransfert);
			
		}
		return listRatrappage;
	}

	@GET
    @Override
	@Path("/findEnseignementByEns/{idEns}")
	public ArrayList<Enseignement> findEnseignementByEns(@PathParam("idEns") int idEns) {
		Query query = em.createNamedQuery("Enseignement.findEnseignementByEns");
		ArrayList<Enseignement> lstEns = (ArrayList<Enseignement>) query.setParameter("idEns", idEns).getResultList();
		return lstEns;
	}

	@Override
	public Enseignement findByNumPointage(int idPointage) {
		Query query = em.createNamedQuery("Enseignement.findByNumPointage");
		ArrayList<Enseignement> lstEns = (ArrayList<Enseignement>) query.setParameter("idPointage", idPointage).getResultList();
		if(lstEns==null || lstEns.isEmpty())
			return null;
		return lstEns.get(0);
	}

}
