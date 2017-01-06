<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Checkout</title>

<%@ include file="header_includes.jsp"%>
<link href="<%=request.getContextPath()%>/static/css/checkout.css"
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
						<li>Checkout</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9" id="checkout">

					<div class="page-box">
						<form method="post" action="#">
							<h1>Checkout</h1>
							<ul class="nav nav-pills nav-justified">
								<li class="active"><a href="#checkout-address"
									data-toggle="pill"><i class="fa fa-map-marker"></i><br>Address</a>
								</li>
								<li class=""><a href="#checkout-delivery"
									data-toggle="pill"><i class="fa fa-truck"></i><br>Delivery
										Method</a></li>
								<li class=""><a href="#checkout-payment" data-toggle="pill"><i
										class="fa fa-money"></i><br>Payment Method</a></li>
								<li class=""><a href="#checkout-review" data-toggle="pill"><i
										class="fa fa-eye"></i><br>Order Review</a></li>
							</ul>

							<div class="tab-content">
								<div class="tab-pane fade in active" id="checkout-address">
									<div class="page-content">
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
										</div>
										<!-- /.row -->

										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="company">Company</label> <input type="text"
														class="form-control" id="company">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="street">Street</label> <input type="text"
														class="form-control" id="street">
												</div>
											</div>
										</div>
										<!-- /.row -->

										<div class="row">
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label for="city">Company</label> <input type="text"
														class="form-control" id="city">
												</div>
											</div>
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label for="zip">ZIP</label> <input type="text"
														class="form-control" id="zip">
												</div>
											</div>
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label for="state">State</label> <select
														class="form-control" id="state"></select>
												</div>
											</div>
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label for="country">Country</label> <select
														class="form-control" id="country"></select>
												</div>
											</div>

											<div class="col-sm-6">
												<div class="form-group">
													<label for="phone">Telephone</label> <input type="text"
														class="form-control" id="phone">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group">
													<label for="email">Email</label> <input type="text"
														class="form-control" id="email">
												</div>
											</div>

										</div>
										<!-- /.row -->
									</div>
								</div>
								<div class="tab-pane fade" id="checkout-delivery">
									<div class="page-content">
										<div class="row">
											<div class="col-sm-6">
												<div class="page-box">

													<h4>Fedex</h4>

													<p>Get it right on next day - fastest option possible.</p>

													<div class="page-box-footer text-center">

														<input type="radio" name="delivery" value="delivery1">
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="page-box">

													<h4>USPS Next Day</h4>

													<p>Get it right on next day - fastest option possible.</p>

													<div class="page-box-footer text-center">

														<input type="radio" name="delivery" value="delivery2">
													</div>
												</div>
											</div>

										</div>
										<!-- /.row -->

									</div>
								</div>
								<div class="tab-pane fade" id="checkout-payment">
									<div class="page-content">
										<div class="row">
											<div class="col-sm-6">
												<div class="page-box">

													<h4>Paypal</h4>

													<p>We like it all.</p>

													<div class="page-box-footer text-center">

														<input type="radio" name="payment" value="payment1">
													</div>
												</div>
											</div>
											<div class="col-sm-6">
												<div class="page-box">

													<h4>Payment gateway</h4>

													<p>VISA and Mastercard only.</p>

													<div class="page-box-footer text-center">

														<input type="radio" name="payment" value="payment2">
													</div>
												</div>
											</div>
										</div>
										<!-- /.row -->

									</div>
								</div>
								<div class="tab-pane fade" id="checkout-review">
									<div class="page-content">
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th colspan="2">Product</th>
														<th>Quantity</th>
														<th>Unit price</th>
														<th>Discount</th>
														<th>Total</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><a href="#"> <img
																class="img-responsive cart-image-width"
																src="<%=request.getContextPath()%>/static/img/diamond-3d.jpg"
																alt="Diamond">

														</a></td>
														<td><a href="#">Diamond Cut</a></td>
														<td>2</td>
														<td>$123.00</td>
														<td>$0.00</td>
														<td>$246.00</td>
														<td><a href="#"><i class="fa fa-trash-o"></i></a></td>
													</tr>
													<tr>
														<td><a href="#"> <img
																class="img-responsive cart-image-width"
																src="<%=request.getContextPath()%>/static/img/ruby-3d.jpg"
																alt="Ruby">
														</a></td>
														<td><a href="#">Ruby Cut</a></td>
														<td>1</td>
														<td>$200.00</td>
														<td>$0.00</td>
														<td>$200.00</td>
														<td><a href="#"><i class="fa fa-trash-o"></i></a></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="5">Total</th>
														<th>$446.00</th>
													</tr>
												</tfoot>
											</table>

										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.content -->

								</div>
							</div>




							<div class="page-box-footer">
								<div class="pull-left">
									<a href="<%=request.getContextPath()%>/static/html/basket.jsp"
										class="btn btn-default"><i class="fa fa-chevron-left"></i>Back
										to basket</a>
								</div>
								<div class="pull-right">
									<button type="submit" class="btn btn-dark">
										Continue to Delivery Method<i class="fa fa-chevron-right"></i>
									</button>
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
					<!-- /.box -->


				</div>


				<!-- /.col-md-9 -->

				<div class="col-md-3">
					<div class="panel panel-default" id="order-summary">

						<div class="panel-heading">
							<h3 class="panel-title">Order summary</h3>
						</div>
						<div class="panel-body">
							<p class="text-muted">Shipping and additional costs are
								calculated based on the values you have entered.</p>

							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr>
											<td>Order subtotal</td>
											<th>$446.00</th>
										</tr>
										<tr>
											<td>Shipping and handling</td>
											<th>$10.00</th>
										</tr>
										<tr>
											<td>Tax</td>
											<th>$0.00</th>
										</tr>
										<tr>
											<td>Discount</td>
											<th>$5.00</th>
										</tr>
										<tr class="total">
											<td>Total</td>
											<th>$451.00</th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

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
