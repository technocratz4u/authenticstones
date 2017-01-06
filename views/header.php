<input type="hidden" id="cntxtPathUrl" value="<?php echo __WEB_ROOT?>" />
<input type="hidden" id="pageUrl" value="<?php echo $_SERVER['REQUEST_URI']?>" />

<header id="header">
	<div class="header-top">
      <div class="container">
        <div class="row">
            <!-- <div class="col-sm-6" id="offer_of_day">
            	<a href="#" class="btn btn-default btn-sm hidden-xs offer_of_day_btn" role="button" >Offer of the Day</a>
            	<a href="#" class="btn btn-default btn-xs visible-xs-inline-block offer_of_day_btn" role="button">Offer of the Day</a>
            	<a href="#" id="offer_of_day_desc">Get flat 30% off on orders over $50!</a>
            </div> -->
            <!-- <div class="col-xs-6" id="search-control-container">
            	<select class="form-control" id="search-control">
					<option></option>
					<optgroup label="Alaskan/Hawaiian Time Zone">
						<option value="AK">Alaska</option>
						<option value="HI">Hawaii</option>
					</optgroup>
			    </select>
            </div> -->
            <div class="col-sm-6" id="header-top-contact">
            	<a href="#" id="header-top-contact-phone"><i class="fa fa-phone fa-fw"></i> +662-635-9263</a>
            	<a href="#" id="header-top-contact-mail"><i class="fa fa-envelope fa-fw"></i> authenticstones@gmail.com</a>
            </div>
            <div class="clearfix visible-xs-block"></div>
            <div class="col-sm-6" id="sign_in_up">
            	<!-- <a href="#" class="btn btn-default btn-sm hidden-xs top-search-button" role="button" >Search</a>
            	<a href="#" class="btn btn-default btn-xs visible-xs-inline-block top-search-button" role="button">Search</a> -->
            	<a data-placement="bottom" data-toggle="popover" data-container="body" role="button" data-html="true" 
            		class="btn btn-default btn-xs top-search-button" href="javascript:void(0);" id="top-search-button"><span class="glyphicon glyphicon-search"></span></a>
            	<div id="popover-content" class="hide">
			      <form id="header-search-form">
			      	<div class="row">
					  <div class="col-xs-12">
					    <div class="input-group">
					      <input type="text" class="form-control" placeholder="Search for...">
					      <span class="input-group-btn">
					        <button class="btn btn-dark" type="button">Go!</button>
					      </span>
					    </div><!-- /input-group -->
					  </div><!-- /.col-lg-6 -->
					 </div>
				  </form>
			    </div>
			    <?php 
					$loginRegisterLinkDisplay = "inline-block";
					$loggedInUserNameDisplay = "none";
					if(isset($_SESSION[__SESSION_KEY_USER_DATA])){
						$loginRegisterLinkDisplay = "none";
						$loggedInUserNameDisplay = "inline-block";
					}
					//print_r($homePageDetails);
				?>
            	<ul class="menu" id="lg_rgstr_lnk_cntnr" style="display: <?php echo $loginRegisterLinkDisplay?>;">
                    <li>
                    	<a id="loginLink" href="#signinupModal" data-toggle="modal">Login</a>
                    </li>
                    <li class="piped">
                    	<a id="registerLink" href="#signinupModal" data-toggle="modal">Register</a>
                    </li>
                </ul>
                <?php 
                	$isUserLoggedIn = "N";
					$loggedInUserName = "";
					if(isset($_SESSION[__SESSION_KEY_USER_DATA])){
						$loggedInUserName = "Hi ".$_SESSION[__SESSION_KEY_USER_DATA]["FULL_NAME"];
						$isUserLoggedIn = "Y";
					}
					//print_r($homePageDetails);
				?>
				<input type="hidden" id="isUserLoggedIn" value="<?php echo $isUserLoggedIn ?>"/>
                <div class="dropdown" id="lgd_in_nm_cntnr" style="display: <?php echo $loggedInUserNameDisplay?>;">
				  <button class="btn btn-dark btn-xs dropdown-toggle" type="button" id="user_settings_menu" data-toggle="dropdown" 
				  	aria-haspopup="true" aria-expanded="false">
				    <?php echo $loggedInUserName?>
				    <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu" aria-labelledby="user_settings_menu">
				    <li><a href="<?php echo __WEB_ROOT?>/user/edit"><i class="fa fa-gear fa-fw"></i> Edit Profile</a></li>
				    <li><a href="<?php echo __WEB_ROOT?>/user/changepassword"><i class="fa fa-gear fa-fw"></i> Change Password</a></li>
				    <li><a href="<?php echo __WEB_ROOT?>/order/view" id="viewOrders"><i class="fa fa-file-text"></i> My Orders</a></li>
				    <li><a id="logoutLink" href="javascript:void(0);"><i class="fa fa-sign-out fa-fw"></i> Sign Out</a></li>
				  </ul>
				</div>
				<form id="logoutForm" action="<?php echo __WEB_ROOT?>/" method="POST">
					<input type="hidden" name="LOGOUT_FLAG" value="Y"/>
				</form>
            </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="signinupModalLabel" id="signinupModal" data-backdrop="static" data-keyboard="false">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="signinupModalLabel">Modal title</h4>
	        <input type="hidden" id="checkoutLoginTrigger" value="N"/>
	      </div>
	      <div class="modal-body">
			<div class="well">
				<ul class="nav nav-tabs">
					<li><a id="loginTab" href="#loginTabContent" data-toggle="tab">Login</a></li>
					<li><a id="registerTab" href="#registerTabContent" data-toggle="tab">Create Account</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade" id="loginTabContent">
						<div class="row">
							<div class="col-lg-12" id="loginFormThrobber" style="display:none;">
							</div>
							<div class="col-lg-12" id="loginFormContainer">
								<div class="alert alert-danger" id="login_alert_container" style="display:none;"></div>
								<form id="login-form" action="" method="post" role="form" >
									<div class="form-group">
										<input name="login_username" id="login-username" tabindex="1" class="form-control" placeholder="Email" value="" type="text">
									</div>
									<div class="form-group">
										<input name="login_password" id="login-password" tabindex="2" class="form-control" placeholder="Password" type="password">
									</div>
									<div class="text-center">
										<input tabindex="3" class="" name="login_remember" id="login-remember" type="checkbox">
										<label for="login-remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button id="login-button" tabindex="4" class="btn btn-dark btn-block">Log In</button>
												<button id="checkout-login-button" tabindex="4" class="btn btn-dark btn-block" style="display:none;">Log In</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>             
					</div>
					<div role="tabpanel" class="tab-pane fade" id="registerTabContent">
						<div class="row">
							<div class="col-lg-12" id="registrationFormThrobber" style="display:none;">
							</div>
							<div class="col-lg-12" id="registrationFormContainer">
								<div class="alert alert-danger" id="register_alert_container" style="display:none;"></div>
								<form id="register-form" action="" method="post" role="form" >
									<div class="form-group">
										<input name="register_name" id="register-name" tabindex="1" class="form-control" placeholder="Name" value="" type="text">
									</div>
									<div class="form-group">
										<input name="register_email" id="register-email" tabindex="2" class="form-control" placeholder="Email" type="text">
									</div>
									<div class="form-group">
										<input name="register_password" id="register-password" tabindex="3" class="form-control" placeholder="Password" type="password">
									</div>
									<div class="form-group">
										<input name="register_confirm_password" id="register-confirm-password" tabindex="4" class="form-control" placeholder="Confirm Password" type="password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button id="register-button" tabindex="5" class="btn btn-dark btn-block">Register</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>   
					</div>
				</div>
			</div>
		</div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
    
    <!-- <h1 class="brand hidden-xs">Authentic Stones Co., Ltd.</h1> -->
    <h1 class="brand">Authentic Stones Co., Ltd.</h1>
  			<div id="home-navbar" class="navbar navbar-default yamm">
	          <div class="navbar-header">
	            <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid" class="navbar-toggle">
	            	<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
	            	<span class="icon-bar"></span>
	            </button>
	            
	            <button type="button" onclick="location.href = '<?php echo __WEB_ROOT?>/basket/view';" class="navbar-toggle btn btn-dark" id="home-navbar-cart-button-collapsed" data-toggle="collapse" data-target="#links"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span> <span class="badge itemsInCart"></span></button>
	            <!-- <a class="visible-xs-block navbar-brand" href="#">Authentic Stones Co., Ltd.</a> -->
	          </div>
	          
	          <div id="navbar-collapse-grid" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
	              <!-- Grid 12 Menu -->
	              	<li class="first active"><a href="#">Home</a></li>
		            <li><a href="<?php echo __WEB_ROOT?>/about">About Us</a></li>
		            <li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Product<b class="caret" style="margin-left:10px;"></b></a>
		                <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h5>Loose Stones</h5>
                                            <ul>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=loose-stones--ruby">Ruby</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=loose-stones--sapphire">Sapphire</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=loose-stones--emerald">Emerald</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Beads</h5>
                                            <ul>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--ruby">Ruby</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--sapphire">Sapphire</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--emerald">Emerald</a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--tsavorite">Tsavorite</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--aquamarine">Aquamarine</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=beads--tourmaline">Tourmaline</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Carvings</h5>
                                            <ul>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--ruby">Ruby</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--sapphire">Sapphire</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--emerald">Emerald</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--tourmaline">Tourmaline</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--tsavorite">Tsavorite</a>
                                                </li>
                                                <li><a href="<?php echo __WEB_ROOT?>/category/search?category=carvings--rose-quartz">Rose Quartz</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 home-navbar-readmore-cntnr">
                                        	<a href="<?php echo __WEB_ROOT?>/category/search" class="btn btn-dark">Read More &raquo;</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
		            </li>
					<li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Sale<b class="caret" style="margin-left:10px;"></b></a>
		                <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h5>Stones</h5>
                                            <ul>
                                                <li><a href="javascript:void(0);">Save 25% on Diamonds</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 20% on Sapphire</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save Upto 15%</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Beads</h5>
                                            <ul>
                                                <li><a href="javascript:void(0);">Save 25% on Diamonds</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 20% on Sapphire</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save Upto 15%</a>
                                                </li>
                                            </ul>
                                            <ul>
                                            	<li><a href="javascript:void(0);">Save 25% on Tsavorite</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 20% on Aquamarine</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save Upto 15%</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Carvings</h5>
                                            <ul>
                                            	<li><a href="javascript:void(0);">Save 25% on Ruby</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 20% on Emrald</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 25% on Tourmaline</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save 20% on Tsavorite</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Save Upto 15%</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 home-navbar-readmore-cntnr">
                                        	<a href="#" class="btn btn-dark">Read More &raquo;</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
		            </li>            
	              	<li><a href="<?php echo __WEB_ROOT?>/contact">Contact Us</a></li>
	              
	            </ul>
	            <ul class="nav navbar-nav navbar-right hidden-xs">
			        <li><button type="button" class="btn btn-dark" onclick="location.href = '<?php echo __WEB_ROOT?>/basket/view';" id="home-navbar-cart-button"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span> <span class="badge itemsInCart"></span></button></li>
			     </ul>
	          </div>
	        </div>
</header>