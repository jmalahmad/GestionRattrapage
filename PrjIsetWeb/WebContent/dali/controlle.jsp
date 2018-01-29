<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<%@page import="java.util.Date"%>
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">

<link rel="stylesheet" href="css/styles.css">

</head>
<body class="tables">
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

	<!-- ==================== TOP MENU ==================== -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="#"><strong class="brandBold"></strong></a>
				<div class="nav pull-right">
					<form class="navbar-form">
						<div class="input-append">
							<input class="inp-mini inp-dark span2" type="text"
								placeholder="search..."> <span
								class="add-on add-on-first add-on-mini add-on-dark" id="search"><i
								class="icon-search"></i></span>
							<div class="collapsibleContent">
								<a href="#profileContent" class="sidebar"><span
									class="add-on add-on-mini add-on-dark" id="profile"><i
										class="icon-user"></i><span class="username"> <%
 	if (session.getAttribute("tst") == null) {
 %> <%
 	response.sendRedirect("/Pjr_Iset/dali/login.jsp");
 %> <%
 	}
 %> <%
 	if (session.getAttribute("tst") != null) {
 %> <jsp:getProperty property="username" name="ut9" /> <%
 	}
 %>
									</span></span></a>
							</div>
							<a href="#collapsedSidebarContent" class="collapseHolder sidebar"><span
								class="add-on add-on-mini add-on-dark"><i
									class="icon-sort-down"></i></span></a>
						</div>
					</form>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- ==================== END OF TOP MENU ==================== -->

	<!-- ==================== SIDEBAR ==================== -->
	<div class="hiddenContent">
		<!-- ==================== SIDEBAR COLLAPSED ==================== -->
		<div id="collapsedSidebarContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<ul class="collapsedSidebarMenu">

					<li class="sublevel"><a href="#">edit profile<i
							class="icon-user"></i></a></li>
					<li class="sublevel"><a href="#">change password<i
							class="icon-lock"></i></a></li>
					<li class="sublevel"><a href="#">logout<i class="icon-off"></i></a></li>
				</ul>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR COLLAPSED ==================== -->
		<!-- ==================== SIDEBAR TASKS ==================== -->
		<div id="tasksContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Tasks</h1></a>
				<h1>Tasks</h1>
				<div class="sidebarInfo">
					<div class="progressTasks"></div>
					<div class="newTasks"></div>
				</div>
				<ul class="tasksList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR TASKS ==================== -->

		<!-- ==================== SIDEBAR NOTIFICATIONS ==================== -->
		<div id="notificationsContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Notifications</h1></a>
				<h1>Notifications</h1>
				<div class="sidebarInfo">
					<div></div>
					<div></div>
				</div>
				<ul class="notificationsList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR NOTIFICATIONS ==================== -->

		<!-- ==================== SIDEBAR MESSAGES ==================== -->
		<div id="messagesContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Messages</h1></a>
				<h1>Messages</h1>
				<div class="sidebarInfo">
					<div></div>
					<div></div>
				</div>
				<ul class="messagesList">

				</ul>
				<button class="btn btn-primary">View all</button>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR MESSAGES ==================== -->

		<!-- ==================== SIDEBAR SETTINGS ==================== -->
		<div id="settingsContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>Settings</h1></a>
				<h1>Settings</h1>
				<ul class="settingsList">
					<li>
						<div class="settingSlider">
							<i class="icon-leaf"></i>
							<h3>Slider</h3>
							<div class="sl1"></div>
						</div>
					</li>
					<li>
						<div class="settingSlider">
							<i class="icon-leaf"></i>
							<h3>RangeSlider</h3>
							<div class="sl2"></div>
						</div>
					</li>
					<li>
						<div class="settingToggler">
							<i class="icon-leaf"></i>
							<h3>Toggler</h3>
							<label class="checkbox toggle well" onclick=""> <input
								id="toggler" type="checkbox" checked /> <span
								class="slider-selection"></span> <span class="toggleStatus">
									<span><i class="icon-ok toggleOn"></i></span> <span><i
										class="icon-remove toggleOff"></i></span>
							</span> <a class="btn btn-primary slide-button"></a>
							</label>
						</div>
					</li>

					<li class="fontSize">
						<h2>Font Size</h2>
						<div class="fontSizeBlock fontSizeSmall active">
							<span>A</span>
						</div>
						<div class="fontSizeBlock fontSizeMedium">
							<span>A</span>
						</div>
						<div class="fontSizeBlock fontSizeBig">
							<span>A</span>
						</div>
					</li>

					<li class="fontStyle">
						<h2>Font Style</h2>
						<div class="fontStyleBlock fontStyleSansSerif active">
							<span>Aa</span>
						</div>
						<div class="fontStyleBlock fontStyleSerif">
							<span>Aa</span>
						</div>
					</li>

				</ul>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR SETTINGS ==================== -->

		<!-- ==================== SIDEBAR PROFILE ==================== -->
		<div id="profileContent">
			<div class="sidebarDivider"></div>
			<div class="sidebarContent">
				<a href="#collapsedSidebarContent" class="showCollapsedSidebarMenu"><i
					class="icon-chevron-sign-left"></i>
					<h1>My account</h1></a>
				<h1>My account</h1>
				<div class="profileBlock">
					<div class="profilePhoto">
						<div class="usernameHolder">
				
							<%
								if (session.getAttribute("tst") != null) {
							%>
							<jsp:getProperty property="username" name="ut9" />
							<%
								}
							%>
						</div>
					</div>
					<div class="profileInfo">
						<p>
							<i class="icon-map-marker"></i> Piestany, SK
						</p>
						<p>
							<i class="icon-envelope-alt"></i> ici.kamarel@tattek.com
						</p>
						<p>
							<i class="icon-globe"></i> tattek.com
						</p>
						<p class="aboutMe">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit, sed do eiusmod tempor incididunt ut labore et
							dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat.</p>
					</div>
					<footer>
						<div class="profileSettingBlock editProfile">
							<i class="icon-user"></i>edit profile
						</div>
						<div class="profileSettingBlock changePassword">
							<i class="icon-lock"></i>change password
						</div>

						<div class="profileSettingBlock logout">
							<a href="../GestionPointage?action=logout"><i
								class="icon-off"></i></a>logout
						</div>

					</footer>
				</div>
			</div>
		</div>
		<!-- ==================== END OF SIDEBAR PROFILE ==================== -->

	</div>
	<!-- ==================== END OF SIDEBAR ==================== -->

	<!-- ==================== MAIN MENU ==================== -->
	<div class="mainmenu">
		<div class="container-fluid">
			<ul class="nav">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" id="formElements"><i
						class="icon-list"></i>Gestion <span class="label label-pressed">7</span></a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="../GestionSalle?action=affich">Salle</a></li>
						<li><a tabindex="-1"
							href="../GestionDepartement?action=affich">Departement</a></li>
						<li><a tabindex="-1" href="../GestionEns?action=affich">Ensignant</a></li>
						<li><a tabindex="-1" href="../GestionNiveau?action=affich">Niveau</a></li>
						<li><a tabindex="-1" href="../GestionMatiere?action=affich">matiere</a></li>
						<li><a tabindex="-1" href="../GestionSeance?action=affich">Séance</a></li>
						<li><a tabindex="-1" href="../GestionJour?action=affich">Jour</a></li>
					</ul></li>
				<li class="divider-vertical"></li>
				<li class="right-side" id="chartsGraphs"><a
					href="../GestionRattrapage?action=affich"><i
						class="icon-bar-chart"></i>Gestion de rattrapage</a></li>
				<li class="divider-vertical"></li>
				<li class="right-side" id="chartsGraphs"><a
					href="../GestionPointage?action=affich"><i
						class="icon-bar-chart"></i> Pointage physique </a></li>
				<li class="divider-vertical"></li>
				<li class="right-side" id="chartsGraphs"><a
					href="Statistique.jsp"><i class="icon-bar-chart"></i>
						Statistiques </a></li>
				<li class="divider-vertical"></li>
			</ul>
		</div>
	</div>
	<!-- ==================== END OF MAIN MENU ==================== -->

	<!-- ==================== DROPDOWN MENU FOR MOREOPTIONS ICON (hidden state) ==================== -->
	<ul class="dropdown-menu" id="moreOptionsMenu">
		<li class="dropdown-submenu"><a href="#">More options</a>
			<ul class="dropdown-menu">
				<li><a href="#">Second level link</a></li>
				<li><a href="#">Second level link</a></li>
				<li><a href="#">Second level link</a></li>
				<li><a href="#">Second level link</a></li>
				<li><a href="#">Second level link</a></li>
			</ul></li>
		<li><a href="#">Another action</a></li>
		<li><a href="#">Something else here</a></li>
	</ul>
	<!-- ==================== END OF DROPDOWN MENU ==================== -->

	<!-- ==================== PAGE CONTENT ==================== -->
	<div class="content">

		<!-- ==================== TITLE LINE FOR HEADLINE ==================== -->
		<div class="titleLine">
			<div class="container-fluid">
				<div class="titleIcon">
					<i class="icon-table"></i>
				</div>
				<ul class="titleLineHeading">
					<li class="heading"><h1>Tables</h1></li>
				</ul>
				<ul class="titleLineOnRight pull-right">

				</ul>
			</div>
		</div>
		<!-- ==================== END OF TITLE LINE ==================== -->

		<!-- ==================== BREADCRUMBS / DATETIME ==================== -->
		<ul class="breadcrumb">
			<li><i class="icon-home"></i><a href="index.html"> Home</a> <span
				class="divider"><i class="icon-angle-right"></i></span></li>
			<li>Form Elements <span class="divider"><i
					class="icon-angle-right"></i></span></li>
			<li class="active">Common Form Elements</li>
			<li class="moveDown pull-right"><span class="time"></span> <span
				class="date"></span></li>
		</ul>
		<!-- ==================== END OF BREADCRUMBS / DATETIME ==================== -->

		<!-- ==================== WIDGETS CONTAINER ==================== -->
		<div class="container-fluid">

			<!-- ==================== COMMON ELEMENTS ROW ==================== -->
			<div class="row-fluid">

				<div class="span6">
					<!-- ==================== OTHER ELEMENTS HEADLINE ==================== -->
					<div class="containerHeadline">
						<i class="icon-list"></i>
						<h2>Other Elements</h2>
						<div class="controlButton pull-right">
							<i class="icon-remove removeElement"></i>
						</div>
						<div class="controlButton pull-right">
							<i class="icon-caret-down minimizeElement"></i>
						</div>
					</div>
					<!-- ==================== END OF OTHER ELEMENTS HEADLINE ==================== -->

					<!-- ==================== OTHER ELEMENTS FLOATING BOX ==================== -->
					<div class="floatingBox">
						<div class="container-fluid">
							<form class="form-horizontal contentForm"
								action="../GestionPointage" method="get">
								<input type="hidden" />


								<div class="control-group">
									<label class="control-label">Datepicker field</label>
									<div class="controls">
										<input id="datepickerField" type="text" class="span10"
											name="date" value="<%=session.getAttribute("dateRet")%>">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Seances</label>
									<div class="controls">
										<select id="multipleSelect" multiple="multiple" name="test"
											style="display: none;">
											<c:forEach items="${sessionScope.ListeSeance}" var="emp">
												<option id="${emp.COD_senace}" name="${emp.COD_senace}"
													value="<c:out value="${emp.COD_senace}"></c:out>"><c:out
														value="${emp.nomSeance}"></c:out></option>
											</c:forEach>
										</select>

									</div>
								</div>

								<div class="formFooter">
									<center>
										<button type="submit" class="btn btn-primary" name="action"
											value="save3">
											<i class="icon-filter"></i>Filtrage
										</button>


										<button type="submit" class="btn btn-danger" name="action"
											value="save4">
											<i class="icon-warning-sign"></i>Verouillage Date
										</button>

									</center>
									<!--<button type="reset" class="btn">Reset</button>  -->
								</div>

							</form>
						</div>
					</div>
					<!-- ==================== END OF OTHER ELEMENTS FLOATING BOX ==================== -->
				</div>
				<div class="span6">
					<!-- ==================== OTHER ELEMENTS HEADLINE ==================== -->
					<div class="containerHeadline">
						<i class="icon-list"></i>
						<h2>Other Elements</h2>
						<div class="controlButton pull-right">
							<i class="icon-remove removeElement"></i>
						</div>
						<div class="controlButton pull-right">
							<i class="icon-caret-down minimizeElement"></i>
						</div>
					</div>
					<!-- ==================== END OF OTHER ELEMENTS HEADLINE ==================== -->

					<!-- ==================== OTHER ELEMENTS FLOATING BOX ==================== -->
					<div class="floatingBox">
						<div class="container-fluid">
