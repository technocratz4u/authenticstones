<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Authentic Stones category page</title>
	<?php include __SITE_PATH . '/service/utils/HtmlAttributeFilter.php' ; ?>
    <?php include "header_includes.php"; ?>
    
    <link href="<?php echo __WEB_ROOT?>/static/css/sidebar.css" rel="stylesheet" />
    <link href="<?php echo __WEB_ROOT?>/static/css/category.css" rel="stylesheet" />
    
  </head>

  <body>
	
	<?php include "header.php"; ?>

	<!-- Home page content start -->
		<?php 
			if (isset($model)){
				$categoryPageDetails = $model;
				//print_r($categoryPageDetails);
			}
		?>
		<input type="hidden" id="filter_page" value="<?php echo $categoryPageDetails["filter_params"]["page"] ?>" />
		<input type="hidden" id="filter_page_size" value="<?php echo $categoryPageDetails["filter_params"]["page_size"] ?>" />
		<input type="hidden" id="filter_sort_by" value="<?php echo $categoryPageDetails["filter_params"]["sort_by"] ?>" />
		<input type="hidden" id="filter_category" value="<?php echo $categoryPageDetails["filter_params"]["category"] ?>" />
		<input type="hidden" id="filter_shape" value="<?php echo $categoryPageDetails["filter_params"]["shape"] ?>" />
		<input type="hidden" id="filter_origin" value="<?php echo $categoryPageDetails["filter_params"]["origin"] ?>" />
		<input type="hidden" id="filter_price_range" value="<?php echo $categoryPageDetails["filter_params"]["price_range"] ?>" />
		<input type="hidden" id="filtered_product_count" value="<?php echo $categoryPageDetails["filtered_product_count"] ?>" />
		
		
        <div id="page-content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Loose Gemstones</li>
                    </ul>
                </div>

                <div class="col-md-3">
                    <!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
 						
					
					<?php 
						if (isset($categoryPageDetails) && isset($categoryPageDetails["category_detail"])
								&& sizeof($categoryPageDetails["category_detail"])>0){
					?>
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Category <button type="button" class="btn btn-default btn-xs pull-right" id="clearCategoryFilterBtn"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                                <div class="form-group">
                                	<?php
				                		foreach ($categoryPageDetails["category_detail"] as $categoryDetailIndex => $categoryDetailElem) {
				                	?>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="categoryChkBx" id="<?php echo HtmlAttributeFilter::filter("ctgrchkbx_".$categoryDetailElem["category_url_pattern"]) ?>"
                                            	value="<?php echo $categoryDetailElem["category_url_pattern"] ?>"><?php echo $categoryDetailElem["category_name"] ?>
                                        </label>
                                    </div>
                                    <?php
                                   		if (isset($categoryDetailElem["sub_category_detail"])
                                    		&& sizeof($categoryDetailElem["sub_category_detail"])>0){
				                			foreach ($categoryDetailElem["sub_category_detail"] as $subCategoryDetailIndex => $subCategoryDetailIndexElem) {
				                	?>
                                    <div class="checkbox xtra-left-padded">
                                        <label>
                                            <input type="checkbox" class="subCategoryChkBx <?php echo $categoryDetailElem["category_url_pattern"]."ChkBx" ?>" 
                                            	id="<?php echo HtmlAttributeFilter::filter("sbctgrchkbx_".$categoryDetailElem["category_url_pattern"]."--".$subCategoryDetailIndexElem["sub_category_url_pattern"]) ?>"
                                            	value="<?php echo $categoryDetailElem["category_url_pattern"]."--".$subCategoryDetailIndexElem["sub_category_url_pattern"] ?>"><?php echo $subCategoryDetailIndexElem["sub_category_name"] ?>
                                        </label>
                                    </div>
                                    <?php
											}
                                   		}
									?>
                                    <?php
										}
									?>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark applyFilterBtn"><i class="fa fa-pencil"></i> Apply</button>

                        </div>
                    </div>
					<?php
						}
					?>
					
					
					<?php 
						if (isset($categoryPageDetails) && isset($categoryPageDetails["shape_detail"])
								&& sizeof($categoryPageDetails["shape_detail"])>0){
					?>
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Shape <button type="button" class="btn btn-default btn-xs pull-right" id="clearShapeFilterBtn"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                                <div class="form-group">
                                	<?php
				                		foreach ($categoryPageDetails["shape_detail"] as $shapeDetailIndex => $shapeDetailElem) {
				                	?>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="shapeChkBx" id="<?php echo HtmlAttributeFilter::filter("shpchkbx_".$shapeDetailElem["shape_url_pattern"]) ?>"
                                            value="<?php echo $shapeDetailElem["shape_url_pattern"] ?>"><?php echo $shapeDetailElem["shape"] ?> (<?php echo $shapeDetailElem["shape_count"] ?>)
                                        </label>
                                    </div>
                                    <?php
										}
									?>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark applyFilterBtn"><i class="fa fa-pencil"></i> Apply</button>

                        </div>
                    </div>
					<?php
						}
					?>
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Price Range <button type="button" class="btn btn-default btn-xs pull-right"  id="clearPriceFilterBtn"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                                <div class="form-group">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="priceChkBx" class="priceChkBx" id="prcchkbx_below-100-USD"
                                            	value="below-100-USD"> Below 100 USD (<?php echo isset($categoryPageDetails["price_detail"]["below_100"]) ? $categoryPageDetails["price_detail"]["below_100"] : "0" ?>)
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="priceChkBx" class="priceChkBx" id="prcchkbx_between-100-500-USD"
                                            	value="between-100-500-USD"> Between 100 USD &amp; 500 USD (<?php echo isset($categoryPageDetails["price_detail"]["between_100_500"]) ? $categoryPageDetails["price_detail"]["between_100_500"] : "0" ?>)
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="priceChkBx" class="priceChkBx" id="prcchkbx_between-500-1000-USD"
                                            	value="between-500-1000-USD"> Between 500 USD &amp; 1000 USD (<?php echo isset($categoryPageDetails["price_detail"]["between_500_1000"]) ? $categoryPageDetails["price_detail"]["between_500_1000"] : "0" ?>)
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="priceChkBx" class="priceChkBx" id="prcchkbx_between-1000-2000-USD"
                                            	value="between-1000-2000-USD"> Between 1000 USD &amp; 2000 USD (<?php echo isset($categoryPageDetails["price_detail"]["between_1000_2000"]) ? $categoryPageDetails["price_detail"]["between_1000_2000"] : "0" ?>)
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="priceChkBx" class="priceChkBx" id="prcchkbx_above-2000-USD"
                                            	value="above-2000-USD"> Above 2000 USD (<?php echo isset($categoryPageDetails["price_detail"]["above_2000"]) ? $categoryPageDetails["price_detail"]["above_2000"] : "0" ?>)
                                        </label>
                                    </div>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark applyFilterBtn"><i class="fa fa-pencil"></i> Apply</button>

                        </div>
                    </div>
                    
                    <?php 
						if (isset($categoryPageDetails) && isset($categoryPageDetails["origin_detail"])
								&& sizeof($categoryPageDetails["origin_detail"])>0){
					?>
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Origin <button type="button" class="btn btn-default btn-xs pull-right"  id="clearOriginFilterBtn"><i class="fa fa-times-circle fa-fw"></i> Clear</button></h3>
                        </div>

                        <div class="panel-body">

                                <div class="form-group">
                                	<?php
				                		foreach ($categoryPageDetails["origin_detail"] as $originDetailIndex => $originDetailElem) {
				                	?>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" class="originChkBx" id="<?php echo HtmlAttributeFilter::filter("orgchkbx_".$originDetailElem["origin_url_pattern"]) ?>"
                                            	value="<?php echo $originDetailElem["origin_url_pattern"] ?>"> <?php echo $originDetailElem["origin_name"] ?> (<?php echo $originDetailElem["origin_count"] ?>)
                                        </label>
                                    </div>
                                    <?php
										}
									?>
                                </div>

                                <button class="btn btn-default btn-sm btn-dark applyFilterBtn"><i class="fa fa-pencil"></i> Apply</button>

                        </div>
                    </div>
					<?php
						}
					?>
                </div>

                <div class="col-md-9">

                    <div class="page-box info-bar" id="page-controls">
                        <div class="row">
                            <div class="col-sm-12 col-md-4 products-showing">
                                Showing <strong id="show_filtered_start_index"></strong> to 
                                <strong id="show_filtered_end_index"></strong> 
                                of <strong id="show_filtered_product_count"></strong> products
                            </div>

                            <div class="col-sm-12 col-md-8  products-number-sort">
                                <div class="row">
                                    <form class="form-inline">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-number">
                                                <strong>Show</strong>  
                                                <select id="pageSizeCombo" class="form-control">
                                                    <option>15</option>
                                                    <option>30</option>
                                                    <option>45</option>
                                                </select> <span style="padding-left: 10px;">products</span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="products-sort-by">
                                                <strong>Sort by</strong>
                                                <select id="sortByCombo" class="form-control">
                                                    <option value="price">Price</option>
                                                    <option value="name">Name</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row products" id="product-section">
						<?php 
							if (isset($categoryPageDetails) && isset($categoryPageDetails["item_detail"])
									&& sizeof($categoryPageDetails["item_detail"])>0){
								foreach ($categoryPageDetails["item_detail"] as $itemDetailIndex => $itemDetailElem) {
						?>
							<div class="col-md-4 col-sm-6">
	                            <div class="product">
	                                <a class="zoomframe zoomin productImgCntnr"
	                                	href="<?php echo __WEB_ROOT."/product/view/".$itemDetailElem["item_url_pattern"]."/".$itemDetailElem["item_id"] ?>">
	                                    <img src="<?php echo $itemDetailElem["images"]["thumb_url"][__FRONT_IMAGE_NAME] ?>" alt="" class="img-responsive">
	                                </a>
	                                <div class="text">
	                                    <h3><a href="<?php echo __WEB_ROOT."/product/view/".$itemDetailElem["item_url_pattern"]."/".$itemDetailElem["item_id"] ?>"><?php echo $itemDetailElem["item_name"] ?><br/><?php echo $itemDetailElem["item_code"] ?></a></h3>
	                                    <p class="price"><?php echo $itemDetailElem["item_price"] ?> <?php echo $itemDetailElem["currency"] ?></p>
	                                    <p class="buttons">
	                                        <a href="<?php echo __WEB_ROOT."/product/view/".$itemDetailElem["item_url_pattern"]."/".$itemDetailElem["item_id"] ?>" class="btn btn-default">View detail &raquo;</a>
	                                        <!-- <a href="#" class="btn btn-dark"><i class="fa fa-shopping-cart"></i> Add to cart</a>  -->
	                                    </p>
	                                </div>
	                                <!-- /.text -->
	                            </div>
	                            <!-- /.product -->
	                        </div>
	                        <div class="clearfix visible-xs-block"></div>
	                        <?php 
								if (($itemDetailIndex+1)%2==0){
							?>
	                        	<div class="clearfix visible-sm-block"></div>
	                        <?php
								}
							?>
	                        <?php 
								if (($itemDetailIndex+1)%3==0){
							?>
	                        	<div class="clearfix visible-md-block visible-lg-block"></div>
	                        <?php
								}
							?>
							
						<?php
								}
							}else{
						?>
							<div class="col-xs-12">
			                    <div class="page-box">
			                        <p>No matching products found for the selected filters.</p>
			                    </div>
			                </div>
						<?php
							}
						?>
                    </div>
                    <!-- /.products -->

                    <div class="pages" id="pagination-controls"></div>
					<form action="<?php echo __WEB_ROOT?>/category/search" method="get" id="applyFilterForm" style="display: none;"></form>

                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>

	<!-- Home page content end -->
	
	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>	
	
	<script src="<?php echo __WEB_ROOT?>/static/plugins/jquery-bootpag/jquery.bootpag.min.js"></script>
	<script src="<?php echo __WEB_ROOT?>/static/js/category.js"></script>
	
    
  </body>
</html>
