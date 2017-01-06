<?php

include __SITE_PATH . '/service/utils/SqlInjectionFilter.php' ;
include __SITE_PATH . '/service/utils/AlbumUtil.php';

Class PaypalController Extends BaseController {

	public function index() {
		$this->registry->template->model = array();
		$this->registry->template->show('paypaltester');
	}
	
	public function markselectedaddress(){
		$retArr = array();
		try{
			if (isset($_POST["selected_address_id"])) {
				$_SESSION[__SESSION_KEY_USER_DATA]["ORDER_USER_ADDRESS_ID"] = SqlInjectionFilter::filter($_POST["selected_address_id"]);
				$retArr["STATUS"] = "SUCCESS";
					
			}else{
				$retArr["STATUS"] = "ERROR";
			}
	
		}catch (Exception $e) {
			$retArr["STATUS"] = "ERROR";
			trigger_error("Error occured during markselectedaddress in PaypalController", E_USER_ERROR);
		}
		// JSON encode and send back to the server
		echo json_encode($retArr);
	}
	
	public function generateppform(){
		$log = "\n_________________________________________________________________________________\n";
		$log .= "SESSION_ID:".session_id().", ORDER_USER_ADDRESS_ID:".$_SESSION[__SESSION_KEY_USER_DATA]["ORDER_USER_ADDRESS_ID"]."\n";
		$totalItemPrice = 0.0;
		$totalAmount = 0.0;
		$totalTax = 0.0;
		$totalShippingCost = 0.0;
		$itemsInCart = array();
		
		$query = " call ".__APP_SCHEMA.".proc_checkout_item_details(:user_id) ";
		$queryArgs = array(":user_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"]);
		$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
		
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$itemCartDetail = array();

				$itemCartDetail["item_id"] = $r["item_id"];
				$itemCartDetail["item_code"] = $r["item_code"];
				$itemCartDetail["item_name"] = $r["item_name"];
				$itemCartDetail["price_carat"] = $r["price_carat"];
				$itemCartDetail["carat_weight"] = $r["carat_weight"];
				$itemCartDetail["item_price"] = round($r["item_price"], 2);
				$itemCartDetail["user_cart_id"] = $r["user_cart_id"];
				$itemCartDetail["quantity"] = $r["quantity"];
				$itemCartDetail["item_total_price"] = round($itemCartDetail["item_price"] * $itemCartDetail["quantity"], 2);
				
				$itemCartDetail["tax"] = 0;
				$itemCartDetail["shipping"] = 0;
				$itemCartDetail["handling"] = 0;
				$log .= "item_id:".$itemCartDetail["item_id"].", item_price:".$itemCartDetail["item_price"].", quantity:".$itemCartDetail["quantity"].", item_total_price:".$itemCartDetail["item_total_price"]."\n";
				$totalItemPrice+=$itemCartDetail["item_total_price"];
				$totalTax+=$itemCartDetail["tax"];
				$totalShippingCost+=$itemCartDetail["shipping"]+$itemCartDetail["handling"];
				$totalAmount+=$itemCartDetail["item_total_price"]+$itemCartDetail["tax"]+$itemCartDetail["shipping"]+$itemCartDetail["handling"];
				$itemsInCart["cart_items"][] = $itemCartDetail;
			}
		}
		$itemsInCart["payment_gross"] = $totalAmount;
		$itemsInCart["item_gross"] = $totalItemPrice;
		$itemsInCart["tax_gross"] = $totalTax;
		$itemsInCart["shipping_gross"] = $totalShippingCost;
		$log .= "payment_gross:".$itemsInCart["payment_gross"].", item_gross:".$itemsInCart["item_gross"].", tax_gross:".$itemsInCart["tax_gross"].", shipping_gross:".$itemsInCart["shipping_gross"]."\n";
		$itemsInCart["custom"]=session_id()."~~~".$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"]."~~~".$totalAmount;
		$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]=$itemsInCart;
		
		file_put_contents('PAYPAL_LOGINFO_DEBUG.txt', $log, FILE_APPEND);
		
		$this->registry->template->model = $itemsInCart;
		$this->registry->template->show('paypalformgenerator');
	}
	
	public function handlesuccess() {
		$retArr = array();
		try{
			$log = "\n\n_________________________________________________________________________________"."SESSION_ID:".session_id();
			$log .= "in paypalreturn here 1...\n";
			//echo("in paypalreturn here 1...\n");
			$customField = "";
			// The custom hidden field (user id) sent along with the button is retrieved here.
			if($_GET['cm']) {
				$customField=$_GET['cm'];
			}
			$tx="";
			// The unique transaction id.
			if($_GET['tx']) {
				$tx= $_GET['tx'];
			}
			$identity = __PAYPAL_SELLER_IDENTITY;
			$log .= "in paypalreturn here 2...\n";
			//echo("in paypalreturn here 2...\n");
		
			// Init
			$ch = curl_init();
			// Set request options
			curl_setopt_array($ch, array ( CURLOPT_URL => __PAYPAL_FORM_SUBMIT_URL,
					CURLOPT_POST => TRUE,
					CURLOPT_POSTFIELDS => http_build_query(array
							(
									'cmd' => '_notify-synch',
									'tx' => $tx,
									'at' => $identity,
							)),
					CURLOPT_RETURNTRANSFER => TRUE,
					CURLOPT_HEADER => FALSE,
					// CURLOPT_SSL_VERIFYPEER => TRUE,
					// CURLOPT_CAINFO => 'cacert.pem',
			));
		
			$log .= "in paypalreturn here 3...\n";
			//echo("in paypalreturn here 3...\n");
			// Execute request and get response and status code
			$response = urldecode(trim(curl_exec($ch)));
			$status   = curl_getinfo($ch, CURLINFO_HTTP_CODE);
			// Close connection
			curl_close($ch);
		
			$log .= "in paypalreturn here 4...\n";
		
			if($status == 200){
		
				$parameter_value_array = explode("\n", $response);
				$value_array =array();
				foreach ($parameter_value_array as $key=>$value) {
					$key_values = explode("=", $value);
					$value_array[$key_values[0]] = (sizeof($key_values)==2) ? $key_values[1] : $key_values[0];
				}
				
				$dataJson = json_encode($value_array);
				$log .= $dataJson;
				
				$log .= "in paypalreturn here 4_1... payment_gross:".$value_array["payment_gross"];
				$log .= "in paypalreturn here 4_1... PAYPAL_INFO-payment_gross:".$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["payment_gross"];
				$retArr = $this->checkResponseAndPlaceOrder($value_array);
		
				$log .= "\n\nin paypalreturn here 5...\n";
				//echo("in paypalreturn here 5...\n");
		
			}else{
				$retArr = $this->handlePaypalError($value_array);
				$log .= "\n\nin paypalreturn here 6...Error Occured while fetching Transaction Status...\n";
				//echo("\n\nError Occured while fetching Transaction Status...\n");
			}
		
		}catch (Exception $exception) {
			$log .= "\n\n\n<TraceAsString>".$exception->getTraceAsString()."</TraceAsString><Message>".$exception->getMessage()."</message>\n\n";
			//echo("\n\n\n<TraceAsString>".$exception->getTraceAsString()."</TraceAsString><Message>".$exception->getMessage()."</message>\n\n");
			trigger_error ( "Error occured during handlesuccess of PaypalController", E_USER_ERROR );
		}
		
		file_put_contents('PAYPAL_LOGINFO_SUCCESS.txt', $log, FILE_APPEND);
		
		unset($_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]);
		unset($_SESSION[__SESSION_KEY_USER_DATA]["ORDER_USER_ADDRESS_ID"]);
		
		if($retArr["STATUS"]=="SUCCESS" && $retArr["ORDER_STATUS"]==__ORDER_STATUS_CREATED){
			$this->registry->template->model = $retArr["ORDER_DETAILS"];
			$this->registry->template->show('paypalordersuccess'); 
		}else if($retArr["STATUS"]=="SUCCESS" && $retArr["ORDER_STATUS"]==__ORDER_STATUS_PENDING){
			$this->registry->template->model = $retArr["ORDER_DETAILS"];
			$this->registry->template->show('paypalordersuccess');
		}else{
			$this->registry->template->model = array();
			$this->registry->template->show('paypalerror');
		}
		
	}
	
	private function checkResponseAndPlaceOrder($value_array) {
		$retArr = array();
		try{
			/**
			 * 
			 * Check if the custom value returned from paypal matches the one sent and
			 * the gross payment made matches the one claculated from the database
			 * 
			 **/
			if(isset($value_array["custom"]) &&
					$value_array["custom"] == $_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["custom"] &&
					isset($value_array["payment_gross"]) &&
					$value_array["payment_gross"] == $_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["payment_gross"]){
				
				if(isset($value_array["SUCCESS"]) &&
						$value_array["payment_status"]=="Completed" &&
						$value_array["payment_type"]=="instant"){
					
					$retArr = $this->placeOrder($value_array, __ORDER_STATUS_CREATED);
					$retArr["ORDER_STATUS"] = __ORDER_STATUS_CREATED;
				}else if(isset($value_array["SUCCESS"]) &&
						$value_array["payment_status"]=="Pending" &&
						$value_array["payment_type"]=="echeck"){
					
					$retArr = $this->placeOrder($value_array, __ORDER_STATUS_PENDING);
					$retArr["ORDER_STATUS"] = __ORDER_STATUS_PENDING;
				}else{
					$retArr = $this->handlePaypalError($value_array);
				}
			}
			
		}catch(Exception $exception){
			trigger_error ( "Error occured in checkResponseAndPlaceOrder of PaypalController", E_USER_ERROR );
			throw $exception;
		}
		
		return $retArr;
	}
	
	private function placeOrder($value_array, $orderStatus) {
		$retArr = array();
		try{
			
			$query = " call ".__APP_SCHEMA.".proc_place_order(:user_id, :txn_id, :order_status, :total_amount, :total_item_price, :total_tax, :total_shipping, :user_address_id, :paypal_response) ";
			$queryArgs = array(":user_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"],
					":txn_id"=>$value_array["txn_id"],
					":order_status"=>$orderStatus,
					":total_amount"=>$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["payment_gross"],
					":total_item_price"=>$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["item_gross"],
					":total_tax"=>$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["tax_gross"],
					":total_shipping"=>$_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]["shipping_gross"],
					":user_address_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["ORDER_USER_ADDRESS_ID"],
					":paypal_response"=>json_encode($value_array)
			);
			$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
			
			$results = $stmt->fetchAll();
			if ($results) {
				foreach ($results as $r) {
					$retArr["STATUS"] = $r["proc_status"];
				}
			}
				
			$orderDetails = array();
			if($retArr["STATUS"]=="SUCCESS"){
				$stmt->nextRowset();
				$results = $stmt->fetchAll();
				if ($results) {
					foreach ($results as $r) {
						if(!isset($orderDetails["order_id"])){
							$orderDetails["order_id"] = $r["order_id"];
							$orderDetails["full_name"] = $r["full_name"];
							$orderDetails["address"] = $r["address"];
							$orderDetails["contact_number"] = $r["contact_number"];
							$orderDetails["city"] = $r["city"];
							$orderDetails["state"] = $r["state"];
							$orderDetails["pin"] = $r["pin"];
							$orderDetails["country"] = $r["country"];
							$orderDetails["status"] = $r["status"];
							$orderDetails["vat"] = $r["vat"];
							$orderDetails["shipping_cost"] = $r["shipping_cost"];
							$orderDetails["total_item_price"] = $r["total_item_price"];
							$orderDetails["total_amount"] = number_format($r["total_amount"], 2);
							$orderDetails["order_time"] = $r["order_time"];
							$orderDetails["invoice_id"] = $r["invoice_id"];
							$orderDetails["currency"] = $r["currency"];
							$orderDetails["item_details"] = array();
						}
						
						$orderItemDetails =array();
						$orderItemDetails["order_detail_id"] = $r["order_detail_id"];
						$orderItemDetails["item_id"] = $r["item_id"];
						$orderItemDetails["item_code"] = $r["item_code"];
						$orderItemDetails["currency"] = $r["currency"];
						$orderItemDetails["item_name"] = $r["item_name"];
						$orderItemDetails["quantity"] = $r["quantity"];
						$orderItemDetails["item_price"] = number_format($r["item_price"], 2);
						$orderItemDetails ["images"] = AlbumUtil::getImagesForItem ( $r ["item_id"] );
						
						$orderDetails["item_details"][] = $orderItemDetails;
					}
				}
			}
			
			$retArr["ORDER_DETAILS"] = $orderDetails;
				
		}catch(Exception $exception){
			trigger_error ( "Error occured in placeOrder of PaypalController", E_USER_ERROR );
			throw  $exception;
		}
		
		return $retArr;
	}
	
	private function handlePaypalError($value_array) {
		$retArr = array();
		try{
			
			$query = " call ".__APP_SCHEMA.".proc_paypal_error_response(:user_id, :paypal_response) ";
			$queryArgs = array(":user_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"],
					":paypal_response"=>json_encode($value_array)
			);
			$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
				
			$results = $stmt->fetchAll();
			if ($results) {
				foreach ($results as $r) {
					$retArr["STATUS"] = $r["proc_status"];
				}
			}
	
			if($retArr["STATUS"]=="SUCCESS"){
				$retArr["STATUS"] = "PAYPAL_ERROR_RESPONSE";
			}
	
		}catch(Exception $exception){
			trigger_error ( "Error occured in handlePaypalError of PaypalController", E_USER_ERROR );
			throw  $exception;
		}
		
		return $retArr;
	}
	
	public function handlecancel() {
			
		try{
			$log = "\n\n_________________________________________________________________________________";
			$log .= "in paypalcancelreturn here 1...\n";
			//echo("in paypalcancelreturn here 1...\n");
			
			$customField = "";
			// The custom hidden field (user id) sent along with the button is retrieved here.
			if($_GET['cm']) {
				$customField=$_GET['cm'];
			}
			
			$tx="";
			// The unique transaction id.
			if($_GET['tx']) {
				$tx= $_GET['tx'];
			}
			
			$itemNumber="";
			if($_GET['item_number']) {
				$itemNumber= $_GET['item_number'];
			}
			
			$log .= "\n\nin paypal cancelled return for".$customField."::".$tx."::".$itemNumber."\n";
			$log .= "\n\nin paypalcancelreturn here 2...\n";
			//echo("in paypalcancelreturn here 2...\n");
		
		}catch (Exception $exception) {
			$log .= "\n\n\n<TraceAsString>".$exception->getTraceAsString()."</TraceAsString><Message>".$exception->getMessage()."</message>\n\n";
		}
	
		file_put_contents('PAYPAL_LOGINFO_CANCEL.txt', $log, FILE_APPEND);
	
		unset($_SESSION[__SESSION_KEY_USER_DATA]["PAYPAL_INFO"]);
		unset($_SESSION[__SESSION_KEY_USER_DATA]["ORDER_USER_ADDRESS_ID"]);
		
		$this->registry->template->model = array();
		$this->registry->template->show('basket');
	}
	
	
	public function handleipn() {
					
		echo("in paypal handleipn here 0...\n");
		
		try{
			$ipn_data = $_POST; 
			$charSet = 'utf-8';
		
			$log = "";
			$log .= "in here 1...\n";
			echo("in paypal handleipn here 1...\n");
			// Processing the values returned from paypal 
			if (!(array_key_exists('charset', $ipn_data) && ($charSet == $ipn_data['charset']))) {  
				// Else you need to convert the data  
				foreach ($ipn_data as $key => $value) {
			   		$ipn_data [$key] = mb_convert_encoding($value, 'utf-8', $charSet);
				}
			}
		
			$log .= "in here 2...\n";
			echo("in paypal handleipn here 2...\n");
			// Looping through the IPN Post Data and creating a final array of transaction details
			foreach ($ipn_data as $key => $value) {
			  $finalIPN[$key] = $value;
			}
		
			$log .= "in here 3...\n";
			echo("in paypal handleipn here 3...\n");
			// Saving the encode transaction details  to the table
			$dataJson = json_encode($finalIPN);
		
			$log .= $dataJson;
		
		
		}catch (Exception $exception) {
			$log .= "\n\n\n<TraceAsString>".$exception->getTraceAsString()."</TraceAsString><Message>".$exception->getMessage()."</message>\n\n";
		
		}
		
		file_put_contents('PAYPAL_LOGINFO_IPN.txt', $log, FILE_APPEND);
	
	}
	
	
}

?>
