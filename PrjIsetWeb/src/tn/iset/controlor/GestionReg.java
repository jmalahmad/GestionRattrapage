package tn.iset.controlor;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.iset.model.Registre;
import tn.iset.service.GestionRegisterLocal;
import tn.iset.service.GestionSeanceLocal;

/**
 * Servlet implementation class GestionReg
 */
@WebServlet("/GestionReg")
public class GestionReg extends HttpServlet {

	@EJB
	private GestionRegisterLocal registerService;
	
	@EJB
	private GestionSeanceLocal seanceService;
	
	private static final long serialVersionUID = 1L;

	public GestionReg() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if ("reg".equals(request.getParameter("action"))) {

			if (registerService.findByEmail(request.getParameter("email")) == null) {
				if (request.getParameter("password").equals(request.getParameter("passwordConf"))) {
					Registre registre = new Registre();

					registre.setDatedenaissance(request.getParameter("date"));

					registre.setUsername(request.getParameter("fullname"));
					registre.setEmail(request.getParameter("email"));
					registre.setPassword(request.getParameter("password"));
					registerService.save(registre);

					response.sendRedirect("/PrjIsetWeb/dali/login.jsp");
				}
			} else {
				response.sendRedirect("/PrjIsetWeb/dali/registre.jsp");
			}
		} else if ("log".equals(request.getParameter("action"))) {
			Registre currentUser = registerService.findByEmailPassword(request.getParameter("email"),
					request.getParameter("password"));
			if (currentUser == null) {
				response.sendRedirect("/PrjIsetWeb/dali/login.jsp");
			} else {

				HttpSession session = request.getSession();
				session.setAttribute("ut9", currentUser);
				session.setAttribute("tst", "vrai");

				session.setAttribute("ListeSeance", seanceService.getAll());
				response.sendRedirect("/PrjIsetWeb/dali/page1excel.jsp");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
