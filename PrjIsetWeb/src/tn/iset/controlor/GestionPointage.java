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

import tn.iset.model.Enseignement;
import tn.iset.model.Pointage;
import tn.iset.model.Ratrappage;
import tn.iset.model.Registre;
import tn.iset.model.dto.EnseignementDTO;
import tn.iset.service.GestionEnseignementLocal;
import tn.iset.service.GestionPointageLocal;
import tn.iset.service.GestionRatrappageLocal;

/**
 * Servlet implementation class GestionPointage
 */
@WebServlet("/GestionPointage")
public class GestionPointage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private GestionRatrappageLocal ratrappageService;

	@EJB
	private GestionEnseignementLocal enseignementService;

	@EJB
	private GestionPointageLocal pointageService;

	public GestionPointage() {
		super();

	}

	ArrayList<EnseignementDTO> listEnseignement = new ArrayList<>();
	ArrayList<EnseignementDTO> listeRat = new ArrayList<>();
	Date laDate = null;
	int[] idSeances = null;
	int dateJ;

	static String date;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if ("pointage".equals(request.getParameter("action"))) {

			ArrayList<Pointage> poi = new ArrayList<>();
			String[] pointageGroup = request.getParameterValues("tt");
			if (pointageGroup != null && pointageGroup.length != 0) {
				for (String t : pointageGroup) {
					int t2 = Integer.parseInt(t);
					Pointage pointage = new Pointage();
					Enseignement enseignement = enseignementService.findById(t2);
					if (enseignement != null) {
						pointage.setEnseignement(enseignement);
					} else {
						Ratrappage ratrappage = ratrappageService.findById(t2);
						pointage.setRatrappage(ratrappage);
					}
					pointage.setDate(laDate);
					pointage.setDatePointage(new Date());
					poi.add(pointage);

				}
				pointageService.saveAll(poi);
				listEnseignement = enseignementService.findEnseigByDateSeances(laDate, dateJ, idSeances);
				listeRat = enseignementService.findRattrapageByDateSeances(laDate, laDate, idSeances);
				session.setAttribute("ListeRat", listeRat);
				session.setAttribute("ListeEmpl", listEnseignement);
			}
			response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");
		}
		if ("logout".equals(request.getParameter("action"))) {
			response.sendRedirect("/PrjIsetWeb/dali/login.jsp");
		}
		if ("affich".equals(request.getParameter("action"))) {
			// / a Terminer
			response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");

		} else if ("save".equals(request.getParameter("action"))) {

			date = request.getParameter("date");
			String[] seances = request.getParameterValues("seances"); // /mult
			session.setAttribute("dateRetour", date);
			session.setAttribute("seances", seances);
			idSeances = new int[seances.length];// check
			for (int i = 0; i < seances.length; i++) {
				idSeances[i] = Integer.parseInt(seances[i]);
			}

			if (date.equals("") || date.equals("null") || seances == null) {
				session.setAttribute("ListeEmpl", listEnseignement);
				response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");
			} else {

				try {
					laDate = parseDate(date, "dd/MM/yyyy");
				} catch (ParseException e) {

					e.printStackTrace();
				}
				dateJ = laDate.getDay();
				listEnseignement = enseignementService.findEnseigByDateSeances(laDate, dateJ, idSeances);
				listeRat = enseignementService.findRattrapageByDateSeances(laDate, laDate, idSeances);
				session.setAttribute("ListeEmpl", listEnseignement);
				session.setAttribute("ListeRat", listeRat);
				response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");
			}
		} else if ("save2".equals(request.getParameter("action"))) {

			 Registre registre = (Registre) session.getAttribute("ut9");
			 if (registre.getUsername().equals("admin.tn")) {
			
			 response.sendRedirect("/PrjIsetWeb/dali/affichAbsence.jsp");
			 } else {
			 response.sendRedirect("/PrjIsetWeb/dali/404.jsp");
			 }
		} else if ("save3".equals(request.getParameter("action"))) {
			// date = request.getParameter("date");
			//
			// Date laDate = null;
			// try {
			// laDate = parseDate(date, "dd/MM/yyyy");
			// } catch (ParseException e) {
			//
			// e.printStackTrace();
			// }
			// ArrayList<Pointage> RedBase = new ArrayList<Pointage>();
			// ArrayList<Pointage> Re = new ArrayList<Pointage>();
			// RedBase = PointageDao.getAll();
			// String[] test = request.getParameterValues("test");
			// if (date.equals("") || date.equals("null") || test == null) {
			// Re.clear();
			//
			// //session.setAttribute("dateRet", date);
			// response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");
			// }
			// for (int i = 0; i < RedBase.size(); i++) {
			// if (RedBase.get(i).getDate().equals(date)) {
			// for (String t : test) {
			// if (Integer.parseInt(t) == RedBase.get(i)
			// .getBasedebase().getSeance().getCOD_senace()) {
			// Re.add(RedBase.get(i));
			// }
			// }
			//
			// }
			// }
			// session.setAttribute("ListeP", Re);
			//
			// session.setAttribute("dateRet", date);
			response.sendRedirect("/PrjIsetWeb/dali/controlle.jsp");
		} else if ("save4".equals(request.getParameter("action"))) {
			// date = request.getParameter("date");
			// Datever datever = new Datever();
			// datever.setDateVer(date);
			//
			// if (DateverDao.findBy(date) == null) {
			// DateverDao.save(datever);
			// }
			response.sendRedirect("/PrjIsetWeb/dali/controlle.jsp");
		} else if ("save".equals(request.getParameter("daliSupp"))) {

			String[] tet = request.getParameterValues("tt");
			if (tet == null) {
				response.sendRedirect("/PrjIsetWeb/dali/controlle.jsp");
			}
			for (String t : tet) {
				int c = Integer.parseInt(t);
				// PointageDao.delete(PointageDao.findBy(c));
			}

			response.sendRedirect("/PrjIsetWeb/dali/controlle.jsp");
		}
	}

//	private String[] addDoubleSeances(String[] seances) {
//		switch (codeSeance1) {
//		case 1:
//			codeSeance2 = 7;
//			break;
//		case 2:
//			codeSeance2 = 7;
//			codeSeance3 = 8;
//			break;
//		case 3:
//			codeSeance1 = 11;
//			codeSeance2 = 8;
//			break;
//		case 4:
//			codeSeance1 = 11;
//			codeSeance2 = 9;
//			break;
//		case 5:
//			codeSeance2 = 9;
//			codeSeance3 = 10;
//			break;
//		case 6:
//			codeSeance2 = 10;
//			break;
//		default:
//			break;
//		}
//
//		
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private Date parseDate(String date, String format) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.parse(date);
	}
}
