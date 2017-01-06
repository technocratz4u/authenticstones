<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="layout.css" type="text/css" />
<script src="<?php echo __WEB_ROOT?>/static/js/jquery-1.12.0.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//$('#_pp_form_').submit();
});


</script>
</head>
<body>

<div id="wrapper">
<h1>PAYPAL SANDBOX PAYMENT GATEWAY INTEGRATION TESTER</h1>

<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" id="_pp_form_">
	<input type="hidden" name="cmd" value="_cart">
	<input type="hidden" name="upload" value="1">
	<input type="hidden" name="business" value="technocratz4u.seller1@gmail.com">
	<input type="hidden" name="currency_code" value="US">
	
	<input type="hidden" name="item_name_1" value="beach ball">
	<input type="hidden" name="item_number_1" value="item_number_1">
	<input type="hidden" name="amount_1" value="1.5">
	<input type="hidden" name="quantity_1" value="1">
	
	<input type="hidden" name="item_name_2" value="towel">
	<input type="hidden" name="item_number_2" value="item_number_2">
	<input type="hidden" name="amount_2" value="1.0">
	<input type="hidden" name="quantity_2" value="3">

	<input type="hidden" name="custom" value="custom_0066~~~pay_002131~~~sell_001213">
	<input type="hidden" name="return" value="http://192.168.56.101/paypal/handlesuccess">
	<input type="hidden" name="cancel_return" value="http://192.168.56.101/paypal/hadlecancel" />
	<input type="hidden" name="notify_url" value="http://192.168.56.101/paypal/hadleipn" />

	<input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" 
		alt="Make payments with PayPal - it's fast, free and secure!">
</form>

<!-- <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="NDU53STWV63LL">
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form> -->
</div>



</body>
</html>