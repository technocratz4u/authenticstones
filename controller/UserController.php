<?php
class UserController extends BaseController {
	
	public function index() {
	}
	
	public function edit() {
		$userDetails = $this->getUserProfile ();
		$this->registry->template->model = $userDetails;
		$this->registry->template->show ( 'userProfile' );
	}
	
	
	public function changepassword() {
		$retArr = array ();
		
		try{

			if (isset ( $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"] ) && !empty($_POST ["oldpassword"]) && !empty($_POST ["newPassword"])) {
				$query = " call " . __APP_SCHEMA . ".proc_user_change_password(:user_id,:current_password,:new_password) ";
				$queryArgs = array (
						":user_id" => $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"],
						":current_password" => empty ( $_POST ["oldpassword"] ) ? null : $_POST ["oldpassword"],
						":new_password" => empty ( $_POST ["newPassword"] ) ? null : $_POST ["newPassword"]
				);
				
				$stmt = Database_util::fetchStatementForProc ( $this->registry->db, $query, $queryArgs );
				$results = $stmt->fetchAll ();
				if ($results) {
					foreach ( $results as $r ) {
						$retArr ["STATUS"] = $r ["proc_status"];
					}
				}	
			}else{
				$retArr ["STATUS"] = "INVALID";
			}
			
		} catch ( Exception $e ) {
			$retArr ["STATUS"] = "ERROR";
			trigger_error ( "Error occured during registration", E_USER_ERROR );
		}

		$this->registry->template->model = $retArr;
		$this->registry->template->show ( 'changePassword' );
	}
	public function save() {
		$retArr = array ();
		$userDetails = array ();
		
		try {
			
			if (isset ( $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"] )) {
				
				$query = " call " . __APP_SCHEMA . ".proc_user_profile(:method_key,:user_id,:existingName,:name,:address,:country,:state,:city,:pin,:contact_number) ";
				$queryArgs = array (
						":method_key" => "ADD_ADDRESS",
						":user_id" => $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"],
						":existingName" => empty ( $_POST ["name"] ) ? null : $_POST ["name"],
						":name" => empty ( $_POST ["newFullName"] ) ? null : $_POST ["newFullName"],
						":address" => empty ( $_POST ["newAddrLine1"] ) ? null : $_POST ["newAddrLine1"] . (! empty ( $_POST ["newAddrLine2"] ) ? ' ' . $_POST ["newAddrLine2"] : null),
						":country" => empty ( $_POST ["newCountry"] ) ? null : $_POST ["newCountry"],
						":state" => empty ( $_POST ["newState"] ) ? null : $_POST ["newState"],
						":city" => empty ( $_POST ["newCity"] ) ? null : $_POST ["newCity"],
						":pin" => empty ( $_POST ["newPin"] ) ? null : $_POST ["newPin"],
						":contact_number" => empty ( $_POST ["newContactNumber"] ) ? null : $_POST ["newContactNumber"] 
				);
				
				$stmt = Database_util::fetchStatementForProc ( $this->registry->db, $query, $queryArgs );
				$results = $stmt->fetchAll ();
				if ($results) {
					foreach ( $results as $r ) {
						$retArr ["STATUS"] = $r ["proc_status"];
					}
				}
				if ($retArr ["STATUS"] == "SUCCESS") {
					$stmt->nextRowset ();
					$results = $stmt->fetchAll ();
					if ($results) {
						$userDetails = $this->processUserResults ( $results );
					}
				}
			} else {
				$retArr ["STATUS"] = "ERROR";
			}
		} catch ( Exception $e ) {
			$retArr ["STATUS"] = "ERROR";
			trigger_error ( "Error occured during registration", E_USER_ERROR );
		}
		
		$userDetails ["STATUS"] = $retArr ["STATUS"];
		$this->registry->template->model = $userDetails;
		$this->registry->template->show ( 'userProfile' );
	}
	private function getUserProfile() {
		$userDetails = array ();
		
		try {
			
			if (isset ( $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"] )) {
				
				$query = " call " . __APP_SCHEMA . ".proc_user_profile(:method_key,:user_id,:existingName,:name,:address,:country,:state,:city,:pin,:contact_number) ";
				$queryArgs = array (
						":method_key" => "GET_PROFILE",
						":user_id" => $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"],
						":existingName" => null,
						":name" => null,
						":address" => null,
						":country" => null,
						":state" => null,
						":city" => null,
						":pin" => null,
						":contact_number" => null 
				)
				;
				$stmt = Database_util::fetchStatementForProc ( $this->registry->db, $query, $queryArgs );
				$results = $stmt->fetchAll ();
				if ($results) {
					$userDetails = $this->processUserResults ( $results );
				}
			}
		} catch ( Exception $e ) {
			trigger_error ( "Error occured during registration", E_USER_ERROR );
		}
		
		return $userDetails;
	}
	
	public function deleteUserAddress(){
		$retArr = array();
	
		try{
			// Validate e-mail
			if (isset($_POST["user_address_id"]) && isset ( $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"] )) {

						
					$query = " call ".__APP_SCHEMA.".proc_delete_user_address(:user_id, :user_address_id) ";
					$queryArgs = array(
							":user_id"=>$_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"],
							":user_address_id"=>$_POST["user_address_id"]
					);
					$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
	
					$results = $stmt->fetchAll();
					if ($results) {
						foreach ($results as $r) {
							$retArr["STATUS"] = $r["proc_status"];
						}
					}		
			}else{
				$retArr["STATUS"] = "ERROR";
			}
	
		}catch (Exception $e) {
			$retArr["STATUS"] = "ERROR";
			trigger_error("Error occured during deleting address", E_USER_ERROR);
		}
		// JSON encode and send back to the server
		echo json_encode($retArr);
	}
	private function processUserResults($results) {
		$userDetails = array ();
		$userDetails ["addressDetails"] = array ();
		foreach ( $results as $r ) {
			$userDetails ["full_name"] = $r ["full_name"];
			$_SESSION [__SESSION_KEY_USER_DATA] ["FULL_NAME"] = $r ["full_name"];
			$userDetails ["email"] = $r ["email"];
			$userAddressDetails = array ();
			$userAddressDetails ["addr_full_name"] = $r ["addr_full_name"];
			$userAddressDetails ["address"] = $r ["address"];
			$userAddressDetails ["city"] = $r ["city"];
			$userAddressDetails ["state"] = $r ["state"];
			$userAddressDetails ["country"] = $r ["country"];
			$userAddressDetails ["user_address_id"] = $r ["user_address_id"];
			$userAddressDetails ["contact_number"] = $r ["contact_number"];
			$userAddressDetails ["alternate_number"] = $r ["alternate_number"];
			$userAddressDetails ["is_primary"] = $r ["is_primary"];
			$userAddressDetails ["pin"] = $r ["pin"];
			array_push ( $userDetails ["addressDetails"], $userAddressDetails );
		}
		return $userDetails;
	}
}
?>
