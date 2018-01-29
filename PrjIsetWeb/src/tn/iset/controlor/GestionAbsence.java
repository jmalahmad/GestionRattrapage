package tn.iset.controlor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iset.model.dto.AbsenceDTO;
import tn.iset.service.GestionPointageLocal;

/**
 * Servlet implementation class GestionAbsence
 */
@WebServlet("/GestionAbsence")
public class GestionAbsence extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dateDeb;
	private String dateFin;
	private Object dateFormatDeb;
	private Date dateFormatFin;
	private List<AbsenceDTO> listAbsence =new ArrayList<>();
	@EJB
	private GestionPointageLocal pointageService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestionAbsence() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if ("affichAbs".equals(request.getParameter("action"))) {
			dateDeb = request.getParameter("dateDebut");
			dateFin = request.getParameter("dateFin");
			session.setAttribute("dateDebut", dateDeb);
			session.setAttribute("dateFin", dateFin);
			if (dateDeb.equals("") || dateDeb.equals("null") ) {
				session.setAttribute("ListeEmpl", listAbsence);
			} else {

				try {
					dateFormatDeb = parseDate(dateDeb, "dd/MM/yyyy");
					dateFormatFin = parseDate(dateFin, "dd/MM/yyyy");
				} catch (ParseException e) {

					e.printStackTrace();
				}
				listAbsence = pointageService.findAbsenceByDateRang(dateFormatDeb, dateFormatFin);
				session.setAttribute("listAbsence", listAbsence);
			}
			response.sendRedirect("/PrjIsetWeb/dali/affichAbsence.jsp");
		}
	}
	private Date parseDate(String date, String format) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.parse(date);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
