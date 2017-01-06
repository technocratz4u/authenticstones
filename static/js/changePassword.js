$(document).ready(function() {
	
	if($("#msgStatus").val() == 'SUCCESS'){
		$("#msgId").html("Your password is changed successfully.Please Login with new password.");
		$("#msgId").addClass("alert-success")
		$("#msgId").show();
	}else if($("#msgStatus").val() == 'ERROR'){
		$("#msgId").html("There is an error while chnaging your password.Please contact customer care.");
		$("#msgId").addClass("alert-danger");
		$("#msgId").show();
	}else if($("#msgStatus").val() == 'INCORRECT PASSWORD'){
		$("#msgId").html("The current password doesn't matched with enter password.Please try again with correct credentials.");
		$("#msgId").addClass("alert-danger");
		$("#msgId").show();
	}else{
		$("#msgId").hide();
	}
	
	
	$("#changePasswordbtn").click(function(e){
		e.preventDefault();
			if($('#oldpassword').val().length==0){
				$("#msgId").html("Please enter Current Password");
				$("#msgId").addClass("alert-danger");
				$("#msgId").show();
			}else if($('#newPassword').val().length==0){
				$("#msgId").html("Please enter New Password");
				$("#msgId").addClass("alert-danger");
				$("#msgId").show();
			}else if($('#confirmPassword').val().length==0){
				$("#msgId").html("Please Retype New Password");
				$("#msgId").addClass("alert-danger");
				$("#msgId").show();
			}else if($('#confirmPassword').val() != $('#newPassword').val()){
				$("#msgId").html("Password doesn't match the confirm password");
				$("#msgId").addClass("alert-danger");
				$("#msgId").show();
			}else{
				$("#msgId").hide();
				$("#userPasswordForm").submit();
			}		
		
	});

});
