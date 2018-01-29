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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">

        <link rel="stylesheet" href="css/styles.css">

    </head>
    <body class="validationForm">
       

            <!-- ==================== BREADCRUMBS / DATETIME ==================== -->
            <ul class="breadcrumb">
                
            </ul>
            <!-- ==================== END OF BREADCRUMBS / DATETIME ==================== -->

            <!-- ==================== WIDGETS CONTAINER ==================== -->
            <div class="container-fluid">

                <!-- ==================== COMMON ELEMENTS ROW ==================== -->
                <div class="row-fluid">
                    <div class="">
                        <!-- ==================== TEXT INPUTS HEADLINE ==================== -->
                        <div class="containerHeadline">
                            <i class="icon-ok-sign"></i><h2>Register a new membership</h2>
                            <div class="controlButton pull-right"><i class="icon-remove removeElement"></i></div>
                            <div class="controlButton pull-right"><i class="icon-caret-down minimizeElement"></i></div>
                        </div>
                        <!-- ==================== END OF TEXT INPUTS HEADLINE ==================== -->

                        <!-- ==================== TEXT INPUTS FLOATING BOX ==================== -->
                        <div class="floatingBox">
                            <div class="container-fluid">
                                <form class="form-horizontal contentForm" data-validate="parsley" action="../GestionReg" method="get" >
       							 <input type="hidden" name="action" value="reg">
                                    <div class="control-group">
                                        <label class="control-label" for="fullname">Full Name *</label>
                                        <div class="controls">
                                          <input type="text" class="span10" id="fullname" name="fullname" data-validation-minlength="0" data-trigger="change" data-required="true" data-minlength="4" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="email">Email *</label>
                                        <div class="controls">
                                           <input type="text" id="email" name="email" data-validation-minlength="0" data-trigger="change" data-required="true" data-type="email" class="span10" data-minlength="3" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="password">Password *</label>
                                        <div class="controls">
                                          <input type="password" id="password" name="password" data-validation-minlength="0" data-trigger="change" data-required="true" data-type="alphanum" data-minlength="6" class="span10">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="passwordConf">Password Confirmation *</label>
                                        <div class="controls">
                                          <input type="password" id="passwordConf" name="passwordConf" data-validation-minlength="0" data-trigger="change" data-required="true" data-type="alphanum" data-minlength="6" data-equalto="#password" class="span10">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label" for="website">Website *</label>
                                        <div class="controls">
                                          <input type="text" id="website" name="website" class="span10" data-validation-minlength="0" data-trigger="change" data-required="true" data-type="url">
                                        </div>
                                    </div>
                                    <div class="control-group last">
                                        <label class="control-label" for="date">Birth Date *</label>
                                        <div class="controls">
                                          <input type="text" name="date" id="date" data-type="dateIso" data-trigger="change" data-required="true" class="span10" placeholder="YYYY-MM-DD">
                                        </div>
                                    </div>
                                 <div class="formFooter">
                                    	
                                     <center>     <button type="submit" class="btn btn-primary" name="submit">Submit</button> 
                                        <button type="reset" class="btn" name="reset">Reset</button></center>
                                    </div>
                                </form>
                                <center><a href="/P_IsetFinal/dali/login.jsp" class="text-center">I already have a membership</a></center> 
                            </div>
                        </div>
                        <!-- ==================== END OF TEXT INPUTS FLOATING BOX ==================== -->
                    </div>
                 
                </div>
                <!-- ==================== END OF COMMON ELEMENTS ROW ==================== -->

            </div>
            <!-- ==================== END OF WIDGETS CONTAINER ==================== -->
        </div>
        <!-- ==================== END OF PAGE CONTENT ==================== -->
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap-slider.js"></script>                   <!-- bootstrap slider plugin -->
        <script src="js/vendor/jquery.sparkline.min.js"></script>               <!-- small charts plugin -->
         <script src="js/vendor/bootstrap-multiselect.js"></script>              <!-- multiselect plugin -->
        <script src="js/vendor/parsley.min.js"></script>                        <!-- parsley validator plugin -->

        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/thekamarel.min.js"></script>                            <!-- main project js file -->

        <script>

        $(function () {

            $('#multipleSelect').multiselect({
                buttonText: function(options, select) {
                    if (options.length == 0) {
                        return 'None selected <b class="caret"></b>';
                    }
                    else if (options.length > 1) {
                        return options.length + ' selected <b class="caret"></b>';
                    }
                    else {
                        var selected = '';
                        options.each(function() {
                            selected += $(this).text() + ', ';
                        });
                        return selected.substr(0, selected.length -2) + ' <b class="caret"></b>';
                    }
                },
            });

            $('#secondForm').parsley({
                excluded: 'ul.dropdown-menu li input[type=checkbox]'
            });

        })


        </script>
    </body>
</html>
