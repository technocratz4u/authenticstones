<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Authentic Stones Privacy Policy</title>

<?php include "header_includes.php"; ?>
<link href="<?php echo __WEB_ROOT?>/static/css/product.css" rel="stylesheet" />

</head>

<body>

	<?php include "header.php"; ?>
	<?php 
		$productDetails = $model;
		//print_r($homePageDetails);
	?>

	<!-- Home page content start -->

	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<ul class="breadcrumb">
						<li><a href="<?php echo __WEB_ROOT?>">Home</a></li>
						<li>Product</li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2 hidden-xs hidden-sm">
					<div id="thumbs">
						<?php
							if(isset($productDetails["images"]["image_url"][__FRONT_IMAGE_NAME])
									&& strlen($productDetails["images"]["image_url"][__FRONT_IMAGE_NAME])>0){
						?>
						<a href="<?php echo $productDetails["images"]["image_url"][__FRONT_IMAGE_NAME]?>" class="zoomframe zoomin thumb"> 
							<img class="img-responsive"
							src="<?php echo $productDetails["images"]["image_url"][__FRONT_IMAGE_NAME]?>" alt="" />
						</a>
						<?php
							}else if(isset($productDetails["images"]["image_url"][__BACK_IMAGE_NAME])
									&& strlen($productDetails["images"]["image_url"][__BACK_IMAGE_NAME])>0){
						?>
						<a href="<?php echo $productDetails["images"]["image_url"][__BACK_IMAGE_NAME]?>" class="zoomframe zoomin thumb"> 
							<img class="img-responsive"
							src="<?php echo $productDetails["images"]["image_url"][__BACK_IMAGE_NAME]?>" alt=""/>
						</a>
						<?php
							}else if(isset($productDetails["images"]["image_url"][__LEFT_IMAGE_NAME])
									&& strlen($productDetails["images"]["image_url"][__LEFT_IMAGE_NAME])>0){
						?>
						<a href="<?php echo $productDetails["images"]["image_url"][__LEFT_IMAGE_NAME]?>" class="zoomframe zoomin thumb"> 
							<img class="img-responsive"
							src="<?php echo $productDetails["images"]["image_url"][__LEFT_IMAGE_NAME]?>" alt="" />
						</a>
						<?php
							}else if(isset($productDetails["images"]["image_url"][__RIGHT_IMAGE_NAME])
									&& strlen($productDetails["images"]["image_url"][__RIGHT_IMAGE_NAME])>0){
						?>
						<a href="<?php echo $productDetails["images"]["image_url"][__RIGHT_IMAGE_NAME]?>" class="zoomframe zoomin thumb"> 
							<img class="img-responsive"
							src="<?php echo $productDetails["images"]["image_url"][__RIGHT_IMAGE_NAME]?>" alt="" />
						</a>
						<?php
							}
						?>
						  
					</div>
				</div>
				<div class="col-xs-12 col-sm-6">
					<div id="mainImage" class="zoomframe zoomin">
						<img src="<?php echo $productDetails["images"]["image_url"][__FRONT_IMAGE_NAME]?>"
							alt="" class="img-responsive" id="product-image">
					</div>
				</div>
				<div class="clearfix visible-xs-block"></div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<h3><?php echo $productDetails["carat_weight"].' ct. '.$productDetails["item_name"].' ('.$productDetails["origin_name"].') '.$productDetails["shape"].' - '.$productDetails["dimensions"]?></h3>
					<h3><?php echo $productDetails["currency"].' '.number_format($productDetails["item_price"], 2 )?></h3>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					<!-- <h3>29.09 ct. Beautiful Emerald (Zambia) Drop - 23.7 x 14.6 mm</h3> -->
					<!-- <h3>$124.00</h3> -->
					<p>&nbsp;</p>
					<p> <?php echo $productDetails["description"]?><a href="#details" id="goTo"><i><small>...View
									More</small></i></a>
					</p>
					<p>&nbsp;</p>
					<hr>
					<div class="media">
						<div class="media-body">
							<input type="number" value="1" class="form-control pull-left"
								id="product-quantity" min="1">
							<a
								href='javascript:addToCart(<?php echo json_encode($productDetails)?>);'
								class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to
								cart</a>
							<p>&nbsp;</p>
							<p>Show it to your friends</p>
							<p>
								<a href="#" class="external facebook" data-animate-hover="pulse"><i
									class="fa fa-facebook"></i></a> <a href="#" class="external gplus"
									data-animate-hover="pulse"><i class="fa fa-google-plus"></i></a>
								<a href="#" class="external twitter" data-animate-hover="pulse"><i
									class="fa fa-twitter"></i></a> <a href="#" class="email"
									data-animate-hover="pulse"><i class="fa fa-envelope"></i></a>
							</p>
						</div>
						<div class="media-right">
							<img
								src="<?php echo __WEB_ROOT?>/static/img/partners_paypal.jpg"
								class="media-object buy-from-us-img" border="0" alt="PayPal">
							<img class="media-object buy-from-us-img"
								src="<?php echo __WEB_ROOT?>/static/img/FedEx-Express-logo-300x224_1.png"
								alt="FedEx">
						</div>
					</div>
					<p>&nbsp;</p>
					<hr class="hidden-md hidden-lg">
				</div>

				<div class="clearfix"></div>
				<div class="row" id="details">
					<div class="col-xs-12 col-md-8">
						<div class="table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr id="info">
										<th colspan="2">Additional Information</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Shipping</td>
										<td>Ships Within 24-48 Hours</td>
									</tr>
									<tr>
										<td>Description</td>
										<td><?php echo $productDetails["description"]?></td>
									</tr>
									<tr>
										<td>Stock No.</td>
										<td><?php echo $productDetails["item_code"]?></td>
									</tr>
									<tr>
										<td>Natural Gemstone</td>
										<td>Yes</td>
									</tr>
									<tr>
										<td>Carat Weight</td>
										<td><?php echo $productDetails["carat_weight"]?></td>
									</tr>
									<tr>
										<td>Dimensions</td>
										<td><?php echo $productDetails["dimensions"]?></td>
									</tr>
									<tr>
										<td>Country Of Origin</td>
										<td><?php echo $productDetails["origin_name"]?></td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
					<div class="clearfix visible-xs-block"></div>
					<div class="col-xs-12 col-md-4"></div>
				</div>
			</div>


		</div>
		<!-- /.container -->
	</div>

	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	<script src="<?php echo __WEB_ROOT?>/static/js/front.js"></script>

</body>
</html>
