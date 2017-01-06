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

<link href="<?php echo __WEB_ROOT?>/static/css/userProfile.css" rel="stylesheet" />
</head>

<body>

	<?php include "header.php"; ?>
	<?php 
		$userDetails = $model;
	?>
	<input type="hidden" id="msgStatus" value="<?php echo $userDetails["STATUS"]?>" />

	<!-- Home page content start -->
	<div id="page-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li>User Profile</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12" id="userProfile">
					<div class="page-box">
					  
						<div class="h3">
						  <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						  Your Profile
						</div>
						<hr>
						<div class="alert" id="msgId" style="display:none;"></div>
						<form method="post"  id="userForm" action="<?php echo __WEB_ROOT?>/user/save" class="form-horizontal user-form">
							
  							<div class="form-group">
    							<label for="Name" class="col-sm-2 control-label">Name</label>
   								 <div class="col-sm-3">
    							  <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="<?php echo $userDetails["full_name"]?>">
   								 </div>
  							</div>
  							 <div class="form-group">
	    						<label for="contactNumber" class="col-sm-2 control-label">Email</label>
	   							 <div class="col-sm-3">
	    					      <p class="form-control-static"><?php echo $userDetails["email"]?></p>
	   							 </div>
  							</div>
  							 <div class="form-group">
	    						<label for="Password" class="col-sm-2 control-label">Password</label>
	   							 <div class="col-sm-3">
	    					     *********
	    					     <a class="your-info change-pass" id="chngePasswordLink" href="<?php echo __WEB_ROOT?>/user/changepassword">Change Password</a>
	   							 </div>
  							</div>
  							 <div id="savedAddress" style="display: inline;">
  							 	 <div class="form-group">
		    						<label for="savedAddress" class="col-sm-3"><i class="fa fa-map-marker"></i> Your Saved Address</label>
		   							 <div class="col-sm-9">    
		   							 </div>
	  							</div>
	  							<div class="row">
	  							<?php
                					if(isset($userDetails["addressDetails"]) && sizeof($userDetails["addressDetails"])>0){
                					foreach ($userDetails["addressDetails"] as $usrAddressIndex => $usrAddressObject) {
      
             					   ?>
             					  <div class="col-lg-12 deleteAddressThrobber" id="deleteAddressThrobber_<?php echo $usrAddressObject["user_address_id"]?>" style="display:none;">
							     </div>
             					   		<div class="col-sm-4" id="addressBlock_<?php echo $usrAddressObject["user_address_id"]?>">
												<div class="page-box">
													<h3>
														<i class="fa fa-map-marker"></i> <?php echo $usrAddressObject["addr_full_name"]?>
													</h3>
													<p>
														<?php echo $usrAddressObject["address"]?> <br><?php echo $usrAddressObject["city"]?> 
														<br><?php echo $usrAddressObject["state"].' '.$usrAddressObject["pin"]?><br>
														<strong><?php echo $usrAddressObject["country"]?></strong><br>
														Contact Number : <?php echo $usrAddressObject["contact_number"]?>
													</p>
													
													<div class="page-box-footer text-center">
													 <button id="address_<?php echo $usrAddressObject["user_address_id"]?>" onClick="deleteAddress(<?php echo $usrAddressObject["user_address_id"]?>)" class="btn btn-dark">
														Delete
													</button>
													</div>

												</div>
									  </div>
             					   
             					   <?php 
                					    }
                				    }
             					   
             					   ?>
	  							</div>
							</div>
										<div class="form-group" id="newAddressBtn">
											<div class="col-sm-12">
												<div class="addressbtn">
	
													<button id="addNewAddress" class="btn btn-dark">
														+ ADD NEW ADDRESS
													</button>

												</div>
											</div>
										</div>
										<div id="newAddressBlock" style="display: none;">
										    <div class="alert alert-danger" id="save_alert_container" style="display:none;"></div>
			  							 	 <div class="form-group">
					    						<label for="addNewAddress" class="col-sm-3"> Add New Address</label>
					   							 <div class="col-sm-9">    
					   							 </div>
				  							</div>
				  							<div class="form-group">
    											<label for="Name" class="col-sm-2 control-label">Name</label>
				   								 <div class="col-sm-3">
				    							  <input type="text" class="form-control" name="newFullName" id="newFullName" placeholder="Name">
				   								 </div>
				  							</div> 
				  							<div class="form-group">
					    						<label for="Contact Number" class="col-sm-2 control-label">Contact Number</label>
					   							 <div class="col-sm-3">
					    					      <input type="text" class="form-control" name="newContactNumber" id="newContactNumber" placeholder="Contact Number">
					   							 </div>
				  							</div>
				  							<div class="form-group">
												<label for="Address Line 1" class="col-sm-2 control-label">Address Line 1</label> 
												<div class="col-sm-6">
												<input type="text" class="form-control" name="newAddrLine1"  id="newAddrLine1" placeholder="Address Line 1">
												</div>
											</div>
											<div class="form-group">
												<label for="Address Line 2" class="col-sm-2 control-label">Address Line 2</label>
												<div class="col-sm-6">
												 <input type="text" class="form-control" name="newAddrLine2" id="newAddrLine2" placeholder="Address Line 2">
												 </div>
											</div>
											<div class="form-group">
												<label for="City" class="col-sm-2 control-label">City</label>
												<div class="col-sm-3">
												<input type="text" class="form-control"  name="newCity" id="newCity" placeholder="City" >
												</div>
											</div>
											<div class="form-group">
												<label for="State" class="col-sm-2 control-label">State</label>
												<div class="col-sm-3">
												<input type="text" class="form-control" name="newState" id="newState" placeholder="State" >
												</div>
											</div>
											<div class="form-group">
												<label for="Pin" class="col-sm-2 control-label">Pin</label>
												<div class="col-sm-3">
												<input type="text" class="form-control" name="newPin" id="newPin" placeholder="Pin">
												</div>
											</div>	
											<div class="form-group">
												<label for="Pin" class="col-sm-2 control-label">Country</label>
												<div class="col-sm-3">
												<input type="text" class="form-control" name="newCountry" id="newCountry" placeholder="Country">
												</div>
											</div>
											<div class="form-group" id="cancelBtnblock">
   								 				<div class="col-sm-12">
   								 					<div class="addressbtn">
    											  		<button  id="cancelBtn" class="btn btn-dark">Cancel</button>
    										  	 	</div>
    											</div>
 							    			</div>
										</div>
								
								<div class="form-group">
   								 <div class="col-sm-12">
   								 <div class="addressbtn">
    							  <button type="submit" id="saveBtn" class="btn btn-dark">SAVE CHANGES</button>
    							  </div>
    							</div>
 							    </div>
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
		</div>
		<!-- /.container -->
	</div>
	<!-- Home page content end -->

	<?php include "footer.php"; ?>

	<?php include "footer_includes.php"; ?>
	
	 <script src="<?php echo __WEB_ROOT?>/static/js/userProfile.js"></script>

</body>
</html>
