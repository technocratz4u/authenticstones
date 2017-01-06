
<?php
	$itemsInCart = $model;
	if(sizeof($itemsInCart["cart_items"])>0){
?>
	<form action="<?php echo __PAYPAL_FORM_SUBMIT_URL ?>" method="post" id="_pp_form_" >
		<input type="hidden" name="cmd" value="_cart" />
		<input type="hidden" name="upload" value="1" />
		<input type="hidden" name="business" value="<?php echo __PAYPAL_SELLER_ACCOUNT ?>" />
		<input type="hidden" name="currency_code" value="USD" />
		
		
		<input type="hidden" name="custom" value="<?php echo $itemsInCart["custom"] ?>" />
		<input type="hidden" name="return" value="<?php echo __PAYPAL_RETURN_URL ?>" />
		<input type="hidden" name="cancel_return" value="<?php echo __PAYPAL_CANCEL_URL ?>" />
		<input type="hidden" name="notify_url" value="<?php echo __PAYPAL_IPN_URL ?>" />
	<?php
		foreach ($itemsInCart["cart_items"] as $itemInCartIndex => $itemInCartElem) {
	?>
		    <input type="hidden" name="item_name_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["item_name"]." - ".$itemInCartElem["item_code"] ?>" />
			<input type="hidden" name="item_number_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["item_id"] ?>" />
			<input type="hidden" name="amount_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["item_price"] ?>" />
			<input type="hidden" name="quantity_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["quantity"] ?>" />
			
			<input type="hidden" name="tax_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["tax"] ?>" />
			<input type="hidden" name="shipping_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["shipping"] ?>" />
			<input type="hidden" name="handling_<?php echo $itemInCartIndex+1 ?>" value="<?php echo $itemInCartElem["handling"] ?>" />
	<?php		
		}
	?>
		<!-- <input type="image" src="http://www.paypal.com/en_US/i/btn/x-click-but01.gif" name="submit" 
				alt="Make payments with PayPal - it's fast, free and secure!"> -->
	</form>               	
<?php
	}
?>
