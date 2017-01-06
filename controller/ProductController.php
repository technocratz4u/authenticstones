<?php

include __SITE_PATH . '/service/utils/AlbumUtil.php' ;

Class ProductController Extends BaseController {

	public function index() {

	}
	
	public function view(){
		/*** get the route from the url ***/
		$route = (empty($_GET['rt'])) ? '' : $_GET['rt'];
		/*** get the parts of the route ***/
		$parts = explode('/', $route);
		$itemId = null;
		if(sizeof($parts)>=4 && isset($parts[3]) && !empty($parts[3])){
			$itemId = $parts[3];
			$productDetails = $this->getProductDetails($itemId);
			$this->registry->template->model = $productDetails;
			$this->registry->template->show('product');
		}else{
			$this->registry->template->show('_404error');
		}

	}
	
	private function getProductDetails($itemId){
		$productDetails = array();
	
		$query = " call ".__APP_SCHEMA.".proc_get_item_details(:item_id) ";
		$queryArgs = array(":item_id"=>$itemId);
		$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
			
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$productDetails["item_id"] = $r["item_id"];
				$productDetails["category_name"] = $r["category_name"];
				$productDetails["item_code"] = $r["item_code"];
				$productDetails["item_name"] = $r["item_name"];
				$productDetails["shape"] = $r["shape"];
				$productDetails["quantity"] = $r["quantity"];
				$productDetails["color"] = $r["color"];
				$productDetails["dimensions"] = $r["dimensions"];
				$productDetails["mean_rating"] = $r["mean_rating"];
				$productDetails["price_carat"] = $r["price_carat"];
				$productDetails["carat_weight"] = $r["carat_weight"];
				$productDetails["description"] = $r["description"];
				$productDetails["item_price"] = $r["item_price"];
				$productDetails["origin_name"] = $r["origin_name"];
				$productDetails["treatment_name"] = $r["treatment_name"];
				$productDetails["currency"] = $r["currency"];
				$productDetails["images"] = AlbumUtil::getImagesForItem($r["item_id"]);

			}
		}
	
		return 	$productDetails;
	}
	
	
}

?>
