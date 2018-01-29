package tn.iset.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import tn.iset.model.Pointage;
import tn.iset.model.dto.AbsenceDTO;

/**
 * Session Bean implementation class GestionPointage
 */
@Stateless
@Path("/GestionPointage")
@Produces(MediaType.APPLICATION_JSON)
public class GestionPointage implements GestionPointageLocal {

    /**
     * Default constructor. 
     */
    public GestionPointage() {
        // TODO Auto-generated constructor stub
    }
    
    @PersistenceContext
	private EntityManager em;

	@Override
	public void saveAll(ArrayList<Pointage> poi) {
		if(!poi.isEmpty())
		removeAllByEnseignementDate(poi.get(0).getDate());
		for (Pointage pointage : poi) {
			if((pointage.getEnseignement()!=null && findByDateEnseig(pointage.getDate(), pointage.getEnseignement().getIdBase())==null)
					||(pointage.getRatrappage()!=null && findByDateEnseig(pointage.getDate(), pointage.getRatrappage().getIdRat())==null))
			em.persist(pointage);
		}
		
	}
	private void removeAllByEnseignementDate(Date date) {
		Query query=em.createNamedQuery("Pointage.removeAllByEnseignementDate");
		query.setParameter("date", date);
		query.executeUpdate();
	}

	

	@Override
	public Pointage update(Pointage p) {
		return em.merge(p);
	}
	
	
	@GET
	@Override
	@Path("/findPointageByEnseig/{COD_enseig}")
	public List<Pointage> findByEnseignant(@PathParam("COD_enseig") int COD_enseig ) {
		Query query=em.createNamedQuery("Pointage.findFromEnseignByEnseignant");
		query.setParameter("COD_enseig", COD_enseig);
		List<Pointage>listPointage=query.getResultList();
		query=em.createNamedQuery("Pointage.findFromRatByEnseignant");
		query.setParameter("COD_enseig", COD_enseig);
		listPointage.addAll(query.getResultList());
		if(listPointage.isEmpty())
		return null;
		return listPointage;
	}
	
	public Pointage findByDateEnseig(Date date, int idBase) {
		Query query=em.createNamedQuery("Pointage.findByDateEnseig");
		query.setParameter("date", date);
		query.setParameter("idBase", idBase);
		List<Pointage>listPointage=query.getResultList();
		if(listPointage.isEmpty())
		return null;
		return listPointage.get(0);
	}
	public Pointage findByDateRate(Date date, int idRat) {
		Query query=em.createNamedQuery("Pointage.findByDateRat");
		query.setParameter("date", date);
		query.setParameter("idRat", idRat);
		List<Pointage>listPointage=query.getResultList();
		if(listPointage.isEmpty())
		return null;
		return listPointage.get(0);
	}

	@Override
	public List<AbsenceDTO> findAbsenceByDateRang(Object dateFormatDeb, Date dateFormatFin) {
		Query query=em.createNamedQuery("Pointage.findAbsenceEnseignByDateRang");
		query.setParameter("dateDeb", dateFormatDeb);
		query.setParameter("dateFin", dateFormatFin);
		List<AbsenceDTO>listPointageEnseig=query.getResultList();
		query=em.createNamedQuery("Pointage.findAbsenceRatByDateRang");
		query.setParameter("dateDeb", dateFormatDeb);
		query.setParameter("dateFin", dateFormatFin);
		List<AbsenceDTO>listPointageRat=query.getResultList();
		listPointageEnseig.addAll(listPointageRat);
		return listPointageEnseig;
	}
	@Override
	public Pointage findById(int numPointage) {
		// TODO Auto-generated method stub
		return em.find(Pointage.class, numPointage);
	}

}
