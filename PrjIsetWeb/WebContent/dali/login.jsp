<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
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

        <div class="container-fluid">

            <form class="form-signin" action="../GestionReg" method="get">
              <input type="hidden" name="action" value="log">
                <h2 class="form-signin-heading"><strong>SIGN</strong>.IN</h2>
                <div class="input-prepend">
                  <span class="add-on"><i class="icon-user"></i></span>
                  <input type="text" placeholder="email" name="email">
                </div>
                <div class="input-prepend">
                  <span class="add-on"><i class="icon-lock"></i></span>
                  <input type="password" placeholder="Password" name="password">
                  <span class="add-on" id="login"><i class="icon-arrow-right"></i></span>
                </div>
                <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div><!-- /.col -->
            </form>

            <div class="signInRow">
                <div><h1>Sign in</h1></div>
                <div><a href="/P_IsetFinal/dali/registre.jsp" hidden="text">Créer un Compte</a></div>
            </div>
</div>
       

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>
    </body>
</html>
