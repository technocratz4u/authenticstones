$(document).ready(function() {
	$('#home-navbar').affix({
		offset : {
			top : 140
		}
	});

	// add bottom padding to header when navbar element is affixed to avoid flickering
	// since the home-navbar element is positioned as fixed, an equivalent bottom-padding is to provided to fill in that space
	// padding added should be equal to the height of the home-navbar element
	$("#home-navbar").on("affix.bs.affix", function() {
	  $("#header").addClass("bottom-padded");
	});

	// remove padding to main content when navbar element is unaffixed to avoid flickering
	$("#home-navbar").on("affix-top.bs.affix", function() {
	  $("#header").removeClass("bottom-padded");
	});
	
	//$( "#search-control" ).select2( { placeholder: "Search...", theme: "bootstrap" } );
	
	$("#top-search-button").popover({
	    html: true, 
		content: function() {
          return $('#popover-content').html();
        }
	});
	
	/**
	 * If the modal is opened from loginLink show the Login tab or else
	 * If the modal is opened from registerLink show the Register tab
	 */
	$('#signinupModal').on('show.bs.modal', function (event) {
	  var triggerElem = $(event.relatedTarget) // Button that triggered the modal
	  //alert("IN signinupModal show.bs.modal - "+triggerElem.hasClass("checkoutBtn"));
	  if(triggerElem.attr("id")=="loginLink" || triggerElem.attr("id")=="footerLoginLink"){
		  $('#loginTab').tab('show');
		  $("#checkoutLoginTrigger").val("N");
		  // show the close button on top right if not triggered by checkout
		  $('#signinupModal .modal-header .close').removeClass("hidden");
	  }else if(triggerElem.attr("id")=="registerLink" || triggerElem.attr("id")=="footerRegisterLink"){
		  $('#registerTab').tab('show');
		  $("#checkoutLoginTrigger").val("N");
		  // show the close button on top right if not triggered by checkout
		  $('#signinupModal .modal-header .close').removeClass("hidden");
	  }else if(triggerElem.hasClass("checkoutBtn")){
		  // If opened on click of Checkout Button, hide normal login button and show checkout login button
		  $('#loginTab').tab('show');
		  $("#checkoutLoginTrigger").val("Y");
		  // hide the close button on top right if not triggered by checkout
		  $('#signinupModal .modal-header .close').addClass("hidden");
	  }
	});
	
	/*$('#signinupModal').on('hide.bs.modal', function (event) {
		if($("#checkoutLoginTrigger").val()=="Y"){
			*//**
			 	If the modal is fired from Checkout Trigger. On close of modal, Disable the Trigger Flag
				This is done so that if the user cancels login from Checkout Trigger and then clicks on login link to login,
				he should not be taken to the checkout page, since he did not click the Checkout button.
			 **//*
			$("#checkoutLoginTrigger").val("N");
		}
	});*/
	
	$("#signinupModal .nav-tabs > li > a").on('show.bs.tab', function (event) {
		var triggeredTab = $(event.target) // Tab that is triggered
		//alert("IN tab show.bs.modal - "+triggeredTab.attr("id"));
		if(triggeredTab.attr("id")=="loginTab"){
			$("#signinupModalLabel").html("Have an Account?");
		}else if(triggeredTab.attr("id")=="registerTab"){
			$("#signinupModalLabel").html("Create an Account");
		}
	});
	
	$("#login-button").click(function() {
		$("#loginFormContainer").hide();
		$("#loginFormThrobber").show();
		
		processLogin();
		
		return false;
	});
	
	$("#checkout-login-button").click(function() {
		$("#loginFormContainer").hide();
		$("#loginFormThrobber").show();
		
		processLogin();
		
		return false;
	});
	
	$("#register-button").click(function() {
		$("#registrationFormContainer").hide();
		$("#registrationFormThrobber").show();
		
		processRegistration();
		
		return false;
	});
	
	$("#logoutLink").click(function() {
		// Sync Cart Data
		syncCart("save");
		clearCart();
		$("#logoutForm").submit();
		return false;
	});
	
	$("#footer-line-link").click(function(e) {
		var textHref = "http://line.me/R/msg/text/?";
		textHref = textHref +"url: "+$("#pageUrl").val();
		textHref =textHref +"title: "+ $(document).find("title").text();
		$(this).attr("href",encodeURI(textHref));
		//return false;
	});
	

	
});

/*function clickLineIt(pageUrl){
	alert(pageUrl);
	var textHref = "http://line.me/R/msg/text/?";
	textHref =textHref + $(document).find("title").text();
	textHref =textHref + pageUrl;
	alert(textHref);
	$("#footer-line-link").attr("href",textHref);
	
}*/


