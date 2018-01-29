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
<%
	if (session.getAttribute("tst") == null) {
%>
<%
	response.sendRedirect("/PrjIsetWeb/dali/login.jsp");
%>
<%
	}
%>
<%
	if (session.getAttribute("tst") != null) {
%>
<jsp:getProperty property="username" name="ut9" />
<%
	}
%>
</head>
<body class="tables">
	<jsp:useBean id="ut9" class="tn.iset.model.Registre" scope="session" />
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

	<!-- ==================== TOP MENU ==================== -->
	<%@include file="menu/topMenu.jsp"%>
	<!-- ==================== END OF TOP MENU ==================== -->

	<!-- ==================== SIDEBAR ==================== -->
	<%@include file="menu/slideBar.jsp"%>
	<!-- ==================== END OF SIDEBAR ==================== -->

	<!-- ==================== MAIN MENU ==================== -->
	<%@include file="menu/mainMenu.jsp"%>
	<!-- ==================== END OF MAIN MENU ==================== -->


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
								<input type="hidden" name="action" value="save" />


								<div class="control-group">
									<label class="control-label">Date de Pointage</label>
									<div class="controls">
										<input id="datepickerField" type="text" class="span10"
											name="date" value="<%=session.getAttribute("dateRetour")%>">
									</div>
								</div>



								<div class="control-group">
									<label class="control-label">Seances</label>
									<div class="controls">
										<select id="multipleSelect" multiple="multiple" name="seances"
											style="display: none;">
											<c:forEach items="${sessionScope.ListeSeance}" var="seance">
												<option id="${seance.COD_senace}"
													name="${seance.COD_senace}"
													value="<c:out value="${seance.COD_senace}"></c:out>"
													<c:forEach var="s" items="${seances}">
  														<c:if test="${s eq seance.COD_senace}">
    														<c:out value="selected"></c:out>
    													</c:if>
													</c:forEach>>
													<c:out value="${seance.nomSeance}"></c:out>
												</option>
											</c:forEach>
										</select>

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
					<div class="containerHeadline tableHeadline">
						<i class="icon-group"></i>
						<h2>Seances</h2>
						<!-- ==================== TABLE CONTROLS ==================== -->
						<form>
							<div class="input-append">
								<input class="inp-mini span8" type="text"
									placeholder="search in members..." id="memberSearch"> <span
									class="add-on add-on-first add-on-mini"><i
									class="icon-search"></i></span> <span
									class="add-on add-on-middle add-on-mini tableSettings"><i
									class="icon-cog"></i></span> <span
									class="add-on add-on-middle add-on-mini minimizeTable"><i
									class="icon-caret-down"></i></span> <span
									class="add-on add-on-last add-on-mini removeTable"><i
									class="icon-remove"></i></span>
							</div>
						</form>
						<!-- ==================== END OF TABLE CONTROLS ==================== -->
					</div>
					<!-- ==================== OTHER ELEMENTS FLOATING BOX ==================== -->
					<div class="floatingBox">

						<div class="container-fluid">
							<form class="form-horizontal contentForm"
								action="../GestionPointage" method="get">
								<div class="floatingBox table">
									<div class="container-fluid">

										<!-- ==================== TABLESORTER TABLE ==================== -->
										<table class="tablesorter centerFirstLast" id="membersTable">
											<thead>
												<tr>
													<th data-placeholder="search in Semestre..."><CENTER>Nom
															Jour</CENTER></th>
													<th data-placeholder="search in usernames...">nom
														Salle</th>
													<th data-placeholder="search in Semestre...">Type
														Seance</th>
													<th data-placeholder="search in usernames...">nom
														Séance</th>
													<th class="actions">Abs</th>
												</tr>
											</thead>
											<tbody>




												<c:forEach items="${sessionScope.ListeEmpl}" var="emp">
													<tr>


														<td><c:out value="${emp.getJour().nomJour}"></c:out></td>
														<td><c:out value="${emp.getSalle().nomSalle}"></c:out></td>

														<td><c:out value="Seance Normale"></c:out></td>

														<td><c:out value="${emp.getSeance().nomSeance}"></c:out></td>

														<td><input id="${emp.idBase}" class="css-checkbox"
															name="tt" value="${emp.idBase}" type="checkbox"
															<c:if test="${emp.pointage==1}" >checked</c:if> /> <label
															for="${emp.idBase}" class="css-label">_-_</label></td>
													</tr>
												</c:forEach>
												<c:forEach items="${sessionScope.ListeRat}" var="ratrappage">
													<tr class="no-edit">


														<td bgcolor="red"><c:out
																value="${ratrappage.getJour().nomJour}"></c:out></td>
														<td bgcolor="red"><c:out
																value="${ratrappage.getSalle().nomSalle}"></c:out></td>

														<td bgcolor="red"><c:out value="Seance de Ratrappage"></c:out></td>

														<td bgcolor="red"><c:out
																value="${ratrappage.getSeance().nomSeance}"></c:out></td>

														<td><input id="Rat"
															+"Rat.${ratrappage.idBase}"
															class="css-checkbox"
															name="tt" value="${ratrappage.idBase}" type="checkbox"
															<c:if test="${ratrappage.pointage==1}" >checked</c:if> />
															<label for="Rat"
															+"Rat.${ratrappage.idBase}" class="css-label">_-_</label></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div id="pager" class="pager">
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
										</div>
										<!-- ==================== END TABLE PAGER ==================== -->

									</div>
								</div>

								<!-- ==================== TABLE HEADLINE ==================== -->


								<!-- ==================== END OF TABLE ROW ==================== -->

								<!-- ==================== TEXT INPUTS HEADLINE ==================== -->

								<br /> <br />
								<center>
									<button class="btn btn-success" type="submit" name="action"
										value="pointage">
										<i class="icon-ok"></i>Valider
									</button>
								</center>
							</form>
							<!-- ==================== END OF TABLESORTER TABLE ==================== -->


							<!-- ==================== END TABLE PAGER ==================== -->
							<div class="container-fluid">
								<form class="form-horizontal contentForm"
									action="../GestionPointage" method="get">
									<input type="hidden" name="action" value="save2" />





									<div class="formFooter">
										<center>
											<button type="submit" class="btn btn-danger" value="controle">
												<i class="icon-filter"></i>Controle
											</button>


										</center>
										<!--<button type="reset" class="btn">Reset</button>  -->
									</div>

								</form>

							</div>
						</div>
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
	<script src="js/vendor/jquery.tablesorter.min.js"></script>
	<!-- tablesorter plugin -->
	<script src="js/vendor/jquery.tablesorter.widgets.min.js"></script>
	<!-- tablesorter plugin / widgets extension -->
	<script src="js/vendor/jquery.tablesorter.pager.min.js"></script>
	<!-- tablesorter plugin / pager extension -->
	<script src="js/vendor/bootstrap-datepicker.js"></script>
	<!-- datepicker plugin -->
	<script src="js/vendor/bootstrap-multiselect.js"></script>
	<!-- multiselect plugin -->

	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/vendor/bootstrap-editable.min.js"></script>
	<!-- editable fields plugin -->
	<script src="js/thekamarel.min.js"></script>
	<!-- main project js file -->

	<script>
		// add parser through the tablesorter addParser method
		$.tablesorter.addParser({
			id : 'checkbox',
			is : function(s) {
				return false;
			},
			format : function(s, table, cell, cellIndex) {
				var $t = $(table), $c = $(cell), c,

				// resort the table after the checkbox status has changed
				resort = false;

				if (!$t.hasClass('hasCheckbox')) {
					$t.addClass('hasCheckbox')
							// make checkbox in header set all others
							.find(
									'thead th:eq(' + cellIndex
											+ ') input[type=checkbox]').bind(
									'change',
									function() {
										c = this.checked;
										$t.find(
												'tbody tr:visible td:nth-child('
														+ (cellIndex + 1)
														+ ') input').each(
												function() {
													this.checked = c;
													$(this).trigger('change');
												});
									}).bind('mouseup', function() {
								return false;
							});
					$t.find('tbody tr').each(
							function() {
								$(this).find('td:eq(' + cellIndex + ')').find(
										'input[type=checkbox]').bind(
										'change',
										function() {
											$t.trigger('updateCell', [
													$(this).closest('td')[0],
													resort ]);
										});
							});
				}
				// return 1 for true, 2 for false, so true sorts before false
				c = ($c.find('input[type=checkbox]')[0].checked) ? 1 : 2;
				$c.closest('tr')[c === 1 ? 'addClass' : 'removeClass']
						('checked');
				return c;
			},
			type : 'numeric'
		});

		$(function() {
			$('#tablesorterDemo').tablesorter({
				sortList : [ [ 1, 0 ] ],
				widgets : [ 'zebra', 'stickyHeaders' ],
				headers : {
					0 : {
						sorter : 'checkbox'
					},
				}
			});

			/*=============================================================================================
			     ============================== LOAD TABLESORTER PAGER SETTINGS ===============================
			     =============================================================================================*/

			// define pager options
			var pagerOptions = {
				// target the pager markup - see the HTML block below
				container : $(".pager"),
				// output string - default is '{page}/{totalPages}'; possible variables: {page}, {totalPages}, {startRow}, {endRow} and {totalRows}
				output : '{startRow} - {endRow} / {filteredRows} ({totalRows})',
				// if true, the table will remain the same height no matter how many records are displayed. The space is made up by an empty
				// table row set to a height to compensate; default is false
				fixedHeight : false,
				// remove rows from the table to speed up the sort of large tables.
				// setting this to false, only hides the non-visible rows; needed if you plan to add/remove rows with the pager enabled.
				removeRows : false,
				// go to page selector - select dropdown that sets the current page
				cssGoto : '.gotoPage'
			};

			/*=============================================================================================
			 ======================================= LOAD TABLESORTER =====================================
			 =============================================================================================*/

			$("#membersTable").tablesorter({

				headers : {
					0 : {
						sorter : false,
						filter : false
					},
					1 : {
						sorter : 'text'
					},
					2 : {
						sorter : 'shortDate'
					},
					3 : {
						sorter : 'text'
					},
					4 : {
						sorter : 'text'
					},
					5 : {
						sorter : false,
						filter : false
					}
				},

				dateFormat : 'uk',

				// sort on the first column and third column in ascending order
				sortList : [ [ 1, 0 ] ],

				// hidden filter input/selects will resize the columns, so try to minimize the change
				widthFixed : true,

				// initialize zebra striping and filter widgets
				widgets : [ "zebra", "filter" ],

				widgetOptions : {

					// If there are child rows in the table (rows with class name from "cssChildRow" option)
					// and this option is true and a match is found anywhere in the child row, then it will make that row
					// visible; default is false
					filter_childRows : false,

					// if true, a filter will be added to the top of each table column;
					// disabled by using -> headers: { 1: { filter: false } } OR add class="filter-false"
					// if you set this to false, make sure you perform a search using the second method below
					filter_columnFilters : true,

					// css class applied to the table row containing the filters & the inputs within that row
					filter_cssFilter : 'tablesorter-filter',

					// add custom filter functions using this option
					// see the filter widget custom demo for more specifics on how to use this option
					filter_functions : null,

					// if true, filters are collapsed initially, but can be revealed by hovering over the grey bar immediately
					// below the header row. Additionally, tabbing through the document will open the filter row when an input gets focus
					filter_hideFilters : true,

					// Set this option to false to make the searches case sensitive
					filter_ignoreCase : true,

					// Delay in milliseconds before the filter widget starts searching; This option prevents searching for
					// every character while typing and should make searching large tables faster.
					filter_searchDelay : 300,

					// Set this option to true to use the filter to find text from the start of the column
					// So typing in "a" will find "albert" but not "frank", both have a's; default is false
					filter_startsWith : false,

					// Filter using parsed content for ALL columns
					// be careful on using this on date columns as the date is parsed and stored as time in seconds
					filter_useParsedData : false

				}

			})

			/*=============================================================================================
			 ================================== LOAD PAGER TO TABLESORTER =================================
			 =============================================================================================*/

			.tablesorterPager(pagerOptions);

			$('.pagesize').multiselect();

			/*=============================================================================================
			 ================================ SEARCH FUNCTION FOR WHOLE TABLE =============================
			 =============================================================================================*/

			// Write on keyup event of keyword input element
			$("#memberSearch").keyup(
					function() {
						// When value of the input is not blank
						if ($(this).val() != "") {
							// Show only matching TR, hide rest of them
							$("#membersTable tbody>tr").hide();
							$(
									"#membersTable td:contains-ci('"
											+ $(this).val() + "')")
									.parent("tr").show();
						} else {
							// When there is no input or clean again, show everything back
							$("#membersTable tbody>tr").show();
						}
					});

			/*=============================================================================================
			 ======================== ADD ROLLER GRIP TO TABLESORTER HIDEME ROW ===========================
			 =============================================================================================*/

			$('.tablesorter-filter-row td:first').append(
					'<div class="tableFilterRoller"></div>');

			/*=============================================================================================
			 ======================= ADD MOREOPTIONS ICON TO HIDDEN ROW WITH FILTERS ======================
			 =============================================================================================*/

			$('.tablesorter-filter-row td').not(':first').not(':last').append(
					'<i class="icon-play-circle moreOptions pull-right"></i>');

			/*=============================================================================================
			 ================================ TABLE ROW INFO / EDIT / DELETE ICON ACTIONS =================
			 =============================================================================================*/

			var showMemberIcon = $('i.info').parent(), editMemberIcon = $(
					'i.edit').parent(), deleteMemberIcon = $('i.delete')
					.parent();

			$(showMemberIcon).tooltip({
				title : 'View member profile'
			});

			$(editMemberIcon).tooltip({
				title : 'Edit member profile'
			});

			$(deleteMemberIcon).tooltip({
				title : 'Delete member'
			});

			$('i.info, i.edit, i.delete').parent().hover(function() {
				$(this).children().stop().animate({
					opacity : 1
				}, 200);
			}, function() {
				$(this).children().stop().animate({
					opacity : .7
				}, 200);
			});

			/*=============================================================================================
			 ===================================== SET FIELDS EDITABLE ====================================
			 =============================================================================================*/

			$('#membersTable a.username').editable({
				type : 'text',
				name : 'username',
				url : '/post',
				title : 'Enter username',
				placement : 'right'
			});

			$('#membersTable a.registrationDate').editable({
				type : 'date',
				viewformat : 'dd/mm/yyyy',
				name : 'registrationDate',
				url : '../post',
				title : 'Enter date of registration'
			});

			$('#membersTable a.memberGroup').editable({
				type : 'select',
				source : [ {
					value : 1,
					text : 'admin'
				}, {
					value : 2,
					text : 'editor'
				}, {
					value : 3,
					text : 'author'
				}, {
					value : 4,
					text : 'user'
				}, {
					value : 5,
					text : 'second technician'
				} ],
				name : 'memberGroup',
				url : '/post',
				title : 'Choose a role'
			}).click(function() {
				$(this).next().find('select').multiselect();
			});

		});
		$(function() {

			$('#uniqueSelect').multiselect();

			$('#multipleSelect').multiselect(
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
									selected += $(this).text() + ', ';
								});
								return selected.substr(0, selected.length - 2)
										+ ' <b class="caret"></b>';
							}
						},
					});

			$('#datepickerField').datepicker({
				format : 'dd/mm/yyyy'
			});
			$('#datepickerField2').datepicker({
				format : 'dd/mm/yyyy'
			});
			$('#membersTable a.memberStatus').editable({
				type : 'select',
				source : [ {
					value : 'active',
					text : 'active'
				}, {
					value : 'inactive',
					text : 'inactive'
				}, {
					value : 'banned',
					text : 'banned'
				}, {
					value : 'pending',
					text : 'pending'
				} ],
				name : 'memberStatus',
				url : '/post',
				title : 'Choose a status',
				success : function() {
					var label = $(this).parent() // define variable for link parent
					selectVal = $(this).next().find('select').val(); // define variable for selected value

					$(label).removeClass().addClass('label' + ' ' + selectVal); // remove actual class from label and add new class defined by selected value (this change color of label)
				}
			}).click(function() {
				$(this).next().find('select').multiselect();
			});
		});
	</script>

</body>
</html>
