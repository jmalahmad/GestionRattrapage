package tn.iset.service;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import tn.iset.model.Ratrappage;
import tn.iset.model.Salle;

/**
 * Session Bean implementation class GestionRatrappage
 */
@Stateless
public class GestionRatrappage implements GestionRatrappageLocal {

	/**
	 * Default constructor.
	 */
	public GestionRatrappage() {
		// TODO Auto-generated constructor stub
	}

	@PersistenceContext
	private EntityManager em;

	@Override
	public Ratrappage save(Ratrappage ratrappage) {
		return em.merge(ratrappage);

	}

	@Override
	public Ratrappage findById(int idRat) {
		return em.find(Ratrappage.class, idRat);
	}

	@Override
	public Ratrappage findByDateAbsNotRatrapped(Date laDateAbs, int codeEnseig) {
		Query query = em.createNamedQuery("Ratrappage.findRatByDateandEnseig");
		Ratrappage ratrappage = null;
		List<Ratrappage> listRat = query.setParameter("dateAbs", laDateAbs).setParameter("codeEnseig", codeEnseig).setParameter("cloture", Boolean.TRUE).getResultList();
		if (listRat!=null && !listRat.isEmpty())
		ratrappage = listRat.get(0);
		return ratrappage;
	}

	@Override
	public void update(Ratrappage ratrappage) {
		em.merge(ratrappage);
		
	}

}
