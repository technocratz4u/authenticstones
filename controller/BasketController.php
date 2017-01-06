<?php
include __SITE_PATH . '/service/utils/AlbumUtil.php';
class BasketController extends BaseController {
	public function index() {
	}
	public function getUserData() {
		$userData = $_SESSION [__SESSION_KEY_USER_DATA];
		
		return $userData;
	}
	
	/**
	 * Persists Cart into Database
	 * If a cart for a user exists in Database, then merges the cart objects
	 */
	public function saveOrUpdate() {
		$cartArray = array ();
		$persistCartData = "";
		$cartData = array ();
		$basket = array ();
		$countCartData = 0;
		
		/**
		 * * get the user data from session **
		 */
		$userData = $this->getUserData ();
		
		try {
			// Persist in Database only for logged-in users
			if (! empty ( $userData ) && count ( $userData ) > 0) {
				
				if(! empty($_POST ["cart"])){
				
					$cartArray = json_decode ( $_POST ["cart"], true, 10 );
					
					foreach ( $cartArray as $itemKey => $itemObj ) {
						if (! empty ( $persistCartData )) {
							$persistCartData .= ",";
						}
						$persistCartData .= $itemKey . "=" . $itemObj ['quantity'];
						$countCartData = $countCartData + 1;
					}
				}else{
					$persistCartData = "";
					$countCartData = 0;
				}
				
				$query = " call " . __APP_SCHEMA . ".proc_basket(:user_id,:item_id,:in_item_array,:in_item_array_count,:action_code) ";
				$queryArgs = array (
						":user_id" => $userData ["USER_ID"],
						":item_id" => null,
						":in_item_array" => $persistCartData,
						":in_item_array_count" => $countCartData,
						":action_code" => "saveorupdate" 
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
						if ($results) {
							foreach ( $results as $r ) {
								$itemDetails = array();
								$itemDetails["item_id"] = $r["item_id"];
								$itemDetails["category_name"] = $r["category_name"];
								$itemDetails["item_code"] = $r["item_code"];
								$itemDetails["item_name"] = $r["item_name"];
								$itemDetails["shape"] = $r["shape"];
								$itemDetails["quantity"] = $r["quantity"];
								$itemDetails["color"] = $r["color"];
								$itemDetails["dimensions"] = $r["dimensions"];
								$itemDetails["mean_rating"] = $r["mean_rating"];
								$itemDetails["price_carat"] = $r["price_carat"];
								$itemDetails["carat_weight"] = $r["carat_weight"];
								$itemDetails["description"] = $r["description"];
								$itemDetails["item_price"] = $r["item_price"];
								$itemDetails["origin_name"] = $r["origin_name"];
								$itemDetails["treatment_name"] = $r["treatment_name"];
								$itemDetails["currency"] = $r["currency"];
								$itemDetails["images"] = AlbumUtil::getImagesForItem($r["item_id"]);
								
								$cartData [$itemDetails["item_id"]] = $itemDetails;
							}
						}
					}
				}
			}
		} catch ( Exception $e ) {
			$retArr ["STATUS"] = "ERROR";
			trigger_error ( "Error occured during adding to cart", E_USER_ERROR );
		}
		
		// JSON encode and send back to the server
		print_r ( json_encode ( $cartData ) );
	}
	
	/**
	 * Persists Cart into Database
	 * If a cart for a user exists in Database, then replaces the cart objects
	 */
	public function save() {
		$retArr = array ();
		$cartArray = array ();
		$persistCartData = "";
		$cartData = array ();
		$basket = array ();
		$countCartData = 0;
		
		/**
		 * * get the user data from session **
		 */
		$userData = $this->getUserData ();
		
		try {
			// Persist in Database only for logged-in users
			if (! empty ( $userData ) && count ( $userData ) > 0) {
				
				$cartArray = json_decode ( $_POST ["cart"], true, 10 );
				
				foreach ( $cartArray as $itemKey => $itemObj ) {
					if (! empty ( $persistCartData )) {
						$persistCartData .= ",";
					}
					$persistCartData .= $itemKey . "=" . $itemObj ['quantity'];
					$countCartData = $countCartData + 1;
				}
				
				$query = " call " . __APP_SCHEMA . ".proc_basket(:user_id,:item_id,:in_item_array,:in_item_array_count,:action_code) ";
				$queryArgs = array (
						":user_id" => $userData ["USER_ID"],
						":item_id" => null,
						":in_item_array" => $persistCartData,
						":in_item_array_count" => $countCartData,
						":action_code" => "save" 
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
						if ($results) {
							foreach ( $results as $r ) {
								$itemDetails = array();
								$itemDetails["item_id"] = $r["item_id"];
								$itemDetails["category_name"] = $r["category_name"];
								$itemDetails["item_code"] = $r["item_code"];
								$itemDetails["item_name"] = $r["item_name"];
								$itemDetails["shape"] = $r["shape"];
								$itemDetails["quantity"] = $r["quantity"];
								$itemDetails["color"] = $r["color"];
								$itemDetails["dimensions"] = $r["dimensions"];
								$itemDetails["mean_rating"] = $r["mean_rating"];
								$itemDetails["price_carat"] = $r["price_carat"];
								$itemDetails["carat_weight"] = $r["carat_weight"];
								$itemDetails["description"] = $r["description"];
								$itemDetails["item_price"] = $r["item_price"];
								$itemDetails["origin_name"] = $r["origin_name"];
								$itemDetails["treatment_name"] = $r["treatment_name"];
								$itemDetails["currency"] = $r["currency"];
								$itemDetails["images"] = AlbumUtil::getImagesForItem($r["item_id"]);
				
								$cartData [$itemDetails["item_id"]] = $itemDetails;
							}
						}
					}
				}
			}
		} catch ( Exception $e ) {
			$retArr ["STATUS"] = "ERROR";
			trigger_error ( "Error occured during adding to cart", E_USER_ERROR );
		}
		
		// JSON encode and send back to the server
		print_r ( json_encode ( $cartData ) );
	}
	
	/**
	 * Redirects to Basket page
	 * Fetches Cart from local storage
	 */
	public function view() {
		$this->registry->template->model = array();
		$this->registry->template->show ('basket');
	}
}

?>