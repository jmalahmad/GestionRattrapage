package tn.iset.service;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import tn.iset.model.Registre;

/**
 * Session Bean implementation class GestionRegister
 */
@Stateless
@LocalBean
public class GestionRegister implements GestionRegisterLocal {

	/**
	 * Default constructor.
	 */
	public GestionRegister() {
		// TODO Auto-generated constructor stub
	}

	@PersistenceContext
	private EntityManager em;

	@Override
	public Registre findByEmailPassword(String login, String password) {
		Query query = em.createNamedQuery("Registre.findByEmailPassword");
		query.setParameter("login", login);
		query.setParameter("password", password);
		List<Registre> listeReg = query.getResultList();
		if (!listeReg.isEmpty())
			return listeReg.get(0);
		else
			return null;
	}

	@Override
	public Registre save(Registre registre) {
		return  em.merge(registre);
	}

	@Override
	public Registre findByEmail(String email) {
		return em.find(Registre.class, email);
	}

}
