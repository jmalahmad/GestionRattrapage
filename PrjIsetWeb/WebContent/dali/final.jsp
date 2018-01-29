<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<%@page import="tn.iset.model.Ratrappage"%>
<html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
        <title>The Kamarel v. 1.3</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="css/styles.css">

    </head>
    <body>
    <%
 	if (session.getAttribute("tst") == null) {
 %> <%
 	response.sendRedirect("/Pjr_Iset/dali/login.jsp");
 %> <%
 	}
 %> 
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
<%Ratrappage rattrapage = (Ratrappage)session.getAttribute("rattrapage"); %>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span2"></div>
                <div class="span8 page404-container">
                    <h1 class="page404">Les Information :</h1>
                    <h1 class="page404 nextLine">Rattrapage!</h1>
                    <h1 class="heading404"></h1>
                    <h4 class="subheading404"></h4>
                    <p class="second-line"> Date Absence = <%=rattrapage.getDateSeance()%> </p>
                    <p class="second-line">  Date Rattrapage = <%=rattrapage.getDateRattrapage()%> </p>
                    <p class="second-line">Salle = <%=rattrapage.getIdRat()%></p>
                 <p class="second-line">Seance = <%=rattrapage.getSeance().getCOD_senace()%></p>
                   
                    <p class="second-line">Type = <%=rattrapage.getType()%></p>
                    
                    <div class="buttonHolder">
                        <button class="btn btn-small btn-primary" onClick="window.location.reload()"><i class="icon-refresh"></i> Try again</button>
                        <a class="btn btn-small btn-danger" href="page1excel.jsp"><i class="icon-home"></i> Return to home</a>
                    </div>
                </div>
                <div class="span2"></div>
            </div>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
    </body>
</html>
