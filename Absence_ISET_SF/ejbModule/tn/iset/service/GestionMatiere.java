package tn.iset.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import tn.iset.model.Mat;

/**
 * Session Bean implementation class GestionMatiere
 */
@Stateless
@Path("/GestionMatiere")
@Produces(MediaType.APPLICATION_JSON)
public class GestionMatiere implements GestionMatiereLocal {

    /**
     * Default constructor. 
     */
    public GestionMatiere() {
        // TODO Auto-generated constructor stub
    }

    @PersistenceContext
    private EntityManager em;
    
	@GET
    @Override
	@Path("/getMatByEnseig/{idEns}")
	public List<Mat> getMatByEnseig(@PathParam("idEns") int idEns) {
		List<Mat> resultList = (List<Mat>)em.createNamedQuery("Mat.findMatByEnseig").setParameter("idEns", idEns).getResultList();
		List<Mat> listMat = resultList;
		return listMat;
	}
    
}
