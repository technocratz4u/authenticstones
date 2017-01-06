$(document).ready(function() {
	if($("#isUserLoggedIn").val()=="Y"){
		$(".checkoutBtn").bind("click", configureSyncNCheckoutLink);
	}else{
		// If the user is not logged in, configure the checkout link to open the login modal
		$(".checkoutBtn").attr("href", "#signinupModal").attr("data-toggle", "modal");
	}
});
