<?php

include __SITE_PATH . '/service/utils/SqlInjectionFilter.php' ;

Class CheckoutController Extends BaseController {

	public function index() {

		$checkoutDetails = $this->getCheckoutDetails();
		$this->registry->template->model = $checkoutDetails;
		$this->registry->template->show('checkout');
	}
	
	private function getCheckoutDetails(){
		$checkoutDetails = array();
	
		$query = " call ".__APP_SCHEMA.".proc_checkout_details(:user_id) ";
		$queryArgs = array(
				":user_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"]
		);
		$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
			
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$userAddress = array();
	
				$userAddress["user_address_id"] = $r["user_address_id"];
				$userAddress["addr_full_name"] = $r["addr_full_name"];
				$userAddress["address"] = $r["address"];
				$userAddress["city"] = $r["city"];
				$userAddress["state"] = $r["state"];
				$userAddress["country"] = $r["country"];
				$userAddress["pin"] = $r["pin"];
				$userAddress["contact_number"] = $r["contact_number"];
				$userAddress["alternate_number"] = $r["alternate_number"];
				$userAddress["is_primary"] = $r["is_primary"];
	
				$checkoutDetails["user_addresses"][] = $userAddress;
			}
		}
	
		return 	$checkoutDetails;
	}
	
	public function addaddress(){
		$retArr = array();
	
		try{
			
			if (isset($_POST["addr_fname"]) &&
					isset($_POST["addr_address"]) && isset($_POST["addr_city"]) && isset($_POST["addr_zip"]) &&
					isset($_POST["addr_state"]) && isset($_POST["addr_country"]) &&
					isset($_POST["addr_telephone"])) {
				//echo("$email is a valid email address");
					
				$query = " call ".__APP_SCHEMA.".proc_checkout_add_address(:user_id, :name, :address, :city, :state, :zip, :country, :telephone) ";
				$queryArgs = array(":user_id"=>$_SESSION[__SESSION_KEY_USER_DATA]["USER_ID"],
						":name"=>SqlInjectionFilter::filter($_POST["addr_fname"]),
						":address"=>SqlInjectionFilter::filter($_POST["addr_address"]),
						":city"=>SqlInjectionFilter::filter($_POST["addr_city"]),
						":state"=>SqlInjectionFilter::filter($_POST["addr_state"]),
						":zip"=>SqlInjectionFilter::filter($_POST["addr_zip"]),
						":country"=>SqlInjectionFilter::filter($_POST["addr_country"]),
						":telephone"=>SqlInjectionFilter::filter($_POST["addr_telephone"])
				);
				$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);

				$results = $stmt->fetchAll();
				if ($results) {
					foreach ($results as $r) {
						$retArr["STATUS"] = $r["proc_status"];
					}
				}
					
				if($retArr["STATUS"]=="SUCCESS"){
					$stmt->nextRowset();
					$results = $stmt->fetchAll();
					if ($results) {
						foreach ($results as $r) {
							$userAddress = array();

							$userAddress["user_address_id"] = $r["user_address_id"];
							$userAddress["user_id"] = $r["user_id"];
							$userAddress["full_name"] = $r["full_name"];
							$userAddress["contact_number"] = $r["contact_number"];
							$userAddress["address"] = $r["address"];
							$userAddress["city"] = $r["city"];
							$userAddress["state"] = $r["state"];
							$userAddress["pin"] = $r["pin"];
							$userAddress["country"] = $r["country"];

							$retArr["USER_ADDRESS"] = $userAddress;
						}
					}
				}
			
			}else{
				$retArr["STATUS"] = "MANDATORY_FIELDS_MISSING";
			}
	
		}catch (Exception $e) {
			$retArr["STATUS"] = "ERROR";
			trigger_error("Error occured during registration", E_USER_ERROR);
		}
		// JSON encode and send back to the server
		echo json_encode($retArr);
	}
	
}

?>
