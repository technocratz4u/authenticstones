<?php
include __SITE_PATH . '/service/utils/AlbumUtil.php';
class OrderController extends BaseController {
	public function index() {
	}
	
	public function view() {
		
		/*** get the route from the url ***/
		$route = (empty($_GET['rt'])) ? '' : $_GET['rt'];
		/*** get the parts of the route ***/
		$parts = explode('/', $route);
		$interval = null;
		if(sizeof($parts)>=3 && isset($parts[2]) && !empty($parts[2])){
			$interval = $parts[2];
		}
		$orders = $this->getOrders($interval);
		$this->registry->template->model = $orders;
		$this->registry->template->show('order');
	}

private function getOrders($duration) {
	$orders = array ();
	$orders ["orders"] = array ();
	$orderDetails = array ();
	$interval = isset ($duration) ? $duration : '3';
	try {
			
		if (isset ( $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"] )) {
			$user_id = $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"];
			$previous_order_id = null;
			$query = " call " . __APP_SCHEMA . ".proc_get_user_orders(:user_id,:interval) ";
			$queryArgs = array (
					":user_id" => $_SESSION [__SESSION_KEY_USER_DATA] ["USER_ID"],
					":interval" => $interval
			);
			$stmt = Database_util::fetchStatementForProc ( $this->registry->db, $query, $queryArgs );
			$results = $stmt->fetchAll ();
			if ($results) {
				foreach ( $results as $r ) {
					
					if (!(isset ( $orderDetails ["order_id"] ) && ($orderDetails ["order_id"] == $r ["order_id"]))) {
						if(isset($orderDetails) && (count($orderDetails) > 0)){
							array_push($orders ["orders"],$orderDetails);
						}
						$orderDetails = array ();
						$orderDetails ["itemDetails"] = array();
						$orderDetails ["full_name"] = $r ["full_name"];
						$orderDetails ["address"] = $r ["address"];
						$orderDetails ["contact_number"] = $r ["contact_number"];
						$orderDetails ["invoice_id"] = $r ["invoice_id"];
						$orderDetails ["currency"] = $r ["currency"];
						$orderDetails ["email"] = $r ["email"];
						$orderDetails ["order_id"] = $r ["order_id"];
						$orderDetails ["status"] = $r ["status"];
						$orderDetails ["total_amount"] = $r ["total_amount"];
						$time = strtotime($r ["order_time"]);
						$myFormatDate = date("F j, Y, g:i a", $time);
						$orderDetails ["order_time"] = $myFormatDate;
						$orderDetails ["status_modification_time"] = date("F j, Y, g:i a", strtotime($r ["status_modification_time"]));;
						$orderItemDetails = array ();
					}
						$orderItemDetails ["order_detail_id"] = $r ["order_detail_id"];
						$orderItemDetails ["item_id"] = $r ["item_id"];
						$orderItemDetails ["item_code"] = $r ["item_code"];
						$orderItemDetails ["item_name"] = $r ["item_name"];
						$orderItemDetails ["quantity"] = $r ["quantity"];
						$orderItemDetails ["item_price"] = number_format ( $r ["item_price"], 2 );
						$orderItemDetails ["images"] = AlbumUtil::getImagesForItem ( $r ["item_id"] );
						array_push ( $orderDetails ["itemDetails"], $orderItemDetails );
					}
				}
				if(isset($orderDetails) && (count($orderDetails) > 0)){
					array_push($orders ["orders"],$orderDetails);
				}
				$orders ["interval"] = $interval;
			}
		
	} catch ( Exception $e ) {
		trigger_error ( "Error occured during fetching orders", E_USER_ERROR );
	}

	return $orders;
}
}


?>
