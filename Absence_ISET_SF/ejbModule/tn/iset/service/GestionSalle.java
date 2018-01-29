package tn.iset.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import tn.iset.model.Salle;
import tn.iset.model.Seance;

/**
 * Session Bean implementation class GestionSalle
 */
@Stateless
@Path("/GestionSalle")
@Produces(MediaType.APPLICATION_JSON)
public class GestionSalle implements GestionSalleLocal {

	/**
	 * Default constructor.
	 */
	public GestionSalle() {
		// TODO Auto-generated constructor stub
	}

	@PersistenceContext
	private EntityManager em;

	@GET
	@Override
	@Path("/findEmptySall/{jour}/{seance}")
	public List<Salle> findEmptySallByDate(@PathParam("jour") String jour, @PathParam("seance") int codeSeance1) {
		SimpleDateFormat dateformat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = null;
		try {
			date = dateformat.parse(jour);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int codeJour = date.getDay();
		Query query = em.createNamedQuery("Salle.findEmptySallByDate");
		int codeSeance2 = 0;
		int codeSeance3 = 0;
		switch (codeSeance1) {
		case 1:
			codeSeance2 = 7;
			break;
		case 2:
			codeSeance2 = 7;
			codeSeance3 = 8;
			break;
		case 3:
			codeSeance1 = 11;
			codeSeance2 = 8;
			break;
		case 4:
			codeSeance1 = 11;
			codeSeance2 = 9;
			break;
		case 5:
			codeSeance2 = 9;
			codeSeance3 = 10;
			break;
		case 6:
			codeSeance2 = 10;
			break;
		default:
			break;
		}
		List<Salle> listeSeance = query.setParameter("jour", codeJour).setParameter("seance1", codeSeance1)
				.setParameter("seance2", codeSeance2).setParameter("seance3", codeSeance3).getResultList();
		return listeSeance;
	}

	@Override
	public Salle findById(int numSall) {
		// TODO Auto-generated method stub
		return em.find(Salle.class, numSall);
	}

}
