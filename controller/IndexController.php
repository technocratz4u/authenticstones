<?php

include __SITE_PATH . '/service/utils/AlbumUtil.php' ;

Class IndexController Extends BaseController {

	public function index() {
		if(isset($_POST["LOGOUT_FLAG"]) && $_POST["LOGOUT_FLAG"]=="Y"){
			/*** destroy the current session from which logged out ***/
			session_destroy();
			/*** create a new session ***/
			session_start();
		}
		
		/*** load the index template ***/
		$homePageDetails = $this->getHomePageDetails();
		$this->registry->template->model = $homePageDetails;
		$this->registry->template->show('home');
	}
	
	private function getHomePageDetails(){
		$homePageDetails = array();
	
		$query = " call ".__APP_SCHEMA.".proc_home_page() ";
		$queryArgs = array();
		$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
			
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$hotThisWeekDetail = array();
	
				$hotThisWeekDetail["item_id"] = $r["item_id"];
				$hotThisWeekDetail["item_code"] = $r["item_code"];
				$hotThisWeekDetail["item_name"] = $r["item_name"];
				$hotThisWeekDetail["item_price"] = number_format($r["item_price"], 2);
				$hotThisWeekDetail["currency"] = $r["currency"];
				$hotThisWeekDetail["images"] = AlbumUtil::getImagesForItem($r["item_id"]);
				
				$homePageDetails["hot_this_week"][] = $hotThisWeekDetail;
			}
		}
	
		return 	$homePageDetails;
	}
	

}

?>
