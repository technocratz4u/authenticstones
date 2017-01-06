<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Shopping Cart</title>

<?php include "header_includes.php"; ?>

<link href="<?php echo __WEB_ROOT?>/static/css/checkout.css"
	rel="stylesheet" />
</head>

<body>

	<?php include "header.php"; ?>
	
	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Shopping Cart</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9" id="basket">

					<div class="page-box">


							<h3><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Shopping Cart</h3>
							<p class="text-muted">
								You currently have <span class="itemsInCart"></span> item(s) in
								your cart.
							</p>
						<div id="cartSectionThrobber" style="display: none;"></div>
						<div id="cartSectionContainer">
							<div class="table-responsive">
								<table class="table" id="cartDisplay">
									<thead>
										<tr>
											<th colspan="5">Products</th>
											<th colspan="2">Total Amount</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<!-- <hr>
							<div class="row">
								<div class="col-xs-2">
									Have a Coupon Code? <span class="light_gray">(Optional)</span>
								</div>
								<div class="col-xs-4">
									<input type="text" class="form-control">
								</div>
								<div class="col-xs-2">
									<span class="input-group-btn">
										<button class="btn btn-dark" type="button">
											<i class="fa fa-gift"></i>Apply
										</button>
									</span>
								</div>
								<div class="clearfix"></div>
							</div> -->

							<div class="row">
								<hr>
								<p>&nbsp;</p>
								<div class="col-md-6 visible-md-block visible-lg-block">
									<a href="<?php echo __WEB_ROOT?>/category/search" class="btn btn-default">&laquo; Continue shopping</a>
								</div>
								<div class="col-md-6 visible-md-block visible-lg-block">
									<a class="btn btn-dark pull-right checkoutBtn">Proceed to Checkout &raquo;</a>
								</div>
								<div class="col-sm-6 visible-sm-block">
									<a href="<?php echo __WEB_ROOT?>/category/search" class="btn btn-default">&laquo; Continue shopping</a>
								</div>
								<div class="col-sm-6 visible-sm-block">
									<a class="btn btn-dark pull-right checkoutBtn">Proceed to Checkout &raquo;</a>
								</div>
								<div class="col-xs-12 visible-xs-block" style="text-align: center;">
									<a href="<?php echo __WEB_ROOT?>/category/search" class="btn btn-default">&laquo; Continue shopping</a>
								</div>
								<div class="col-xs-12 visible-xs-block" style="text-align: center;margin-top: 10px;">
									<a class="btn btn-dark checkoutBtn">Proceed to Checkout &raquo;</a>
								</div>
								<div class="clearfix"></div>
							</div>
							<form id="checkoutRedirectForm" action="<?php echo __WEB_ROOT?>/checkout" style="display: none;"></form>
						</div>
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
											<td>Order Total</td>
											<th colspan="2" class="orderTotal"></th>
										</tr>
										<tr>
											<td>Shipping and Handling</td>
											<th colspan="2">$0.00</th>
										</tr>
										<tr>
											<td>Tax</td>
											<th colspan="2">$0.00</th>
										</tr>
										<tr>
											<td>Discount</td>
											<th colspan="2">$0.00</th>
										</tr>
										<tr class="total">
											<td>Total</td>
											<th colspan="2" class="orderTotal"></th>
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

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	<script src="<?php echo __WEB_ROOT?>/static/js/basket.js"></script>
	
</body>
</html>