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
		$orderDetails = $model;
	?>
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
					<h1>Order Successful</h1>
					<hr>
				</div>
			</div>
			

				<?php
                	if(isset($orderDetails)){
      
                ?>
              <div class="row">
				<div class="col-xs-12">
                	<div class="panel panel-default">
						<div class="panel-heading">
							<div class="row">
								<div class="col-sm-8 col-md-11 col-lg-9">
									<h4> ORDER ID <?php echo $orderDetails["order_id"]?></h4>
									<p>
										Placed on <?php echo $orderDetails["order_time"]?>
									</p>
									<p>
										Total Amount <?php echo $orderDetails["currency"].' '.$orderDetails["total_amount"]?>
									</p>
								</div>
						  </div>
						</div>
						<?php
                		if(isset($orderDetails["item_details"]) && sizeof($orderDetails["item_details"])>0){
                			foreach ($orderDetails["item_details"] as $orderItemIndex => $orderItemObject) {
      
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
										<h5 class="text-uppercase"><?php echo $orderItemObject["item_name"]?> (<?php echo $orderItemObject["item_code"]?>)</h5>
										<h5 class="text-uppercase">Quantity : <?php echo $orderItemObject["quantity"]?></h5>
									</div>
									<div class="col-sm-6 col-md-3">
									   <h5><?php echo $orderItemObject["currency"].' '.$orderItemObject["item_price"]?></h5>
									   
									</div>
									<div class="col-sm-6 col-md-3">
										<h5 class="text-uppercase delivered"><?php echo $orderDetails["status"]?></h5>
										<p>on <?php echo $orderDetails["order_time"]?></p>
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
             <div class="page-box">
                		<div class="row">
                			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                				<h4 class="final-detials-heading"><span><?php echo $orderDetails["currency"].' '.$orderDetails["total_amount"]?></span><span>Paid Amount</span></h4>
                			
	                			<ul class="price-details">
									<li><span class="amount"><?php echo $orderDetails["total_amount"]?></span><span>Price</span></li>
									<li><span class="amount">FREE</span><span>Shipping Charges</span></li>							
								</ul>
							</div>
							<div class="col-lg-2 col-md-2 hidden-sm hidden-xs"></div>
							<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 shipping-address-block">
								<h4 class="final-detials-heading">SHIPPING  ADDRESS</h4>
								<strong><?php echo $orderDetails["full_name"]?></strong><br>
								<?php echo $orderDetails["address"]?><br>
								<?php echo $orderDetails["city"]?><br>
								<?php echo $orderDetails["state"]?><br>
								<?php echo $orderDetails["pin"]?><br>
								<?php echo $orderDetails["country"]?><br>
								<?php echo $orderObject["contact_number"]?><br><br>
							</div>
							<div class="col-lg-2 col-md-12 col-sm-12 col-xs-12 payment-mode-block">
							<h4 class="final-detials-heading">PAYMENT MODE</h4><p>PayPal</p>
							</div>	
                		</div>
              </div>			
                
                <?php	
                	}
               	?>

		</div>
			
		</div>
		<!-- /.container -->
	</div>

	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	<script src="<?php echo __WEB_ROOT?>/static/js/paypalordersuccess.js"></script>
	
</body>
</html>
