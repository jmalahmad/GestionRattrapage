<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="404.jsp"  %>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
<title></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">

<link rel="stylesheet" href="css/styles.css">

</head>
<body class="tables">
		<jsp:setProperty name="ut1" property="*" />
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
								 <a
									href="#profileContent" class="sidebar"><span
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
 %></span></span></a>
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
					<div class="progressTasks">
						
					</div>
					<div class="newTasks">
						
					</div>
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
					<div>
						
					</div>
					<div>
						
					</div>
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
					<div>
						
					</div>
					<div>
					
					</div>
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
						<div class="usernameHolder">Ing. Imrich Kamarel</div>
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
							<i class="icon-off"></i>logout
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
						<li><a tabindex="-1" href="#">Salle</a></li>
						<li><a tabindex="-1"
							href="#">Departement</a></li>
						<li><a tabindex="-1" href="#">Ensignant</a></li>
						<li><a tabindex="-1" href="#">Niveau</a></li>
						<li><a tabindex="-1" href="#">matiere</a></li>
						<li><a tabindex="-1" href="#">Séance</a></li>
						<li><a tabindex="-1" href="#">Jour</a></li>
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
				<li class="right-side" id="chartsGraphs"><a href="Statistique.jsp"><i
						class="icon-bar-chart"></i> Statistiques </a></li>
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
        <!-- ==================== END OF DROPDOWN MENU ==================== -->

        <!-- ==================== PAGE CONTENT ==================== -->
        <div class="content">

            <!-- ==================== TITLE LINE FOR HEADLINE ==================== -->
            
            <!-- ==================== END OF TITLE LINE ==================== -->

            <!-- ==================== BREADCRUMBS / DATETIME ==================== -->
            <ul class="breadcrumb">
                <li><i class="icon-home"></i><a href="index.html"> Home</a> <span class="divider"><i class="icon-angle-right"></i></span></li>
                <li class="active">Charts & Graphs</li>
                <li class="moveDown pull-right">
                    <span class="time"></span>
                    <span class="date"></span>
                </li>   
            </ul>
            <!-- ==================== END OF BREADCRUMBS / DATETIME ==================== -->

            <!-- ==================== WIDGETS CONTAINER ==================== -->
            <div class="container-fluid">

			<!-- ==================== COMMON ELEMENTS ROW ==================== -->
			<div class="row-fluid">

				<div class="span12">
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
								action="../GestionStatistique" method="get">
								<input type="hidden" name="action" value="save" />





								<div class="control-group">
									<label class="control-label">Periode de</label>
									<div class="controls">
										<input id="datepickerField" type="text" class="span10"
											name="date" value="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">A</label>
									<div class="controls">
										<input id="datepickerField2" type="text" class="span10"
											name="date2" value="">
									</div>
								</div>
								<div class="formFooter">
									<center>
										<button type="submit" class="btn btn-primary">
											<i class="icon-filter"></i>Filtrage
										</button>
									</center>
									<!--<button type="reset" class="btn">Reset</button>  -->
								</div>
							</form>
						</div>
					</div>
					<!-- ==================== END OF OTHER ELEMENTS FLOATING BOX ==================== -->
				</div>
            
            <!-- ==================== END OF WIDGETS CONTAINER ==================== -->
    
        <!-- ==================== END OF PAGE CONTENT ==================== -->
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap-slider.js"></script>                   <!-- bootstrap slider plugin -->
        <script src="js/vendor/jquery.sparkline.min.js"></script>               <!-- small charts plugin -->
        <script src="js/vendor/jquery.flot.min.js"></script>                    <!-- charts plugin -->
        <script src="js/vendor/jquery.flot.resize.min.js"></script>             <!-- charts plugin / resizing extension -->
        <script src="js/vendor/jquery.flot.pie.min.js"></script>                <!-- charts plugin / pie chart extension -->
        <script src="js/vendor/justgage.js"></script>                           <!-- justgage plugin -->
        <script src="js/vendor/raphael.2.1.0.min.js"></script>                  <!-- vector graphic plugin / for justgage.js -->
    
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/thekamarel.min.js"></script>                            <!-- main project js file -->
		<script src="js/vendor/bootstrap-datepicker.js"></script>
        <script>
       

         

           

            // Bars
            

           
            $('#datepickerField').datepicker({
				format : 'dd/mm/yyyy'
			});
            $('#datepickerField2').datepicker({
				format : 'dd/mm/yyyy'
			});
            /* realtime chart */

            // Create the demo X and Y axis labels


            // Since CSS transforms use the top-left corner of the label as the transform origin,
            // we need to center the y-axis label by shifting it down by half its width.
            // Subtract 20 to factor the chart's bottom margin into the centering.

          
            // A custom label formatter used by several of the plots

 
        </script>
    </body>
</html>
