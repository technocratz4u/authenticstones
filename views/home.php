<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Authentic Stones</title>

    <?php include "header_includes.php"; ?>
    
    <link href="<?php echo __WEB_ROOT?>/static/css/home.css" rel="stylesheet" />
    
  </head>

  <body>
	
	<?php include "header.php"; ?>

	<?php 
		$homePageDetails = $model;
		//print_r($homePageDetails);
	?>
	<!-- Home page content start -->
	
    <div id="homeCarousel" class="owl-carousel owl-theme">
     
      <div class="item"><img class="img-responsive" src="<?php echo __WEB_ROOT?>/static/img/diamond-3d.jpg" alt="Diamond"></div>
      <div class="item"><img class="img-responsive" src="<?php echo __WEB_ROOT?>/static/img/ruby-3d.jpg" alt="Ruby"></div>
      <div class="item"><img class="img-responsive" src="<?php echo __WEB_ROOT?>/static/img/emrald-3d.jpg" alt="Emrald"></div>
      <div class="item"><img class="img-responsive" src="<?php echo __WEB_ROOT?>/static/img/sapphire-3d.jpg" alt="Sapphire"></div>
     
    </div>

	<div class="container">
		<div class="row" id="home-product-row">
			<div class="col-sm-4">
				<div class="zoomframe zoomin home-product-row-cntnr">
					<img class="img-responsive product-img" src="<?php echo __WEB_ROOT?>/static/img/diamond-3d.jpg" alt="Diamond">
				</div>
				<a class="product-title" href="#">Stones</a>
				<p class="product-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
				<a href="#" class="btn btn-dark">Read More &raquo;</a>
			</div>
			<div class="col-sm-4">
				<div class="zoomframe zoomin home-product-row-cntnr">
					<img class="img-responsive product-img" src="<?php echo __WEB_ROOT?>/static/img/emrald-3d.jpg" alt="Emrald">
				</div>
				<a class="product-title" href="#">Beads</a>
				<p class="product-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
				<a href="#" class="btn btn-dark">Read More &raquo;</a>
			</div>
			<div class="col-sm-4">
				<div class="zoomframe zoomin home-product-row-cntnr">
					<img class="img-responsive product-img" src="<?php echo __WEB_ROOT?>/static/img/ruby-3d.jpg" alt="Ruby">
				</div>
				<a class="product-title" href="#">Carvings</a>
				<p class="product-description">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
				<a href="#" class="btn btn-dark">Read More &raquo;</a>
			</div>
		</div>
	</div>
    <div class="container">
		<div class="row" id="buy-from-us-title">
			<div class="col-lg-12">
				<a href="#">Why Buy from Us?</a>
			</div>
		</div>
		<div class="row" id="buy-from-us-body">
			<div class="col-md-5 buy-from-us-list">
				<ul>
					<li>Best Prices on all collection of stones, beads and carvings</li>
					<li>Largest collection of stones, beads and carvings to choose from</li>
					<li>All our products are certified by reputed laboratories</li>
					<li>Free Shipping and Insurance, hassle free delivery</li>
				</ul>
			</div>
			<div class="col-md-2" id="buy-from-us-banner">
				<img class="img-responsive" id="buy-from-us-img" src="<?php echo __WEB_ROOT?>/static/img/home_buy_from_us_banner1.jpg" alt="Why Buy from Us">
			</div>
			<div class="col-md-5 buy-from-us-list">
				<ul>
					<li>Guidance and consultation from Best in class experts</li>
					<li>Top notch Customer Service ensuring complete satisfaction</li>
					<li>Prompt responses on quotations received ensuring timely delivery</li>
				</ul>
			</div>
		</div>
		<div class="row" id="buy-from-us-read-more">
			<a href="#" class="btn btn-dark">Read More &raquo;</a>
		</div>
	</div>
	<div class="container">
		<div class="row" id="hot-this-week-title">
			<div class="col-lg-12">
				<a href="#">Hot this Week</a>
			</div>
		</div>
		<div class="row" id="hot-this-week-body">
			<div class="col-lg-12">
				<div id="hot-this-week-carousel" class="owl-carousel">
                	<?php
                		if(isset($homePageDetails["hot_this_week"]) && sizeof($homePageDetails["hot_this_week"])>0){
                			foreach ($homePageDetails["hot_this_week"] as $hotThisWeekDetailsIndex => $hotThisWeekDetailsElem) {
                	?>
                		<div class="item">
		                	<div class="product">
		                		<div class="flip-container zoomframe zoomin">
		                			<img src="<?php echo $hotThisWeekDetailsElem["images"]["thumb_url"][__FRONT_IMAGE_NAME] ?>" alt="" class="img-responsive">
		                		</div>
		                		<div class="text">
	                                <h3><a href="detail.html"><?php echo $hotThisWeekDetailsElem["item_name"] ?><br/><?php echo $hotThisWeekDetailsElem["item_code"] ?></a></h3>
	                                <p class="price"><?php echo $hotThisWeekDetailsElem["item_price"] ?> <?php echo $hotThisWeekDetailsElem["currency"] ?></p>
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
	</div>
	<article id="home-page-testimonial">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h2 id="home-page-testimonial-title">Clients who loved us</h2>
					<div id="home-page-testimonial-body">
						<div id="home-page-testimonial-carousel" class="owl-carousel">
		                	<div class="item">
			                  <p class="home-page-testimonial-text">" Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est."</p>
			                  <div class="home-page-testimonial-author">April Johns, <span class="place">Canada</span></div>
		                	</div>
		                	<div class="item">
			                  <p class="home-page-testimonial-text">" Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est."</p>
			                  <div class="home-page-testimonial-author">May Johns, <span class="place">USA</span></div>
		                	</div>
		                	<div class="item">
			                  <p class="home-page-testimonial-text">" Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est."</p>
			                  <div class="home-page-testimonial-author">July Johns, <span class="place">Thailand</span></div>
		                	</div>
		                	<div class="item">
			                  <p class="home-page-testimonial-text">" Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est. Voluptatum corrupti  quos dolores et quas molestias excepturi sint occaecati cupiditate nonrofficia deserunt mollitia animi id est."</p>
			                  <div class="home-page-testimonial-author">August Johns, <span class="place">China</span></div>
		                	</div>
	                	</div>
	                	<a href="#" class="btn btn-dark">Read More »</a>
					</div>
				</div>
			</div>
		</div>
	</article>
	
	<div class="container">
		<div class="row" id="our-partners-title">
			<div class="col-lg-12">
				<a href="#">Our Partners</a>
			</div>
		</div>
		<div class="row" id="our-partners-body">
			<div class="col-md-4">
				<h4>Pay Securely With</h4>
				<!-- PayPal Logo -->
				<img src="<?php echo __WEB_ROOT?>/static/img/partners_paypal.jpg" class="img-responsive"
								border="0" alt="PayPal">
				<!-- PayPal Logo -->
			</div>
			<div class="col-md-4">
				<h4>Shipped By</h4>
				<img class="img-responsive" id="buy-from-us-img" src="<?php echo __WEB_ROOT?>/static/img/FedEx-Express-logo-300x224_1.png" alt="FedEx">
			</div>
			<div class="col-md-4" id="track-order">
				<h4>Track Your Order</h4>
				<a href="http://www.fedex.com/us/track/" target="_blank" class="btn btn-dark btn-lg">Track Now<i class="fa fa-search fa-fw"></i></a> 
			</div>
			
		</div>
	</div>

	<!-- Home page content end -->
	
	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>	
    
    <script src="<?php echo __WEB_ROOT?>/static/js/home.js"></script>
    
  </body>
</html>
