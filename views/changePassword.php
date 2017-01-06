<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Checkout</title>

<?php include "header_includes.php"; ?>

<link href="<?php echo __WEB_ROOT?>/static/css/userProfile.css" rel="stylesheet" />
</head>

<body>

	<?php include "header.php"; ?>
	<?php 
		$userDetails = $model;
	?>
	<input type="hidden" id="msgStatus" value="<?php echo $userDetails["STATUS"]?>" />

	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Change Password</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" id="userProfile">

					<div class="page-box">
						<div class="h3">
						  Change Password
						</div>
						<hr>
						<form method="post" id="userPasswordForm" action="<?php echo __WEB_ROOT?>/user/changepassword" class="form-horizontal">
						 <div class="alert" id="msgId" style="display:none;"></div>
 
  							<div id="chngePassword" style="display: inline;">
	  							<div class="form-group">
		    						<label for="Password" class="col-sm-2 control-label">Old Password</label>
		   							 <div class="col-sm-3">
		    					       <input type="password" class="form-control" name="oldpassword" id="oldpassword" placeholder="Old Password">
		   							 </div>
	  							</div>
	  							 <div class="form-group">
		    						<label for="Password" class="col-sm-2 control-label">New Password</label>
		   							 <div class="col-sm-3">
		    					       <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="New Password">
		   							 </div>
	  							</div>
	  							<div class="form-group">
		    						<label for="Password" class="col-sm-2 control-label">Confirm Password</label>
		   							 <div class="col-sm-3">
		    					       <input type="password" class="form-control" id="confirmPassword" id="confirmPassword" placeholder="Confirm Password">
		   							 </div>
	  							</div>
  							</div>
								
								<div class="form-group">
   								 <div class="col-sm-12">
   								 <div class="addressbtn">
    							  <button type="submit" id="changePasswordbtn" class="btn btn-dark">Change Password</button>
    							  </div>
    							</div>
 							    </div>
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	 <script src="<?php echo __WEB_ROOT?>/static/js/changePassword.js"></script>

</body>
</html>
