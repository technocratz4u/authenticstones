<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SkyForge Cloud Management</title>

<!-- Bootstrap core CSS -->
<link
	href="<?php echo __WEB_ROOT?>/assets/bootstrap-3.3.2-dist/css/bootstrap.min.css"
	rel="stylesheet" />

<link href="<?php echo __WEB_ROOT?>/assets/css/dshbrd_cld_view.css"
	rel="stylesheet" />


<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="<?php echo __WEB_ROOT?>/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="<?php echo __WEB_ROOT?>/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="<?php echo __WEB_ROOT?>/assets/js/html5shiv.min.js"></script>
      <script src="<?php echo __WEB_ROOT?>/assets/js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="bsModal" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4">
							<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_twrs.png"
								class="img-responsive" alt="Cinque Terre">
						</div>
						<div class="col-md-4 col-md-offset-4">
							<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_twrs.png"
								class="img-responsive" alt="Cinque Terre">
						</div>
					</div>
					<div class="row">
						<div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
						<div class="col-md-2 col-md-offset-4">.col-md-2 .col-md-offset-4</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
					</div>
					<div class="row">
						<div class="col-sm-9">
							Level 1: .col-sm-9
							<div class="row">
								<div class="col-xs-8 col-sm-6">Level 2: .col-xs-8 .col-sm-6</div>
								<div class="col-xs-4 col-sm-6">Level 2: .col-xs-4 .col-sm-6</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<input type="hidden" id="cntxtPathUrl" value="<?php echo __WEB_ROOT?>" />
	<form id="userLogoutForm" method="post" style="display: none;">
		<input type="hidden" id="logoutFlag" name="logoutFlag" value="Y" />
	</form>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color: #FFFFFF"> <span
					class="glyphicon glyphicon-cloud"
					style="font-size: 2.5em; line-height: 0.2em" aria-hidden="true"></span>
					<span style="font-size: 1.5em; line-height: 0.8em">SkyForge</span>
				</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown active"><a aria-expanded="false" role="button"
						data-toggle="dropdown" class="dropdown-toggle" href="#">Dashboard
							<span class="caret"></span>
					</a>
						<ul role="menu" class="dropdown-menu">
							<li class="active"><a href="dhsbrd_cld_view.html">Cloud View</a></li>
							<li><a href="#">Application View</a></li>
						</ul></li>
					<li><a href="provisioning.html">Provisioning</a></li>
					<li><a href="monitoring.html">Monitoring</a></li>
					<li><a href="#">Metering</a></li>
					<li><a href="#">Analytics</a></li>
					<li class="dropdown"><a aria-expanded="false" role="button"
						data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="caret"></span>
					</a>
						<ul role="menu" class="dropdown-menu">
							<li><a href="#">Profile</a></li>
							<li><a href="javascript:void(0);" onclick="logoutUser();">Logout</a></li>
						</ul></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container">
		<!-- Jumbotron -->
		<div class="jumbotron">
			<h1>Integrated Cloud Management</h1>
			<p class="lead">
				Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce
				dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
				ut fermentum massa justo sit amet. <br /> <br />
        <?php echo __SERVER_NAME?>
        <br /> <br />
        <?php 
			if(isset($_SESSION["dataPresent"])){
				echo $_SESSION["dataPresent"];
			}
		?>
		
        </p>
			<p>
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#bsModal">Launch demo modal</button>
			</p>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<button class="btn btn-primary" type="button" data-toggle="collapse"
					data-target="#collapseExample" aria-expanded="false"
					aria-controls="collapseExample">Size Chart</button>
				<div class="collapse" id="collapseExample">
					<div class="well">Cras justo odio, dapibus ac facilisis in, egestas
						eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet.</div>
				</div>
			</div>
		</div>
		<div class="row" id="respMsgDiv" style="display:none;">
			
		</div>
		<form class="form-horizontal" id="uploadForm" method="post">
			<div class="form-group">
				<label for="category" class="col-sm-2 control-label">Category</label>
				<div class="col-sm-10">
					<select class="form-control" id="category" name="category">
						<option value="Men">Men</option>
						<option value="Women">Women</option>
						<option value="Kids">Kids</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="designId" class="col-sm-2 control-label">Design ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="designId"
						name="designId" placeholder="Design ID">
				</div>
			</div>
			<div class="form-group">
				<label for="side" class="col-sm-2 control-label">Side</label>
				<div class="col-sm-10">
					<select class="form-control" id="side" name="side">
						<option value="Front">Front</option>
						<option value="Back">Back</option>
						<option value="Left">Left</option>
						<option value="Right">Right</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="userImage" class="col-sm-2 control-label">Image File</label>
				<div class="col-sm-10">
					<input type="file" id="userImage" name="userImage">
					<p class="help-block">Allowed Formats are jpg, jpeg, gif, png.</p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="uploadDesignImage()">Upload Image</button>
				</div>
			</div>
		</form>
		<div class="row" id="progressBarDiv" style="display:none;">
			<div class="col-lg-12">
				<div class="progress">
					<div id="progressBar" class="progress-bar progress-bar-success"
						role="progressbar" aria-valuenow="0" aria-valuemin="0"
						aria-valuemax="100" style="min-width: 2em;">0%</div>
				</div>
			</div>
		</div>
		<div class="row" id="mailRespMsgDiv" style="display:none;">
			
		</div>
		<form class="form-horizontal" id="mailForm" method="post">
			<div class="form-group">
				<label for="mailTo" class="col-sm-2 control-label">Mail To</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="mailTo"
						name="mailTo" placeholder="Mail To">
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						name="name" placeholder="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="password"
						name="password" placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="sendMail()">Send Mail</button>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img
						src="<?php echo __WEB_ROOT?>/assets/image/Azure-Logo_Small.jpg" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="http://azure.microsoft.com/en-us/" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img
						src="<?php echo __WEB_ROOT?>/assets/image/AWS_LOGO_RGB_300px.jpg" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="http://aws.amazon.com/" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img
						src="<?php echo __WEB_ROOT?>/assets/image/IBM_logo_blue_high_res_-_small.jpg" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="http://www.ibm.com/cloud-computing/in/en/" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img
						src="<?php echo __WEB_ROOT?>/assets/image/HP Helion Logo_Cloud_Martin Fink_New Style of IT_Hewlett-Packard.PNG" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="http://www.hpcloud.com/" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img
						src="<?php echo __WEB_ROOT?>/assets/image/logo-google-cloud-platform.png" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="https://cloud.google.com/" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
			<div class="cldSvcCntnr col-sm-4 col-md-2">
				<div class="thumbnail cloud-prvdr-logo">
					<img src="<?php echo __WEB_ROOT?>/assets/image/oracle-cloud.jpeg" />
				</div>
				<div class="caption cldSvcCaption">
					<a href="https://cloud.oracle.com/home" target="_blank"
						class="btn btn-primary btn-xs" role="button"> View Site </a>
				</div>
			</div>
		</div>

		<div id="wdgtCntnr">
			<div class="row widget-row">
				<div id="ntwkSttsDsbWdgtCntnrWrpr" class="col-lg-6">
					<div class="dsbWdgtCntnrInr">
						<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_twrs.png"
							class="img-responsive" alt="Cinque Terre">
					</div>
				</div>
				<div id="vmUsgDsbWdgtCntnrWrpr" class="col-lg-6">
					<div class="dsbWdgtCntnrInr">
						<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_circs.png"
							class="img-responsive" alt="Cinque Terre">
					</div>
				</div>
			</div>
			<div class="row widget-row">
				<div id="appCntDsbWdgtCntnrWrpr" class="col-lg-6">
					<div class="dsbWdgtCntnrInr">
						<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_line.png"
							class="img-responsive" alt="Cinque Terre">
					</div>
				</div>
				<div id="svcCntDsbWdgtCntnrWrpr" class="col-lg-6">
					<div class="dsbWdgtCntnrInr">
						<img src="<?php echo __WEB_ROOT?>/assets/image/dshbrd_bars.png"
							class="img-responsive" alt="Cinque Terre">
					</div>
				</div>

			</div>
		</div>


		<div class="row">
			<!-- Site footer -->
			<footer class="footer">
				<p>&copy; Company 2014</p>
			</footer>
		</div>


	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<?php echo __WEB_ROOT?>/assets/js/jquery.min.js"></script>
	<script
		src="<?php echo __WEB_ROOT?>/assets/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src="<?php echo __WEB_ROOT?>/assets/js/ie10-viewport-bug-workaround.js"></script>

	<script src="<?php echo __WEB_ROOT?>/assets/js/jquery.form.min.js"></script>


	<script src="<?php echo __WEB_ROOT?>/assets/js/commonFns.js"></script>
	<script src="<?php echo __WEB_ROOT?>/assets/js/homeFns.js"></script>

</body>
</html>