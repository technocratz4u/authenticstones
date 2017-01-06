$(document).ready(function() {
	
	$(".addNewAddr").click(function(e){
		//e.preventDefault();
		$("#existingAddresses").hide();
		$("#addNewAddrRow").hide();
		$("#newAddress").show();
	});
	$(".useExiAddr").click(function(e){
		//e.preventDefault();
		$("#newAddress").hide();
		$("#existingAddresses").show();
		$("#addNewAddrRow").show();
	});
	
	$(".useNewAddr").click(function(e){
		//e.preventDefault();
		addNewAddress();
		
	});
	
	$(".nav-pills li").on("click", function(e) {
		  if ($(this).hasClass("disabled")) {
		    e.preventDefault();
		    return false;
		  }
		});
	
	if($("#isUserLoggedIn").val()!="Y"){
		// If the user is not logged in, configure the hidden checkout link to open the login modal
		$(".checkoutBtn").attr("href", "#signinupModal").attr("data-toggle", "modal");
		$(".checkoutBtn").click();
	}
	

	$(".userAddressRadio").on("click", function(e) {
		$(".addressBox").removeClass("selectAddress");
		if($(this).is(":checked")){
			$("#address_box_"+$(this).val()).addClass("selectAddress");
		}
	});
	
	$("#securedPayContainer .nav-pills > li > a").on('show.bs.tab', function (event) {
		var triggeredTab = $(event.target) // Tab that is triggered
		//alert("IN tab show.bs.tab - "+triggeredTab.attr("id"));
		if(triggeredTab.attr("id")=="address_tab"){
			$("#btnBackToOrder").hide();
			$("#btnMakePayment").hide();
			$("#btnBackToAddress").hide();
			$("#btnCntToPayment").hide();
			$("#btnBackToBasket").show();
			$("#btnCntToOrder").show();
		}else if(triggeredTab.attr("id")=="review_tab"){
			$("#btnBackToOrder").hide();
			$("#btnMakePayment").hide();
			$("#btnBackToBasket").hide();
			$("#btnCntToOrder").hide();
			$("#btnBackToAddress").show();
			$("#btnCntToPayment").show();
		}else if(triggeredTab.attr("id")=="payment_tab"){
			$("#btnBackToBasket").hide();
			$("#btnCntToOrder").hide();
			$("#btnBackToAddress").hide();
			$("#btnCntToPayment").hide();
			$("#btnBackToOrder").show();
			$("#btnMakePayment").show();
		}
		$('html, body').animate({scrollTop:210}, '600', 'swing');
	});
	
	$("#btnBackToAddress").click(function(e){
		$('#address_tab').tab('show');
	});
	
	$("#btnBackToOrder").click(function(e){
		$('#review_tab').tab('show');
		
	});
	
	$("#btnCntToOrder").click(function(e){
		if($(".userAddressRadio:checked").length==0){
			$("#address_alert_container").html("Please Select a Delivery Address");
			$("#address_alert_container").show();
			$('html, body').animate({scrollTop:210}, '600', 'swing');
		}else{
			markSelectedAddress();
		}
	});
	
	$("#btnCntToPayment").click(function(e){
		if (localStorage["myCart"] && localStorage["myCart"].length > 0) {
			$("#payment_li").removeClass("disabled");
			$('#payment_tab').tab('show');
		}else{
			$("#cart_alert_container").html("No Items in Cart.");
			$("#cart_alert_container").show();
			$('html, body').animate({scrollTop:210}, '600', 'swing');
		}
	});
	
	$("#btnMakePayment").click(function(e){
		$("#securedPayContainer").hide();
		$("#securedPayThrobber").show();
		generatePPForm();
	});
	
	loadCardDetails();
});

