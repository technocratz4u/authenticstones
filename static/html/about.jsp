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


</head>

<body>

	<%@ include file="header.jsp"%>

	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<ul class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>">Home</a></li>
						<li>About Us</li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<h1>Company Overview</h1>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-6">
					<img class="img-responsive"
						src="<%=request.getContextPath()%>/static/img/map-of-thailand.gif"
						alt="Map">
				</div>

				<div class="col-xs-12 col-md-6">
					<h2>Our Story</h2>
					<p>We are one of Thailand's leading Gem Exporters of Precious &
						Semi Precious Colored Stones (specializing in natural & genuine
						Ruby, Sapphire and Emeralds) and operate our business from
						Bangkok, Thailand and Jaipur (Rajasthan) India.</p>
					<p>Authentic Stones Co. Ltd. has been operating globally since
						1990 and specializing in all major shapes & sizes (Cuts & Cabs:
						Rounds, Ovals, Pears, Octagons, Marquise, Taper/Baguette, Heart
						and etc.).</p>
					<p>We have a huge collection of Precious and Semi Precious
						Beads, Briolettes, Tumbles & Drops etc. from Low to Top Quality.</p>
					<p>We are more than just a manufacturer - we re a one stop shop
						for all your specialized needs viz. stones with specific shapes
						and sizes for watches and other accessories. With generations of
						experience in the Gem & Jewelry Industry, Authentic Stones prides
						itself on being the ultimate combination of "Quality, Style, Value
						& impeccable services worldwide".</p>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<hr>
					<h2>Our Mission</h2>
					<p>To color your loved once life with our colorful gemstones,
						beads & carvings.</p>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<h2>Our Passion</h2>
					<p>To providing exceptional products and exemplary customer
						service, at very nominal costs, are the leading factors for our
						thriving business in this competitive market.</p>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<h2>We strive to provide</h2>
					<ul>
						<li>Great Price and Value</li>
						<li>Wide Variety of Products</li>
						<li>Innovative Designs & Flawless Finish</li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12">
					<h2>Our Aim</h2>
					<p>Our aim is 100% customer satisfaction & display 100% of the
						company's offline inventory online through authenticstones.com to
						its existing customers & new customers worldwide (end users,
						retailers, jewelers & designers).</p>
					<p>Every attempt has been made to give an accurate description
						and photograph of each item. We encourage you to send request to
						us for more details & price information regarding a specific
						product before you place your order. We are sure you will be happy
						with your order. We cater to all market segments suiting all
						budgets & constraints.</p>
					<hr>
				</div>
			</div>

			<div class="row">
				<h2>Integrity & Compliance</h2>
			</div>

			<div class="row well center-block">
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/Certificate1.jpg"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/Certificate1.jpg"
						alt="Certificate">
					</a>
				</div>
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/Certificate.jpg"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/Certificate.jpg"
						alt="Certificate">
					</a>
				</div>
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/Company_Registration.jpg"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/Company_Registration.jpg"
						alt="Company Registration">
					</a>
				</div>
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/Certificate2.jpg"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/Certificate2.jpg"
						alt="Certificate">
					</a>
				</div>
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/Gem&JewellryAssociationMembership.jpg"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/Gem&JewellryAssociationMembership.jpg"
						alt="Gem & Jewellry Association Membership">
					</a>
				</div>
				<div class="col-xs-12 col-md-2">
					<a
						href="<%=request.getContextPath()%>/static/img/certificates/AboutUs.docx"
						class="thumbnail"> <img class="img-responsive sameHeight"
						src="<%=request.getContextPath()%>/static/img/certificates/AboutUs.jpg"
						alt="About Us">
					</a>
				</div>
			</div>

		</div>
		<!-- /.container -->
	</div>

	<!-- Home page content end -->

	<%@ include file="footer.jsp"%>

	<%@ include file="footer_includes.jsp"%>

	<script src="<%=request.getContextPath()%>/static/js/home.js"></script>

</body>
</html>
