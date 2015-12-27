<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Budgeter</title>
    
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/public/css/bootstrap.css" />
    <link rel="stylesheet" href="/public/css/bootstrap-theme.min.css" />
    
    <!-- Custom CSS -->
    <link href="/public/css/grayscale.css" rel="stylesheet">
    <link rel="stylesheet" href="/public/css/budgeter.css" />
    
    <!-- Custom Fonts -->
    <link href="/public/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
                                            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                                            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                                            <![endif]-->
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top" ng-app="budgeter">
    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-gbp"></i>
                    <span class="light">Budgeter</span>

                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#uploading">Upload</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#budgeting">Budgeting</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">Budgeter</h1>
                        <p class="intro-text">Managing your day to day finances- one transaction at a time.</p>
                        <a href="#uploading" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Upload Section -->
    <section id="uploading" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Transaction Data Upload</h2>
                <div class="row" ng-controller="TransactionUploadController">
                    <upload-button class="btn btn-primary btn-upload" url="/upload" param="file" accept="acceptTypes" multiple="allowMultiple" force-iframe-upload="forceIframeUpload" data="uploadData" on-upload="onUpload(files)" on-success="onGlobalSuccess(response)" on-error="onError(response)" on-complete="onComplete(response)">Fileupload
                </div>
                </upload-button>
            </div>
        </div>
        </div>
    </section>
    <!-- Budgeting Section -->
    <section id="budgeting" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Organise your transactions</h2>
                <div ng-view="">
                    <div class="nestedDemo row" ng-include="'/public/nested.html'" ng-controller="NestedListsDemoController"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section -->
    <section id="contact" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Contact the Budgeter Team</h2>
                <p>If you fancy it!</p>
                <p>
                    <a href="mailto:jaime.clinton3@gmail.com">jaime.clinton3@gmail.com</a>
                </p>
                <ul class="list-inline banner-social-buttons">
                    <li>
                        <a href="https://github.com/jammyclanger" class="btn btn-default btn-lg">
                            <i class="fa fa-github fa-fw"></i>
                            <span class="network-name">Github</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright &copy; Jaime Clinton 2016</p>
        </div>
    </footer>
    
    <!-- jQuery -->
    <script src="/public/js/jquery-2.1.4.min.js"></script>
    
    <!-- Bootstrap Core JavaScript -->
    <script src="/public/js/bootstrap.min.js"></script>
    
    <!-- Angular Core JavaScript -->
    <script src="/public/js/angular.min.js"></script>
    
    <!-- Angular Drag And Drop Lists Javascript -->
    <script src="/public/js/angular-drag-and-drop-lists.js"></script>
    
    <!-- Angular Upload Javascript -->
    <script src="/public/js/angular-upload.min.js"></script>
    
    <!-- D3 Data Visualisation Javascript -->
    <script src="/public/js/d3.min.js"></script>
    
    <!-- Angular n3 Pie Chart Javascript -->
    <script src="/public/js/pie-chart.min.js"></script>
    
    <!-- jQuery Easing JavaScript -->
    <script src="/public/js/jquery.easing.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="/public/js/main.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="/public/js/grayscale.js"></script>
</body>

</html>