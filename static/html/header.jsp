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
            		class="btn btn-default btn-xs top-search-button" href="#" id="top-search-button"><span class="glyphicon glyphicon-search"></span></a>
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
            	<ul class="menu">
                    <li>
                    	<a id="loginLink" href="#signinupModal" data-toggle="modal">Login</a>
                    </li>
                    <li class="piped">
                    	<a id="registerLink" href="#signinupModal" data-toggle="modal">Register</a>
                    </li>
                </ul>
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
							<div class="col-lg-12">
								<form id="login-form" action="" method="post" role="form" >
									<div class="form-group">
										<input name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="" type="text">
									</div>
									<div class="form-group">
										<input name="password" id="password" tabindex="2" class="form-control" placeholder="Password" type="password">
									</div>
									<div class="text-center">
										<input tabindex="3" class="" name="remember" id="remember" type="checkbox">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<button id="login-button" tabindex="4" class="btn btn-dark btn-block">Log In</button>
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
							<div class="col-lg-12">
								<form id="register-form" action="" method="post" role="form" >
									<div class="form-group">
										<input name="register-name" id="register-name" tabindex="1" class="form-control" placeholder="Name" value="" type="text">
									</div>
									<div class="form-group">
										<input name="register-email" id="register-email" tabindex="2" class="form-control" placeholder="Email" type="text">
									</div>
									<div class="form-group">
										<input name="register-password" id="register-password" tabindex="3" class="form-control" placeholder="Password" type="password">
									</div>
									<div class="form-group">
										<input name="register-confirm-password" id="register-confirm-password" tabindex="4" class="form-control" placeholder="Confirm Password" type="password">
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
	            
	            <button type="button" onclick="location.href = '<%=request.getContextPath()%>/static/html/basket.jsp';" class="navbar-toggle btn btn-dark" id="home-navbar-cart-button-collapsed" data-toggle="collapse" data-target="#links"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span> <span class="badge">4</span></button>
	            <!-- <a class="visible-xs-block navbar-brand" href="#">Authentic Stones Co., Ltd.</a> -->
	          </div>
	          
	          <div id="navbar-collapse-grid" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
	              <!-- Grid 12 Menu -->
	              	<li class="first active"><a href="#">Home</a></li>
		            <li><a href="<%=request.getContextPath()%>/static/html/about.jsp">About Us</a></li>
		            <li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Product<b class="caret" style="margin-left:10px;"></b></a>
		                <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h5>Stones</h5>
                                            <ul>
                                                <li><a href="<%=request.getContextPath()%>/static/html/category.jsp">Ruby</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Sapphire</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Emerald</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Beads</h5>
                                            <ul>
                                                <li><a href="javascript:void(0);">Ruby</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Sapphire</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Emerald</a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li><a href="javascript:void(0);">Tsavorite</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Aquamarine</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Tourmaline</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <h5>Carvings</h5>
                                            <ul>
                                                <li><a href="javascript:void(0);">Ruby</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Sapphire</a>
                                                </li>
                                                <li><a href="javascript:void(0);">Emerald</a>
                                                </li>
                                                <li><a href="category.html">Tourmaline</a>
                                                </li>
                                                <li><a href="category.html">Tsavorite</a>
                                                </li>
                                                <li><a href="category.html">Rose Quartz</a>
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
	              	<li><a href="<%=request.getContextPath()%>/static/html/contactus.jsp">Contact Us</a></li>
	              
	            </ul>
	            <ul class="nav navbar-nav navbar-right hidden-xs">
			        <li><button type="button" class="btn btn-dark" onclick="location.href = '<%=request.getContextPath()%>/static/html/basket.jsp';" id="home-navbar-cart-button"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"> cart</span> <span class="badge">4</span></button></li>
			     </ul>
	          </div>
	        </div>
</header>