function processLogin(){
	if($('#login-username').val().length==0){
		$("#login_alert_container").html("Please enter Email");
		$("#login_alert_container").show();
		$("#loginFormThrobber").hide();
		$("#loginFormContainer").show();
	}else if($('#login-password').val().length==0){
		$("#login_alert_container").html("Please enter Password");
		$("#login_alert_container").show();
		$("#loginFormThrobber").hide();
		$("#loginFormContainer").show();
	}else{
		var targetUrl = $("#cntxtPathUrl").val()+"/authentication/login";
		//alert("targetUrl ::"+targetUrl);
		$.ajax({
			//processData : false,
			//scriptCharset : "utf-8",
			//contentType : "application/json;charset=utf-8",
			dataType : 'json',
			async : true,
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
			},
			type : "POST",
			url : targetUrl,
			data : {
				login_username : $('#login-username').val(),
				login_password : $('#login-password').val()
			},
			success : function(data, status, xhr) {
				//alert(data);
				//alert("loginstatus ::"+data.loginstatus);
				if(data["STATUS"]=="SUCCESS"){
					
					// Sync Cart Data
					syncCart("saveOrUpdate");
					postLoginHandler(data);

				}else if(data["STATUS"]=="INVALID_EMAIL"){
					$("#login_alert_container").html("Invalid Email Id");
					$("#login_alert_container").show();
				}else if(data["STATUS"]=="INVALID_EMAIL_PASSWORD"){
					$("#login_alert_container").html("Invalid Email Id/Password");
					$("#login_alert_container").show();
				}else if(data["STATUS"]=="ERROR"){
					$("#login_alert_container").html("Unknown Error occured");
					$("#login_alert_container").show();
				}
				
				$("#loginFormThrobber").hide();
				$("#loginFormContainer").show();
				
				
			},
			error: function(xhr, textStatus, errorThrown){
				//alert("error occured.....");
				/*alert(xhr.status);
				alert(textStatus);
		        alert(errorThrown);
		        alert(xhr.statusText);
		        alert(xhr.responseText);*/
		    }

		});	
	}
}

function processRegistration(){
	if($('#register-name').val().length==0){
		$("#register_alert_container").html("Please enter Name");
		$("#register_alert_container").show();
		$("#registrationFormThrobber").hide();
		$("#registrationFormContainer").show();
	}else if($('#register-password').val().length==0){
		$("#register_alert_container").html("Please enter Password");
		$("#register_alert_container").show();
		$("#registrationFormThrobber").hide();
		$("#registrationFormContainer").show();
	}else if($('#register-confirm-password').val().length==0){
		$("#register_alert_container").html("Please confirm Password");
		$("#register_alert_container").show();
		$("#registrationFormThrobber").hide();
		$("#registrationFormContainer").show();
	}else if($('#register-email').val().length==0){
		$("#register_alert_container").html("Please enter Email Id");
		$("#register_alert_container").show();
		$("#registrationFormThrobber").hide();
		$("#registrationFormContainer").show();
	}else if($('#register-password').val()!=$('#register-confirm-password').val()){
		$("#register_alert_container").html("Password and Confirm Password do not match");
		$("#register_alert_container").show();
		$("#registrationFormThrobber").hide();
		$("#registrationFormContainer").show();
	}else{
		var targetUrl = $("#cntxtPathUrl").val()+"/authentication/register";
		//alert("targetUrl ::"+targetUrl);
		$.ajax({
			//processData : false,
			//scriptCharset : "utf-8",
			//contentType : "application/json;charset=utf-8",
			dataType : 'json',
			async : true,
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
			},
			type : "POST",
			url : targetUrl,
			data : {
				register_email : $('#register-email').val(),
				register_password : $('#register-password').val(),
				register_confirm_password : $('#register-confirm-password').val(),
				register_name : $('#register-name').val()
			},
			success : function(data, status, xhr) {
				//alert(data);
				//alert("loginstatus ::"+data.loginstatus);
				if(data["STATUS"]=="SUCCESS"){
					
					// Sync Cart Data
					syncCart("save");
					postLoginHandler(data);

				}else if(data["STATUS"]=="INVALID_EMAIL"){
					$("#register_alert_container").html("Invalid Email Id");
					$("#register_alert_container").show();
				}else if(data["STATUS"]=="PASSWORD_MISMATCH"){
					$("#register_alert_container").html("Password and Confirm Password do not match");
					$("#register_alert_container").show();
				}else if(data["STATUS"]=="DUPLICATE"){
					$("#register_alert_container").html("Email Id already registerd");
					$("#register_alert_container").show();
				}else if(data["STATUS"]=="ERROR"){
					$("#register_alert_container").html("Unknown Error occured");
					$("#register_alert_container").show();
				}
				
				$("#registrationFormThrobber").hide();
				$("#registrationFormContainer").show();
				
				
			},
			error: function(xhr, textStatus, errorThrown){
				//alert("error occured.....");
				/*alert(xhr.status);
				alert(textStatus);
		        alert(errorThrown);
		        alert(xhr.statusText);
		        alert(xhr.responseText);*/
		    }

		});	
	}
	
}

function postLoginHandler(data){
	$("#signinupModal").modal("hide");
	$("#lg_rgstr_lnk_cntnr").hide();
	$("#user_settings_menu").html("Hi "+data["FULL_NAME"]+ " <span class=\"caret\"></span>");
	$("#isUserLoggedIn").val("Y");
	$("#lgd_in_nm_cntnr").show();
	if($("#checkoutLoginTrigger").val()=="Y"){
		// If this is triggered from check out button, Redirect to Checkout Page
		$("#checkoutRedirectForm").submit();
	}else if($(".checkoutBtn").length>0){
		// If this is triggered from Login/Register link in Basket page, configure the checkout link to redirect to Checkout Page
		$(".checkoutBtn").removeAttr("data-toggle").attr("href", $("#cntxtPathUrl").val()+"/checkout");
	}
}


function configureSyncNCheckoutLink(){
	$("#cartSectionContainer").hide();
	$("#cartSectionThrobber").show();
	// Sync Cart Data
	syncCart("saveOrUpdate");
	// Redirect to Checkout Page
	$("#checkoutRedirectForm").submit();
}

function toNumber(value) {
	value = value * 1;
	return isNaN(value) ? 0 : value;
}

function toCurrency(value) {
	value = value * 1;
	return isNaN(value) ? 0 : (value.toFixed(2)).toString().replace(
			/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
}