<form class="form-horizontal contentForm"
								action="../GestionPointage" method="get">
							<table class="tablesorter centerFirstLast" id="membersTable">
								<thead>
									<tr>

										<th data-placeholder="search in usernames...">idPointage</th>
										<th data-placeholder="search in Semestre...">Date</th>
										<th data-placeholder="search in usernames...">Ensignant</th>
										<th data-placeholder="search in usernames...">Groupe</th>
										<th class="actions">Annuler</th>
									</tr>
								</thead>
								<tbody>




									<c:forEach items="${sessionScope.ListeP}" var="emp">
										<tr>

											<td><a href="#" class="username"><c:out
														value="${emp.idPointage}"></c:out></a></td>

											<td><a href="#" class="username"><c:out
														value="${emp.date}"></c:out></a></td>
											<td><a href="#" class="username"><c:out
														value="${emp.getBasedebase().getEnsig().nomEnsi}"></c:out></a></td>

											<td><a href="#" class="username"><c:out
														value="${emp.getBasedebase().getNiveaux().nom_niveau}"></c:out></a></td>


											
										<td><input id="${emp.idPointage}"
														class="css-checkbox" name="tt" value="${emp.idPointage}"
														type="checkbox" /> <label for="${emp.idPointage}"
														class="css-label">_-_</label></td>
										</tr>
									</c:forEach>




								</tbody>
							</table><br><br>

