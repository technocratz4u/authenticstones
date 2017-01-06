<?php

include __SITE_PATH . '/service/utils/AlbumUtil.php' ;
include __SITE_PATH . '/service/utils/UrlUtil.php' ;
include __SITE_PATH . '/service/utils/SqlInjectionFilter.php' ;

Class CategoryController Extends BaseController {

	public function index() {
		
		$this->registry->template->show('_404error');
	}
	
	public function search() {
		//$_SESSION["currentMenu"] = __MENU_HOME;
		$page=isset($_GET["page"]) ? SqlInjectionFilter::filter($_GET["page"]) : 1;
		$page = is_numeric($page) ? $page : 1;
		$pageSize=isset($_GET["pagesize"]) ? SqlInjectionFilter::filter($_GET["pagesize"]) : 15;
		$pageSize = is_numeric($pageSize) ? $pageSize : 1;
		$sortBy=isset($_GET["sortby"]) ? SqlInjectionFilter::filter($_GET["sortby"]) : "price";
		$category=isset($_GET["category"]) ? SqlInjectionFilter::filter($_GET["category"]) : null;
		$shape=isset($_GET["shape"]) ? SqlInjectionFilter::filter($_GET["shape"]) : null;
		$origin=isset($_GET["origin"]) ? SqlInjectionFilter::filter($_GET["origin"]) : null;
		$priceRange=isset($_GET["price"]) ? SqlInjectionFilter::filter($_GET["price"]) : null;
		
		$filterParams = array();
		$filterParams["page"] = $page;
		$filterParams["page_size"] = $pageSize;
		$filterParams["sort_by"] = $sortBy;
		$filterParams["category"] = $category;
		$filterParams["shape"] = $shape;
		$filterParams["origin"] = $origin;
		$filterParams["price_range"] = $priceRange;
		
		$filterQueries = $this->generateSearchQuery($category, $shape, $origin, $priceRange, $sortBy, $page, $pageSize);
		$categoryPageDetails = $this->getCategoryPageDetails($filterQueries);
		$categoryPageDetails["filter_params"] = $filterParams;
		$this->registry->template->model = $categoryPageDetails;
		$this->registry->template->show('category');
	}
	
	private function generateSearchQuery($category, $shape, $origin, $priceRange, $sortBy, $page, $pageSize){
		
		$query = "select ti.item_id, ti.item_code, ti.item_name, ".
				"ti.price_carat*ti.carat_weight item_price, ti.currency, ti.shape, t_o.origin_name, ".
				"tc.category_id as category_id, tc.category_name as category_name, ".
				"tsc.category_id as sub_category_id, tsc.category_name as sub_category_name ".
				"from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc ".
				"where ti.category_id = tsc.category_id ".
				"and ti.origin_id = t_o.origin_id ".
				"and tc.parent_id IS NULL ".
				"and tsc.parent_id IS NOT NULL ".
				"and tsc.parent_id = tc.category_id ".
				"and tc.is_deleted='N' ".
				"and tsc.is_deleted='N' ";
		
		$countQuery = "select count(*) as filtered_product_count ".
				"from tbl_item ti, tbl_origin t_o, tbl_category tc, tbl_category tsc ".
				"where ti.category_id = tsc.category_id ".
				"and ti.origin_id = t_o.origin_id ".
				"and tc.parent_id IS NULL ".
				"and tsc.parent_id IS NOT NULL ".
				"and tsc.parent_id = tc.category_id ".
				"and tc.is_deleted='N' ".
				"and tsc.is_deleted='N' ";
		
		$categoryQuerySnippet = "";
		$categoryArr = explode(",", $category);
		
		foreach ($categoryArr as $categoryArrIndex => $categoryArrElem) {
			$category_subcategory = explode("--", $categoryArrElem);
			$categoryStr = isset($category_subcategory[0]) && strlen($category_subcategory[0]) > 0 ? UrlUtil::getNamePattern($category_subcategory[0]) : null;
			$subCategoryStr = isset($category_subcategory[1]) && strlen($category_subcategory[1]) > 0 ? UrlUtil::getNamePattern($category_subcategory[1]) : null;
			
			if($categoryStr!=null && strlen($categoryStr) && $subCategoryStr!=null && strlen($subCategoryStr)>0){
				if(strlen($categoryQuerySnippet)>0){
					$categoryQuerySnippet = $categoryQuerySnippet." or ";
				}
				$categoryQuerySnippet = $categoryQuerySnippet." (upper(tc.category_name) = '".strtoupper($categoryStr)."' ";
				$categoryQuerySnippet = $categoryQuerySnippet." and upper(tsc.category_name) = '".strtoupper($subCategoryStr)."') ";
			}
			
		}
		if(strlen($categoryQuerySnippet)>0){
			$query = $query." and ( ".$categoryQuerySnippet." )";
			$countQuery = $countQuery." and ( ".$categoryQuerySnippet." )";
			
		}

		$shapeQuerySnippet = "";
		$shapeArr = explode(",", $shape);
		
		foreach ($shapeArr as $shapeArrIndex => $shapeArrElem) {
				
			if($shapeArrElem!=null && strlen($shapeArrElem)>0){
				if(strlen($shapeQuerySnippet)>0){
					$shapeQuerySnippet = $shapeQuerySnippet." or ";
				}
				$shapeQuerySnippet = $shapeQuerySnippet." upper(ti.shape) = '".strtoupper(UrlUtil::getNamePattern($shapeArrElem))."' ";
			}
		}
		
		if(strlen($shapeQuerySnippet)>0){
			$query = $query." and ( ".$shapeQuerySnippet." )";
			$countQuery = $countQuery." and ( ".$shapeQuerySnippet." )";
		}
		
		
		$originQuerySnippet = "";
		$originArr = explode(",", $origin);
		
		foreach ($originArr as $originArrIndex => $originArrElem) {
		
			if($originArrElem!=null && strlen($originArrElem)>0){
				if(strlen($originQuerySnippet)>0){
					$originQuerySnippet = $originQuerySnippet." or ";
				}
				$originQuerySnippet = $originQuerySnippet." upper(t_o.origin_name) = '".strtoupper(UrlUtil::getNamePattern($originArrElem))."' ";
			}
		}
		
		if(strlen($originQuerySnippet)>0){
			$query = $query." and ( ".$originQuerySnippet." )";
			$countQuery = $countQuery." and ( ".$originQuerySnippet." )";
			
		}
		
		$priceQuerySnippet = "";
		
		if($priceRange!=null && $priceRange=="below-100-USD"){
			$priceQuerySnippet = " ti.price_carat*ti.carat_weight <= 100 ";
		}else if($priceRange!=null && $priceRange=="between-100-500-USD"){
			$priceQuerySnippet = " ti.price_carat*ti.carat_weight >= 100 and ti.price_carat*ti.carat_weight <= 500 ";
		}else if($priceRange!=null && $priceRange=="between-500-1000-USD"){
			$priceQuerySnippet = " ti.price_carat*ti.carat_weight >= 500 and ti.price_carat*ti.carat_weight <= 1000 ";
		}else if($priceRange!=null && $priceRange=="between-1000-2000-USD"){
			$priceQuerySnippet = " ti.price_carat*ti.carat_weight >= 1000 and ti.price_carat*ti.carat_weight <= 2000 ";
		}else if($priceRange!=null && $priceRange=="above-2000-USD"){
			$priceQuerySnippet = " ti.price_carat*ti.carat_weight >= 2000 ";
		}
		
		if(strlen($priceQuerySnippet)>0){
			$query = $query." and ( ".$priceQuerySnippet." )";
			$countQuery = $countQuery." and ( ".$priceQuerySnippet." )";
		}
		
		$sortByQuerySnippet = "";
		
		if($sortBy!=null){
			if($sortBy=="name"){
				$sortByQuerySnippet = " order by ti.item_name, ti.item_code ";
			}else /* if($sortBy="price") */{
				$sortByQuerySnippet = " order by ti.price_carat*ti.carat_weight ";
			}
		}
		
		if(strlen($sortByQuerySnippet)>0){
			$query = $query.$sortByQuerySnippet;
		}
		
		$limitQuerySnippet = "";
		
		if($page!=null && $pageSize!=null){
			$limitQuerySnippet = " limit ".($page-1)*$pageSize.", ".$pageSize;
		}
		
		if(strlen($limitQuerySnippet)>0){
			$query = $query.$limitQuerySnippet;
		}
		
		$filterQueries = array();
		$filterQueries["detail_query"] = $query;
		$filterQueries["count_query"] = $countQuery;
		
		//echo "---------------".$filterQueries["detail_query"];
		//echo "---------------".$filterQueries["count_query"];
		
		
		return $filterQueries;
	}
	
	private function getCategoryPageDetails($filterQueries){
		$categoryPageDetails = array();
		$categoryPageDetails["category_detail"] = array();
		$categoryPageDetails["shape_detail"] = array();
		$categoryPageDetails["origin_detail"] = array();
		$categoryPageDetails["price_detail"] = array();
		$categoryPageDetails["item_detail"] = array();
		
		$query = " call ".__APP_SCHEMA.".proc_category_detail(:filter_detail_query, :filter_count_query) ";
		$queryArgs = array(
			":filter_detail_query"=>$filterQueries["detail_query"],
			":filter_count_query"=>$filterQueries["count_query"]
		);
		$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
			
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				
				if(!(isset($categoryPageDetails["category_detail"][$r["category_id"]]) &&
						sizeof($categoryPageDetails["category_detail"][$r["category_id"]])>0)){
					$categoryPageDetails["category_detail"][$r["category_id"]]["category_id"] = $r["category_id"];
					$categoryPageDetails["category_detail"][$r["category_id"]]["category_name"] = $r["category_name"];
					$categoryPageDetails["category_detail"][$r["category_id"]]["category_url_pattern"] = UrlUtil::getUrlPattern($r["category_name"]);
					
					$categoryPageDetails["category_detail"][$r["category_id"]]["sub_category_detail"] = array();
				}
				
				$subCategoryDetail = array();
	
				$subCategoryDetail["category_id"] = $r["category_id"];
				$subCategoryDetail["category_name"] = $r["category_name"];
				$subCategoryDetail["sub_category_id"] = $r["sub_category_id"];
				$subCategoryDetail["sub_category_name"] = $r["sub_category_name"];
				$subCategoryDetail["sub_category_url_pattern"] = UrlUtil::getUrlPattern($r["sub_category_name"]);
	
				$categoryPageDetails["category_detail"][$r["category_id"]]["sub_category_detail"][] = $subCategoryDetail;
			}
		}
	
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$shapeDetail = array();
	
				$shapeDetail["shape"] = $r["shape"];
				$shapeDetail["shape_count"] = $r["shape_count"];
				$shapeDetail["shape_url_pattern"] = UrlUtil::getUrlPattern($r["shape"]);
				$categoryPageDetails["shape_detail"][] = $shapeDetail;
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$originDetail = array();
		
				$originDetail["origin_id"] = $r["origin_id"];
				$originDetail["origin_name"] = $r["origin_name"];
				$originDetail["origin_count"] = $r["origin_count"];
				$originDetail["origin_url_pattern"] = UrlUtil::getUrlPattern($r["origin_name"]);
				$categoryPageDetails["origin_detail"][] = $originDetail;
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["price_detail"]["below_100"] = $r["item_count"];
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["price_detail"]["between_100_500"] = $r["item_count"];
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["price_detail"]["between_500_1000"] = $r["item_count"];
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["price_detail"]["between_1000_2000"] = $r["item_count"];
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["price_detail"]["above_2000"] = $r["item_count"];
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$itemDetail = array();
	
				$itemDetail["item_id"] = $r["item_id"];
				$itemDetail["item_code"] = $r["item_code"];
				$itemDetail["item_name"] = $r["item_name"];
				$itemDetail["item_url_pattern"] = UrlUtil::getUrlPattern($r["item_name"]);
				$itemDetail["item_price"] = number_format($r["item_price"], 2);
				$itemDetail["currency"] = $r["currency"];
				$itemDetail["images"] = AlbumUtil::getImagesForItem($r["item_id"]);
				
				$categoryPageDetails["item_detail"][] = $itemDetail;
			}
		}
		
		$stmt->nextRowset();
		$results = $stmt->fetchAll();
		if ($results) {
			foreach ($results as $r) {
				$categoryPageDetails["filtered_product_count"] = $r["filtered_product_count"];
			}
		}
		
		return 	$categoryPageDetails;
	}
	
}

?>
