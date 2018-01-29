package tn.iset.controlor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iset.model.Enseig;
import tn.iset.model.Enseignement;
import tn.iset.model.Pointage;
import tn.iset.model.Ratrappage;
import tn.iset.model.Salle;
import tn.iset.service.GestionEnseigLocal;
import tn.iset.service.GestionEnseignementLocal;
import tn.iset.service.GestionPointageLocal;
import tn.iset.service.GestionRatrappageLocal;
import tn.iset.service.GestionSalleLocal;
import tn.iset.service.GestionSeanceLocal;

/**
 * Servlet implementation class GestionRattrapage
 */
@WebServlet("/GestionRattrapage")
public class GestionRattrapage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private GestionEnseignementLocal enseignementService;

	@EJB
	private GestionRatrappageLocal ratrappageService;

	@EJB
	private GestionSeanceLocal seanceService;

	@EJB
	private GestionEnseigLocal enseigService;

	@EJB
	private GestionSalleLocal salleService;

	@EJB
	private GestionPointageLocal pointageService;

	public GestionRattrapage() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if ("affich".equals(request.getParameter("action"))) {
			ArrayList<Enseig>  professorList = enseigService.getAll();
			//ArrayList<Enseignement> base = enseignementService.getAll();

			session.setAttribute("professorList", professorList);

			response.sendRedirect("/PrjIsetWeb/dali/rattrapage.jsp");
		} else if ("regularize".equals(request.getParameter("action"))) {
			ArrayList<Enseig>  professorList = enseigService.getAll();
			session.setAttribute("professorList", professorList);
			response.sendRedirect("/PrjIsetWeb/dali/regularisationAbsence.jsp");
		} else if ("save".equals(request.getParameter("action"))) {
			int numEnsig = Integer.parseInt(request.getParameter("idt"));
			int numSall = Integer.parseInt(request.getParameter("idtSalle"));
			int seance = Integer.parseInt(request.getParameter("se"));
			String type = request.getParameter("type");
			Enseignement enseignement = enseignementService.findById(numEnsig);
			Salle salle =  salleService.findById(numSall);
			int niv = enseignement.getNiveaux().getCodNiveau(); //
			String dateA = request.getParameter("dateAbs");
			String dateR = request.getParameter("dateRat");
			Date laDateRat = null;
			Date laDateAbs = null;
			try {
				laDateRat = parseDate(dateR, "dd/MM/yyyy");
				laDateAbs = parseDate(dateA, "dd/MM/yyyy");
			} catch (ParseException r) {

				r.printStackTrace();
			}
			int k = 0;
			Ratrappage ratrappage = null;
			if (laDateAbs.getDay() == enseignement.getJour().getCodJour()) {
			
				
			
			
				//sinon
				ratrappage = new Ratrappage(laDateAbs,laDateAbs, laDateRat, new Date(),salle,enseignement, null, false, seanceService.findById(seance),
						type);
				ratrappage = ratrappageService.save(ratrappage);
				session.setAttribute("rattrapage",ratrappage);
				response.sendRedirect("/PrjIsetWeb/dali/final.jsp");
			}
			else{ratrappage=ratrappageService.findByDateAbsNotRatrapped(laDateAbs, numEnsig);
				if(ratrappage!=null){
					//Todo??
					//Verifier a travers la date d'absence si c'est une absence de ratrappage
					//si cette date figure pour cet enseignement dans la table ratrappage
					Ratrappage newRatrappage = new Ratrappage(ratrappage.getDateSeanceOrigine(),laDateAbs, laDateRat, new Date(),salle,enseignement, ratrappage, false, seanceService.findById(seance),
							type);
					newRatrappage = ratrappageService.save(newRatrappage);
					ratrappage.setCloture(true);
					ratrappageService.update(ratrappage);
					session.setAttribute("rattrapage",newRatrappage);
					response.sendRedirect("/PrjIsetWeb/dali/final.jsp");
				}
				else
					response.sendRedirect("/PrjIsetWeb/dali/rattrapage.jsp");
			}
		}
		else if ("regularisation".equals(request.getParameter("action"))) {
			int numPointage = Integer.parseInt(request.getParameter("idt"));
			int numSall = Integer.parseInt(request.getParameter("idtSalle"));
			int seance = Integer.parseInt(request.getParameter("se"));
			Enseignement enseignement = enseignementService.findByNumPointage(numPointage);
			Salle salle = salleService.findById(numSall);
			String dateR = request.getParameter("dateRat");
			Date laDateRat = null;
			try {
				laDateRat = parseDate(dateR, "dd/MM/yyyy");
				
			} catch (ParseException r) {

				r.printStackTrace();
			}
			Pointage pointage = pointageService.findById(numPointage);
			Date laDateAbs = pointage.getDate();
			Ratrappage ratrappage = null;
			if (pointage.getEnseignement()!=null) {
			
				ratrappage = new Ratrappage(laDateAbs,laDateAbs, laDateRat, new Date(),salle,enseignement, null, false, seanceService.findById(seance),
						"");
				ratrappage = ratrappageService.save(ratrappage);
				
			}
			else
				if (pointage.getRatrappage()!=null) {
					
					ratrappage = new Ratrappage(laDateAbs,laDateAbs, laDateRat, new Date(),salle,null, pointage.getRatrappage(), false, seanceService.findById(seance),
							"");
					ratrappage = ratrappageService.save(ratrappage);
				}
			pointage.setRegularise(true);
			pointageService.update(pointage);
			session.setAttribute("rattrapage",ratrappage);
			response.sendRedirect("/PrjIsetWeb/dali/final.jsp");
		}
		if ("cont".equals(request.getParameter("btnv"))) {
			/*
			 * ArrayList<Rattrapage> base = RattrapageDao.getAll();
			 * session.setAttribute("ListeR", base); Registre registre =
			 * (Registre) session.getAttribute("ut9"); if
			 * (registre.getUsername().equals("admin.tn")) {
			 * 
			 * response.sendRedirect("/PrjIsetWeb/dali/controlleRattrapage.jsp")
			 * ; } else { response.sendRedirect("/PrjIsetWeb/dali/404.jsp"); }
			 */
		} else if ("action".equals(request.getParameter("daliSupp"))) {
			/*
			 * int num = Integer.parseInt(request.getParameter("id"));
			 * 
			 * RattrapageDao.delete(RattrapageDao.findBy(num));
			 * session.setAttribute("ListeR", RattrapageDao.getAll());
			 * response.sendRedirect("/PrjIsetWeb/dali/controlleRattrapage.jsp")
			 * ;
			 */ }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private Date parseDate(String date, String format) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.parse(date);
	}
}
