<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Dashboard</title>
	<?php include __SITE_PATH . '/service/utils/HtmlAttributeFilter.php' ; ?>
    <?php include "header_includes.php"; ?>
    
    <link href="<?php echo __WEB_ROOT?>/static/css/sidebar.css"
	rel="stylesheet" />

</head>

<body>


	<!-- Home page content start -->
		<?php
		if (isset ( $model )) {
			$categoryPageDetails = $model;
			// print_r($categoryPageDetails);
		}
		?>
		
		
        <div id="page-content">
        
		<?php include "adminTopMenu.php"; ?>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>Admin Dashboard</li>
					</ul>
				</div>
			</div>


			<div class="row">
				<div class="col-md-3">
					<?php include "adminLeftMenu.php"; ?>
				</div>

				<div class="col-md-9">
					<div class="page-box">
						<h1>Add/Update Category</h1>
						<p>You can update and add categories from this page.</p>
					</div>
				</div>

				<!-- /.col-md-9 -->
			</div>
			<!-- /.container -->
		</div>
	</div>
	-->
	<!-- Home page content end -->


	<?php include "footer_includes.php"; ?>	
	
	
	<script src="<?php echo __WEB_ROOT?>/static/js/admin.js"></script>


</body>
</html>