<center>
						<button class="btn btn-success" type="submit" name="daliSupp"
									value="save">
									<i class="icon-remove"></i>Annuler
								</button>
</center>
</form>
							<!-- ==================== END OF TABLESORTER TABLE ==================== -->

							<!-- ==================== TABLE PAGER ==================== -->
							<div id="pager" class="pager">
								<form>
									<span class="label white first"><i
										class="icon-double-angle-left"></i> first</span> <span
										class="label white prev"><i class="icon-angle-left"></i>
										prev</span> <span id="pageNumContainers"></span> <span
										class="pagedisplay"></span>
									<!-- this can be any element, including an input -->
									<span class="label white next">next <i
										class="icon-angle-right"></i></span> <span class="label white last">last
										<i class="icon-double-angle-right"></i>
									</span>
									<div class="perPageSelect">
										<select class="pagesize inp-mini">
											<option selected="selected" value="10">10</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option value="50">50</option>
										</select> records per page
									</div>
								</form>
							</div>
							<!-- ==================== END TABLE PAGER ==================== -->


						</div>
						<!-- ==================== END OF OTHER ELEMENTS FLOATING BOX ==================== -->
					</div>
				</div>

				<!-- ==================== END OF COMMON ELEMENTS ROW ==================== -->

			</div>
			<!-- ==================== END OF WIDGETS CONTAINER ==================== -->
		</div>
		<!-- ==================== END OF PAGE CONTENT ==================== -->

		<script
			src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script>
			window.jQuery
					|| document
							.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')
		</script>
		<script src="js/vendor/bootstrap-slider.js"></script>
		<!-- bootstrap slider plugin -->
		<script src="js/vendor/jquery.sparkline.min.js"></script>
		<!-- small charts plugin -->
		<script src="js/vendor/bootstrap-multiselect.js"></script>
		<!-- multiselect plugin -->
		<script src="js/vendor/bootstrap-datepicker.js"></script>
		<!-- datepicker plugin -->
		<script src="js/vendor/bootstrap-colorpicker.js"></script>
		<!-- colorpicker plugin -->

		<script src="js/vendor/bootstrap.min.js"></script>
		<script src="js/thekamarel.min.js"></script>
		<!-- main project js file -->

		<script>
			$(function() {

				$('#uniqueSelect').multiselect();

				$('#multipleSelect')
						.multiselect(
								{
									buttonText : function(options, select) {
										if (options.length == 0) {
											return 'None selected <b class="caret"></b>';
										} else if (options.length > 1) {
											return options.length
													+ ' selected <b class="caret"></b>';
										} else {
											var selected = '';
											options.each(function() {
												selected += $(this).text()
														+ ', ';
											});
											return selected.substr(0,
													selected.length - 2)
													+ ' <b class="caret"></b>';
										}
									},
								});

				$('#datepickerField').datepicker({
					format : 'dd/mm/yyyy'
				});

				$('#hexColorPicker').colorpicker();

				$('#rgbColorPicker').colorpicker({
					format : 'rgb'
				});

				$("#fileselectbutton").click(function(e) {
					$("#inputFile").trigger("click");
				});

				$("#inputFile").change(function(e) {
					var val = $(this).val();
					var file = val.split(/[\\/]/);
					$("#filename").val(file[file.length - 1]);
				});

			})
		</script>
</body>
</html>
>
