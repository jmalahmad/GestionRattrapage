<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/styles.css">

</head>
<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
 <%
 	if (session.getAttribute("tst") == null) {
 %> <%
 	response.sendRedirect("/Pjr_Iset/dali/login.jsp");
 %> <%
 	}
 %> 
	<div class="container-fluid">
		<div class="row-fluid">
			<br>
			<br>
			<div class="containerHeadline">
				<i class="icon-table"></i>
				<h2>
					Liste des Absences (De
					<%=session.getAttribute("dated")%>
					A
					<%=session.getAttribute("datea")%>
					)
				</h2>
				<div class="controlButton pull-right">
					<i class="icon-remove removeElement"></i>
				</div>
				<div class="controlButton pull-right">
					<i class="icon-caret-down minimizeElement"></i>
				</div>
			</div>
			<!-- ==================== END OF DEFAULT TABLE HEADLINE ==================== -->

			<!-- ==================== DEFAULT TABLE FLOATING BOX ==================== -->
			<div class="floatingBox table">
				<div class="container-fluid">

					<table class="table">
						<thead>
							<tr>
								<th>Date</th>
								<th>Enseignant</th>
								<th>Salle</th>
								<th>Groupe</th>
								<th>Seance</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.ListeA}" var="em">
								<tr>
									<td><c:out value="${em.getDate()}"></c:out></td>
									<td><c:out value="${em.getBasedebase().getEnsig().getNomEnsi()}"></c:out></td>
									<td><c:out value="${em.getBasedebase().getSalle().getNomSalle()}"></c:out></td>
									<td><c:out value="${em.getBasedebase().getNiveaux().getNom_niveau()}"></c:out></td>
									<td><c:out value="${em.getBasedebase().getSeance().getNomSeance()}"></c:out></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="buttonHolder">
				<button class="btn btn-small btn-primary"
					onClick="window.location.reload()">
					<i class="icon-refresh"></i> Try again
				</button>
				<a class="btn btn-small btn-danger" href="page1excel.jsp"><i
					class="icon-home"></i> Return to home</a>
			</div>
			<center>
			<form>
  <input id="impression" name="impression" type="button" onclick="imprimer_page()" value="Imprimer cette page" />
</form></center>
		</div>
		<div class="span2"></div>
	</div>
	</div>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')
	</script>
<script type="text/javascript">
function imprimer_page(){
  window.print();
}
</script>
	<script src="js/vendor/bootstrap.min.js"></script>
</body>
</html>
