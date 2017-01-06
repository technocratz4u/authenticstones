<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones category page</title>

<%@ include file="header_includes.jsp"%>

<link href="<%=request.getContextPath()%>/static/css/contactus.css"
	rel="stylesheet" />

</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Contact</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="page-box" id="contact">
						<div class="indentMpng">
							<h1>Contact</h1>

							<p class="lead">Are you curious about something? Do you have
								some kind of problem with our products?</p>
							<p>We make your vision a reality - contact us with a brief
								description of your needs and we will give you the special
								attention you deserve!!</p>
							<p>Your opinion counts and we value your advice. We want to
								hear what you think of our products and how we can make it
								easier for you to use</p>
							<p>Please feel free to contact us.</p>

						</div>


						<hr>

						<div class="row">
							<div class="col-sm-4 addressDetails">
								<h3>
									<i class="fa fa-map-marker"></i> Address
								</h3>
								<p>
									388 Sita Building, 4th Fl. <br>Suite 401 <br>Mahaseak
									Rd. <br>Suriyawongse, Bangrak <br>Bangkok 10500 <br>
									<strong>Thailand</strong>
								</p>
							</div>
							<!-- /.col-sm-4 -->
							<div class="col-sm-4 addressDetails">
								<h3>
									<i class="fa fa-phone"></i> Call center
								</h3>
								<p>
									<strong> Fax: +662-635-9263</strong>
								</p>
							</div>
							<!-- /.col-sm-4 -->
							<div class="col-sm-4 addressDetails">
								<h3>
									<i class="fa fa-envelope"></i> Electronic support
								</h3>
								<p class="text-muted">Please feel free to write an email to
									us</p>
								<ul>
									<li><strong><a href="mailto:">authenticstones@gmail.com</a></strong>
									</li>
								</ul>
							</div>
							<!-- /.col-sm-4 -->
						</div>
						<!-- /.row -->

						<hr>

						<div class="row">
							<div class="col-md-12">
								<div id="map"></div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-12">

								<h2>Contact form</h2>

								<form>
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="firstname">Firstname</label> <input type="text"
													class="form-control" id="firstname">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="lastname">Lastname</label> <input type="text"
													class="form-control" id="lastname">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="email">Email</label> <input type="text"
													class="form-control" id="email">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="subject">Subject</label> <input type="text"
													class="form-control" id="subject">
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<label for="message">Message</label>
												<textarea id="message" class="form-control"></textarea>
											</div>
										</div>

										<div class="col-sm-12 text-center">
											<button type="submit" class="btn btn-dark">
												<i class="fa fa-envelope-o"></i> Send message
											</button>

										</div>
									</div>
									<!-- /.row -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->
	<!-- Home page content end -->

	<%@ include file="footer.jsp"%>

	<%@ include file="footer_includes.jsp"%>
	<script src="https://maps.googleapis.com/maps/api/js?key=&sensor=false"></script>
	<script src="<%=request.getContextPath()%>/static/js/contactus.js"></script>

</body>
</html>
