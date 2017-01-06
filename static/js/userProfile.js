$(document).ready(function() {
	
	if($("#msgStatus").val() == 'SUCCESS'){
		$("#msgId").html("Your Details are Saved Successfully");
		$("#msgId").addClass("alert-success")
		$("#msgId").show();
	}else if($("#msgStatus").val() == 'ERROR'){
		$("#msgId").html("There is an error while saving your changes.Please contact customer care.");
		$("#msgId").addClass("alert-danger")
		$("#msgId").show();
	}else{
		$("#msgId").hide();
	}
	
	$("#addNewAddress").click(function(e){
		e.preventDefault();
		$("#newAddressBlock").show();
		$("#newAddressBtn").hide();		
	});
	$("#cancelBtn").click(function(e){
		e.preventDefault();
		$( "input[name^='new']" ).val('');
		$("#save_alert_container").hide();
		$("#newAddressBlock").hide();
		$("#newAddressBtn").show();		
	});
	
	$("button[id^='address'").click(function(e){
		e.preventDefault();
	});
	
	$("#saveBtn").click(function(e){
		e.preventDefault();
		if($("#newAddressBlock").is(":visible")){
			
			if($('#newFullName').val().length==0){
				$("#save_alert_container").html("Please enter Name");
				$("#save_alert_container").show();
			}else if($('#newContactNumber').val().length==0){
				$("#save_alert_container").html("Please enter Contact Number");
				$("#save_alert_container").show();
			}else if($('#newAddrLine1').val().length==0){
				$("#save_alert_container").html("Please enter Address Line 1");
				$("#save_alert_container").show();
			}else if($('#newCity').val().length==0){
				$("#save_alert_container").html("Please enter City");
				$("#save_alert_container").show();
			}else if($('#newState').val().length==0){
				$("#save_alert_container").html("Please enter State");
				$("#save_alert_container").show();
			}else if($('#newPin').val().length==0){
				$("#save_alert_container").html("Please enter Pin");
				$("#save_alert_container").show();
			}else if($('#newCountry').val().length==0){
				$("#save_alert_container").html("Please enter Country");
				$("#save_alert_container").show();
			}else{
				$("#userForm").submit();
			}		
		}else{
			$("#userForm").submit();
		}
	});
	


});

function deleteAddress(addressIndex){
	$("#deleteAddressThrobber_"+addressIndex).show();
	$("#addressBlock_"+addressIndex).hide();
	var targetUrl = $("#cntxtPathUrl").val()+"/user/deleteUserAddress";

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
			user_address_id : addressIndex
		},
		success : function(data, status, xhr) {
			//alert("loginstatus ::"+data.loginstatus);
			if(data["STATUS"]=="SUCCESS"){
				
				$("#addressBlock_"+addressIndex).hide();
				$("#msgId").html("Address is successfully deleted.");
				$("#msgId").addClass("alert-success")
				$("#msgId").show();
				
			}else if(data["STATUS"]=="ERROR"){
				$("#addressBlock_"+addressIndex).show();
				$("#msgId").html("There is an error while deleting address.");
				$("#msgId").addClass("alert-danger")
				$("#msgId").show();
			}
			
			$("#deleteAddressThrobber_"+addressIndex).hide();
			
		},
		error: function(xhr, textStatus, errorThrown){
			alert("error occured.....");
			/*alert(xhr.status);
			alert(textStatus);
	        alert(errorThrown);
	        alert(xhr.statusText);
	        alert(xhr.responseText);*/
	    }

	});
}
