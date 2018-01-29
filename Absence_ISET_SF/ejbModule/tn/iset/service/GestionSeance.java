package tn.iset.service;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import tn.iset.model.Registre;
import tn.iset.model.Seance;

/**
 * Session Bean implementation class GestionSeance
 */
@Stateless
@LocalBean
public class GestionSeance implements GestionSeanceLocal {

	@PersistenceContext
	private EntityManager em;

	/**
	 * Default constructor.
	 */
	public GestionSeance() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Seance> getAll() {
		Query query = em.createNamedQuery("Seance.findAll");
		List<Seance> listeSeance = query.getResultList();
		return listeSeance;
	}

	@Override
	public Seance findById(int idSeance) {
		// TODO Auto-generated method stub
		return em.find(Seance.class, idSeance);
	}

}
