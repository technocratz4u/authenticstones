<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones - Admin Page</title>

<?php include "header_includes.php"; ?>


</head>

<body>
	<?php 
		$retArray= $model;
	?>
	<input type="hidden" id="msgStatus" value="<?php echo $retArray["STATUS"]?>" />

	<div id="page-content">
		<header id="header">
			<div class="header-top">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<h4>
								<a href="<?php echo __WEB_ROOT?>" class="text-center"> Authentic
									Stones Co., Ltd. - Admin Login Page</a>
							</h4>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="container">

			<div class="row">
				<div class="col-xs-12">
					<h3>Admin Login Page</h3>
				</div>
			</div>


			<div class="row">
				<div class="col-xs-12">

					<form id="admin-login-form"
						action="<?php echo __WEB_ROOT?>/admin/login" method="post"
						role="form">
						<div class="alert alert-danger" id="msgId"
							style="display: none;"></div>

						<div class="form-group">
							<input name="login_username" id="login-username" tabindex="1"
								class="form-control" placeholder="Username" value="" type="text">
						</div>
						<div class="form-group">
							<input name="login_password" id="login-password" tabindex="2"
								class="form-control" placeholder="Password" type="password">
						</div>
						<div class="text-center">
							<input tabindex="3" class="" name="login_remember"
								id="login-remember" type="checkbox"> <label for="login-remember">
								Remember Me</label>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<button id="login-admin-button" tabindex="4"
										class="btn btn-dark btn-block">Log In</button>
									<button id="checkout-login-admin-button" tabindex="4"
										class="btn btn-dark btn-block" style="display: none;">Log In</button>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-lg-12">
									<div class="text-center">
										<a href="" tabindex="5" class="forgot-password">Forgot
											Password?</a>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
			</div>


		</div>
	</div>



	<?php include "footer_includes.php"; ?>
	 <script src="<?php echo __WEB_ROOT?>/static/js/admin.js"></script>


</body>
</html>