function markSelectedAddress(){
	
	$("#address_alert_container").hide();
	$("#addressContainer").hide();
	$("#addressThrobber").show();
	
	var targetUrl = $("#cntxtPathUrl").val()+"/paypal/markselectedaddress";
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
			selected_address_id : $(".userAddressRadio:checked").val()
		},
		success : function(data, status, xhr) {
			//alert(data);
			//alert("loginstatus ::"+data.loginstatus);
			$("#addressThrobber").hide();
			$("#addressContainer").show();
			
			if(data["STATUS"]=="SUCCESS"){
				$("#review_li").removeClass("disabled");
				$('#review_tab').tab('show');
			}else{
				$("#address_alert_container").html("Unexpected Error Occured. Please Contact System Admin through Contact Us link.");
				$("#address_alert_container").show();
			}
			
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


function generatePPForm(){
	$("#securedPayPPFormContainer").load($("#cntxtPathUrl").val()+"/paypal/generateppform", function() {
		$('#_pp_form_').submit();
	});
}


function addNewAddress(){
	if($('#newAddrFName').val().length==0){
		$("#address_alert_container").html("Please Enter First Name");
		$("#address_alert_container").show();
	}else if($('#newAddrAddress').val().length==0){
		$("#address_alert_container").html("Please Enter Address");
		$("#address_alert_container").show();
	}else if($('#newAddrCity').val().length==0){
		$("#address_alert_container").html("Please Enter City");
		$("#address_alert_container").show();
	}else if($('#newAddrState').val().length==0){
		$("#address_alert_container").html("Please Enter State");
		$("#address_alert_container").show();
	}else if($('#newAddrZip').val().length==0){
		$("#address_alert_container").html("Please Enter Zip");
		$("#address_alert_container").show();
	}else if($('#newAddrCountry').val().length==0){
		$("#address_alert_container").html("Please Enter Country");
		$("#address_alert_container").show();
	}else if($('#newAddrTelephone').val().length==0){
		$("#address_alert_container").html("Please Enter Telephone");
		$("#address_alert_container").show();
	}else{
		
		$("#address_alert_container").hide();
		$("#newAddress").hide();
		$("#newAddressThrobber").show();
		
		var targetUrl = $("#cntxtPathUrl").val()+"/checkout/addaddress";
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
				addr_fname : $('#newAddrFName').val(),
				addr_address : $('#newAddrAddress').val(),
				addr_city : $('#newAddrCity').val(),
				addr_state : $('#newAddrState').val(),
				addr_zip : $('#newAddrZip').val(),
				addr_country : $('#newAddrCountry').val(),
				addr_telephone : $('#newAddrTelephone').val()
			},
			success : function(data, status, xhr) {
				//alert(data);
				//alert("loginstatus ::"+data.loginstatus);
				$("#newAddressThrobber").hide();
				$("#newAddress").hide();
				$("#existingAddresses").show();
				$("#addNewAddrRow").show();
				
				if(data["STATUS"]=="SUCCESS"){
					if(data["USER_ADDRESS"]){
						//alert(JSON.stringify(data["USER_ADDRESS"]));
						
						var addressDivHTML = "";
						addressDivHTML += "<div class=\"col-sm-12 col-md-6\">";
						addressDivHTML += "<div class=\"page-box addressBox\" id=\"address_box_"+data["USER_ADDRESS"]["user_address_id"]+"\">";
						addressDivHTML += "<h4 class=\"nomargin\">"+data["USER_ADDRESS"]["full_name"]+"</h4>";
						addressDivHTML += "<p>";
						addressDivHTML += data["USER_ADDRESS"]["address"]+"<br>";
						addressDivHTML += data["USER_ADDRESS"]["city"]+"<br>";
						addressDivHTML += data["USER_ADDRESS"]["state"]+" "+data["USER_ADDRESS"]["pin"]+"<br>";
						addressDivHTML += data["USER_ADDRESS"]["country"]+"<br>";
						addressDivHTML += "<strong>Phone:</strong> "+data["USER_ADDRESS"]["contact_number"]+"<br>";
						addressDivHTML += "</p>";
						addressDivHTML += "<div class=\"page-box-footer nomargin text-center\" style=\"padding:5px; margin-top:20px;\">";
						addressDivHTML += "<input type=\"radio\" id=\"userAddressRadio_"+data["USER_ADDRESS"]["user_address_id"]+"\" class=\"userAddressRadio\" name=\"address\" value=\""+data["USER_ADDRESS"]["user_address_id"]+"\" />";
						addressDivHTML += "</div>";
						addressDivHTML += "</div>";
						addressDivHTML += "</div>";
						$("#existingAddresses").append(addressDivHTML);
						
						$("#existingAddresses").append("<div class=\"clearfix visible-xs-block visible-sm-block\"></div>");
						if($(".userAddressRadio").length%2==0){
							$("#existingAddresses").append("<div class=\"clearfix visible-md-block visible-lg-block\"></div>");
						}
						
						$("#userAddressRadio_"+data["USER_ADDRESS"]["user_address_id"]).on("click", function(e) {
							$(".addressBox").removeClass("selectAddress");
							if($(this).is(":checked")){
								$("#address_box_"+$(this).val()).addClass("selectAddress");
							}
						});
						
						$("#userAddressRadio_"+data["USER_ADDRESS"]["user_address_id"]).click();
						// the .click does not pass the :checked check so having to add the selectAddress
						$("#address_box_"+data["USER_ADDRESS"]["user_address_id"]).addClass("selectAddress");
					}

				}else if(data["STATUS"]=="MANDATORY_FIELDS_MISSING"){
					$("#address_alert_container").html("Mandatory Fields Missing.");
					$("#address_alert_container").show();
				}
				
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

function loadCardDetails(){
	var itemsInCart = {};
	var cartTableHTML = "";
	var orderTotal = 0;
	var currency = "";
	//alert(localStorage["myCart"].length);
	if (localStorage["myCart"] && localStorage["myCart"].length > 0) {
		itemsInCart = JSON.parse(localStorage["myCart"]);
		$.each(itemsInCart, function(itemId, itemDetail) {
			cartTableHTML += "<tr>";
			cartTableHTML += "<td style=\"width:86px;\">"+
								"<a href=\"" + $("#cntxtPathUrl").val() + "/product/view/"+ itemDetail.item_name + "/" + itemId+ "\"> "+
								"<img class=\"img-responsive cart-image-width\" src=\""+ itemDetail["images"]["thumb_url"]["front"] + "\" /></a>"+
							  "</td>";
			cartTableHTML += "<td>"+
								"<b><a href=\"" + $("#cntxtPathUrl").val() + "/product/view/" +
								itemDetail.item_name + "/" + itemId + "\">"+ itemDetail.item_name + " (" + itemDetail.item_code + ") </a></b>"+
								"<br>"+itemDetail.carat_weight + " ct. " + " - " + itemDetail.dimensions+
								"<br>" + itemDetail.origin_name + " " + itemDetail.shape+
							  "</td>";
			cartTableHTML += "<td>"+itemDetail.quantity+"</td>";
			cartTableHTML += "<td>"+ itemDetail.currency + " " + toCurrency(itemDetail.item_price) +"</td>";
			cartTableHTML += "<td class=\"totalItemPrice\">"+ 
								itemDetail.currency + " " + toCurrency(toNumber(itemDetail.quantity) * toNumber(itemDetail.item_price)) + 
							 "</td>";
			cartTableHTML += "</tr>";
			orderTotal += toNumber(itemDetail.quantity) * toNumber(itemDetail.item_price);
			currency = itemDetail.currency;
		});
		
	}
	
	if (cartTableHTML.length > 0) {
		$("#orderDetailsTbl > tbody").html(cartTableHTML);
	} else {
		$("#orderDetailsTbl > tbody").html("<tr><td colspan=\"5\"><p class=\"text-center text-muted\" style=\"font-weight:bold;\">No Items to display</p></td></tr>");
	}
	$("#ordSmOrdTotal").html(currency + " " + toCurrency(orderTotal));
	$("#ordSmHspHnd").html(currency + " " + toCurrency(0));
	$("#ordSmTax").html(currency + " " + toCurrency(0));
	$("#ordSmHspDsc").html(currency + " " + toCurrency(0));
	$("#ordSmTotal").html(currency + " " + toCurrency(orderTotal));
	
}