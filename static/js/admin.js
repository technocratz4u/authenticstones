$(document).ready(function() {
	
	if($("#msgStatus").val() == 'Invalid Login'){
		$("#msgId").html("Invalid Credentials");
		$("#msgId").show();
	}else if($("#msgStatus").val() == 'ERROR'){
		$("#msgId").html("There is an error while saving your changes.Please contact customer care.");
		$("#msgId").show();
	}else{
		$("#msgId").hide();
	}
	
	
	$("#login-admin-button").click(function(e){
		e.preventDefault();
		processLogin();
		
		return false;
	});
		
});


function processLogin(){
	if($('#login-username').val().length==0){
		$("#msgId").html("Please enter Username");
		$("#msgId").show();
	}else if($('#login-password').val().length==0){
		$("#msgId").html("Please enter Password");
		$("#msgId").show();
	}else{
		$("#admin-login-form").submit();
	}
}
