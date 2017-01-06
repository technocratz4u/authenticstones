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

<link href="<?php echo __WEB_ROOT?>/static/css/checkout.css" rel="stylesheet" />
</head>

<body>

	<?php include "header.php"; ?>

	<!-- Home page content start -->

	<?php 
		if (isset($model)){
			$checkoutDetails = $model;
			//print_r($categoryPageDetails);
		}
	?>
	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Edit Profile</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-9" id="checkout">

					<div class="page-box">
						
						<div class="h3">
						  <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Secured Checkout
						</div>
						<!-- If the user lands directly on this page by typing in address bar. This link click is triggered if user session is not present to open the login overlay -->
						<a class="btn btn-dark checkoutBtn" style="display: none;">Proceed to Checkout &raquo;</a>
						<form id="checkoutRedirectForm" action="<?php echo __WEB_ROOT?>/checkout" style="display: none;"></form>
						<div id="securedPayThrobber" style="display:none;"></div>
						<div id="securedPayContainer">
							<div id="securedPayPPFormContainer" style="display:none;"></div>
							<ul class="nav nav-pills nav-justified">
								<li id="address_li" class="active"><a id="address_tab" href="#checkout-address"
									data-toggle="pill"><i class="fa fa-map-marker"></i><br>Delivery Address</a>
								</li>
								<li id="review_li" class="disabled"><a  id="review_tab" href="#checkout-review"
									data-toggle="pill"><i class="fa fa-eye"></i><br>Order
										Summary</a></li>
								<li id="payment_li" class="disabled"><a id="payment_tab" href="#checkout-payment" data-toggle="pill"><i
										class="fa fa-money"></i><br>Payment Method</a></li>
							</ul>

							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="checkout-address">
								<div id="addressThrobber" style="display:none;"></div>
								<div class="page-content " id="addressContainer">
									<div class="alert alert-danger alert-dismissible" id="address_alert_container" role="alert" style="display:none;"></div>
									<div class="row" id="existingAddresses">
										<?php 
											if (isset($checkoutDetails) && isset($checkoutDetails["user_addresses"])
													&& sizeof($checkoutDetails["user_addresses"])>0){
												foreach ($checkoutDetails["user_addresses"] as $userAddressIndex => $userAddressElem) {
										?>
										   <div class="col-sm-12 col-md-6">
												<div class="page-box addressBox" id="address_box_<?php echo $userAddressElem["user_address_id"] ?>">
													<h4 class="nomargin"><?php echo $userAddressElem["addr_full_name"] ?></h4>
													<p>
														<?php echo $userAddressElem["address"] ?><br>
														<?php echo $userAddressElem["city"] ?><br>
														<?php echo $userAddressElem["state"] ?> <?php echo $userAddressElem["pin"] ?> <br>
														<?php echo $userAddressElem["country"] ?><br>
														<strong>Phone:</strong> <?php echo $userAddressElem["contact_number"] ?><br>
													</p>

													<div class="page-box-footer nomargin text-center" style="padding:5px; margin-top:20px;">
														<input type="radio" id="userAddressRadio_<?php echo $userAddressElem["user_address_id"] ?>" class="userAddressRadio" name="address" value="<?php echo $userAddressElem["user_address_id"] ?>" />
													</div>
												</div>
											</div>
											
											<div class="clearfix visible-xs-block visible-sm-block"></div>
											
											<?php 
												if (($userAddressIndex+1)%2==0){
											?>
					                        	<div class="clearfix visible-md-block visible-lg-block"></div>
					                        <?php
												}
											?>
					                        
										<?php
												}
											}
										?>
										
								</div>
								<div class="row" id="addNewAddrRow">
									<div class="col-xs-12" style="text-align: center;">

										<button class="addNewAddr btn btn-dark btn-sm hidden-sm hidden-md hidden-lg">
											+ Add New Address
										</button>
										<button class="addNewAddr btn btn-dark hidden-xs">
											+ Add New Address
										</button>

									</div>
								</div>
									<div id="newAddressThrobber" style="display: none;"></div>
									<div class="page-content" id="newAddress" style="display: none;">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="newAddrFName">Full Name</label> <input type="text" id="newAddrFName"
														class="form-control" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<label for="newAddrAddress">Address</label> <input type="text" id="newAddrAddress"
														class="form-control" />
												</div>
											</div>
										</div>
										
										<!-- /.row -->

										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="newAddrCity">City</label> <input type="text" id="newAddrCity"
														class="form-control" />
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label for="newAddrState">State</label> <input type="text" id="newAddrState"
														class="form-control" />
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label for="newAddrZip">ZIP</label> <input type="text" id="newAddrZip"
														class="form-control" />
												</div>
											</div>
											<div class="col-sm-3">
												<div class="form-group">
													<label for="newAddrCountry">Country</label> <input type="text" id="newAddrCountry"
														class="form-control" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<div class="form-group">
													<label for="newAddrTelephone">Telephone</label> <input type="text" id="newAddrTelephone"
														class="form-control" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12" style="text-align:center; margin-top:10px;">
	
												<button class="useExiAddr btn btn-default btn-sm hidden-sm hidden-md hidden-lg">
													&laquo; Use Existing Address
												</button>
												<button class="useNewAddr btn btn-dark btn-sm hidden-sm hidden-md hidden-lg">
													Use This Address &raquo;
												</button>
												<button class="useExiAddr btn btn-default hidden-xs">
													&laquo; Use Existing Address
												</button>
												<button class="useNewAddr btn btn-dark hidden-xs">
													Use This Address &raquo;
												</button>

											</div>
										</div>
										<!-- /.row -->
									</div>
								</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="checkout-payment">
									<div class="page-content">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<div class="page-box">
												<h4>Paypal</h4>

													<a
														href="https://www.paypal.com/in/webapps/mpp/paypal-popup"
														title="Paypal"
														onclick="javascript:window.open('https://www.paypal.com/in/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;">
														<img
																class="img-responsive"
																src='<?php echo __WEB_ROOT?>/static/img/partners_paypal.jpg'
																border="0" alt="PayPal Acceptance Mark">
													</a>

													<div class="page-box-footer text-center selectedAddress">

														<input type="radio" name="payment" value="payment1" checked="checked" />
													</div>
												</div>
											</div>

										</div>
										<!-- /.row -->

									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="checkout-review">
									<div class="page-content">
										<div class="alert alert-danger alert-dismissible" id="cart_alert_container" role="alert" style="display:none;"></div>
										<div class="table-responsive">
											<table class="table" id="orderDetailsTbl">
												<thead>
													<tr>
														<th colspan="2">Product</th>
														<th>Quantity</th>
														<th>Unit price</th>
														<th>Total Price</th>
													</tr>
												</thead>
												<tbody>
													
												</tbody>
											</table>

										</div>
										<!-- /.table-responsive -->
									</div>
									<!-- /.content -->

								</div>


							<div class="page-box-footer">
								<div class="pull-left">
									<a href='<?php echo __WEB_ROOT?>/basket/view' id="btnBackToBasket"
										class="btn btn-default">&laquo; Back
										to Basket</a>
									<button id="btnBackToAddress" class="btn btn-default" style="display: none;">
										&laquo; Back to Address
									</button>
									<button id="btnBackToOrder" class="btn btn-default" style="display: none;">
										&laquo; Back to Order
									</button>
									
								</div>
								<div class="pull-right">
									<button id="btnCntToOrder" class="btn btn-dark">
										Continue to Order Review &raquo;
									</button>
									<button id="btnCntToPayment" class="btn btn-dark" style="display: none;">
										Continue to Payment Method &raquo;
									</button>
									<button id="btnMakePayment" class="btn btn-dark" style="display: none;">
										Make Payment &raquo;
									</button>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- /.box -->


				</div>

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
											<td id="ordSmOrdTotal"></td>
										</tr>
										<tr>
											<td>Shipping and handling</td>
											<td id="ordSmHspHnd"></td>
										</tr>
										<tr>
											<td>Tax</td>
											<td id="ordSmTax"></td>
										</tr>
										<tr>
											<td>Discount</td>
											<td id="ordSmHspDsc"></td>
										</tr>
										<tr class="total">
											<td>Total</td>
											<td id="ordSmTotal"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>

		</div>
		<!-- /.container -->
	</div>
	</div>
	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	 <script src="<?php echo __WEB_ROOT?>/static/js/checkout.js"></script>

</body>
</html>
