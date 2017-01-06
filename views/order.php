<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Orders</title>

<?php include "header_includes.php"; ?>

<link href="<?php echo __WEB_ROOT?>/static/css/order.css" rel="stylesheet" />
</head>

<body>

	<?php include "header.php"; ?>
	<?php 
		$orders = $model;
	?>
	<input type="hidden" id="intervalPeriod" value="<?php echo $orders["interval"]?>" />
	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Order</li>
					</ul>
				</div>
			</div>
			
			<div class="page-box">
			
			<div class="row">
				<div class="col-xs-12">
					<h1>Your Orders</h1>
					<hr>
				</div>
			</div>
			<div class="row rowmapping">
				<div class="col-xs-12 col-sm-2">
				
					<h4><?php echo sizeof($orders["orders"])?> order placed in</h4>
					
				</div>
				<div class="col-xs-12 col-sm-10">
				
					  <div class="dropdown">
		  				<button class="btn btn-dark dropdown-toggle" type="button" id="orderPeriod" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						     Last 3 months
						    <span class="caret"></span>
						  </button>
						  <ul id="intervalList" class="dropdown-menu" aria-labelledby="orderPeriod">
						    <li><a href="#" data-value="30">Last 30 days</a></li>
						    <li><a href="#" data-value="3">Last 3 months</a></li>
						    <li><a href="#" data-value="6">Last 6 months</a></li>
						    <li><a href="#" data-value="ALL">All orders</a></li>
						  </ul>
						</div>
					
				</div>
			</div>
			

				<?php
                		if(isset($orders["orders"]) && sizeof($orders["orders"])>0){
                			foreach ($orders["orders"] as $orderIndex => $orderObject) {
      
                ?>
              <div class="row">
				<div class="col-xs-12">
                	<div class="panel panel-default" id="<?php echo $orderIndex?>">
						<div class="panel-heading">
							<div class="row">
								<div class="col-sm-8 col-md-11 col-lg-9">
									<h4> ORDER ID <?php echo $orderObject["order_id"]?></h4>
									<p>
										Placed on <?php echo $orderObject["order_time"]?>
									</p>
									<p>
										Total Amount <?php echo $orderObject["currency"].' '.$orderObject["total_amount"]?>
									</p>
								</div>
								<div class="col-sm-4 col-md-1 col-lg-3">
									<button class="btn btn-dark order-btn" style="display: inline;" onClick="showOrderDetails(<?php echo $orderIndex?>)" id ="ordrDetails_<?php echo $orderIndex?>" href="#">ORDER DETAILS</button>
								</div>
						  </div>
						</div>
						<?php
                		if(isset($orderObject["itemDetails"]) && sizeof($orderObject["itemDetails"])>0){
                			foreach ($orderObject["itemDetails"] as $orderItemIndex => $orderItemObject) {
      
              		    ?>
              		    <div class="panel-body">
								<div class="row rowmargntop">
											<div class="col-sm-6 col-md-2">
											 <a href="<?php echo __WEB_ROOT?>/product/view/<?php echo $orderItemObject["item_name"]?>/<?php echo $orderItemObject["item_id"]?>"> <img
													class="img-responsive order-image-width"
													src="<?php echo $orderItemObject["images"]["image_url"][__FRONT_IMAGE_NAME]?>"
													alt="">
											</a>
											</div>
											<div class="col-sm-6 col-md-4 product-heading">
											<h5 class="text-uppercase"><?php echo $orderItemObject["item_name"]?></h5>
											<h5 class="text-uppercase">Product Code <?php echo $orderItemObject["item_code"]?>| QTY <?php echo $orderItemObject["quantity"]?></h5>
											</div>
											<div class="col-sm-6 col-md-3">
											   <h5><?php echo $orderObject["currency"].' '.$orderItemObject["item_price"]?></h5>
											   
											</div>
											<div class="col-sm-6 col-md-3">
											<h5 class="text-uppercase delivered"><?php echo $orderObject["status"]?></h5>
											<p>on <?php echo $orderObject["status_modification_time"]?></p>
											</div>

								</div>
							</div>
							                
                  <?php	
                			}
                			  }
                			  ?>
							
					</div>
				</div>
			</div>	        	
             <div  id ="orderDetailsSection_<?php echo $orderIndex?>" class="page-box" style="display: none;">
                		<div class="row">
                			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                				<h4 class="final-detials-heading"><span><?php echo $orderObject["currency"].' '.$orderObject["total_amount"]?></span><span>Paid Amount</span></h4>
                			
	                			<ul class="price-details">
									<li><span class="amount"><?php echo $orderObject["total_amount"]?></span><span>Price</span></li>
									<li><span class="amount">FREE</span><span>Shipping Charges</span></li>							
								</ul>
							</div>
							<div class="col-lg-2 col-md-2 hidden-sm hidden-xs"></div>
							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 shipping-address-block">
								<h4 class="final-detials-heading">SHIPPING  ADDRESS</h4>
								<strong><?php echo $orderObject["full_name"]?></strong><br><?php echo $orderObject["address"]?><br><?php echo $orderObject["contact_number"]?><br><br><?php echo $orderObject["email"]?>
							</div>
							<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12 payment-mode-block">
							<h4 class="final-detials-heading">PAYMENT MODE</h4><p>Pay Pal</p>
							</div>	
                		</div>
              </div>			
                
                  <?php	

                			
                			}
                		}
                	?>


		</div>
			
			

		</div>
		<!-- /.container -->
	</div>

	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	<script src="<?php echo __WEB_ROOT?>/static/js/order.js"></script>

</body>
</html>
