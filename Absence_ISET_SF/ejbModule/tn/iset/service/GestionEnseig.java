package tn.iset.service;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import tn.iset.model.Enseig;

/**
 * Session Bean implementation class GestionEnseig
 */
@Stateless
public class GestionEnseig implements GestionEnseigLocal {

    /**
     * Default constructor. 
     */
    public GestionEnseig() {
        // TODO Auto-generated constructor stub
    }
    
    @PersistenceContext 
    private EntityManager em;

	@Override
	public ArrayList<Enseig> getAll() {
		Query query = em.createNamedQuery("Enseig.findAll");
		return (ArrayList<Enseig>) query.getResultList();
	}

}
