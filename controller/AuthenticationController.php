<?php

include __SITE_PATH . '/service/utils/AlbumUtil.php' ;

Class AuthenticationController Extends BaseController {

	public function index() {
		if(isset($_POST["logoutFlag"]) && $_POST["logoutFlag"]=="Y"){
			/*** destroy the current session from which logged out ***/
			session_destroy();
			/*** create a new session ***/
			session_start();
		}else{
			// set the current menu as HOME
			//$_SESSION["currentMenu"] = __MENU_HOME;
			$_SESSION["dataPresent"]="Y";
		}
		
		/*** load the index template ***/
		$homePageDetails = $this->getHomePageDetails();
		$this->registry->template->model = $homePageDetails;
		$this->registry->template->show('home');
	}
	
	public function register(){
		$retArr = array();
		
		try{
			// Validate e-mail
			if (isset($_POST["register_email"]) && filter_var($_POST["register_email"], FILTER_VALIDATE_EMAIL)) {
				//echo("$email is a valid email address");
				if(isset($_POST["register_password"]) && isset($_POST["register_confirm_password"]) &&
						$_POST["register_password"]==$_POST["register_confirm_password"]){
					
					$query = " call ".__APP_SCHEMA.".proc_sign_up_sign_in(:call_key, :email, :password, :full_name) ";
					$queryArgs = array(":call_key"=>"REGISTER",
						":email"=>$_POST["register_email"],
						":password"=>$_POST["register_password"],
						":full_name"=>$_POST["register_name"]
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
								$userData = array();
								
								$userData["USER_ID"] = $r["user_id"];
								$userData["EMAIL"] = $r["email"];
								$userData["FULL_NAME"] = $r["full_name"];
								
								$_SESSION[__SESSION_KEY_USER_DATA]=$userData;
								
								$retArr["FULL_NAME"] = $r["full_name"];
							}
						}
					}
				}else{
					$retArr["STATUS"] = "PASSWORD_MISMATCH";
				}
			}else{
				$retArr["STATUS"] = "INVALID_EMAIL";
			}
	
		}catch (Exception $e) {
			$retArr["STATUS"] = "ERROR";
			trigger_error("Error occured during registration", E_USER_ERROR);
		}
		// JSON encode and send back to the server
		echo json_encode($retArr);
	}
	
	public function login(){
		$retArr = array();
	
		try{
			// Validate e-mail
			if (isset($_POST["login_username"]) && filter_var($_POST["login_username"], FILTER_VALIDATE_EMAIL)) {
				//echo("$email is a valid email address");
						
					$query = " call ".__APP_SCHEMA.".proc_sign_up_sign_in(:call_key, :email, :password, :full_name) ";
					$queryArgs = array(":call_key"=>"LOGIN",
							":email"=>$_POST["login_username"],
							":password"=>$_POST["login_password"],
							":full_name"=>null
					);
					$stmt = Database_util::fetchStatementForProc($this->registry->db, $query, $queryArgs);
	
					$results = $stmt->fetchAll();
					$userDataCount=0;
					if ($results) {
						foreach ($results as $r) {
							$userData = array();
	
							$userData["USER_ID"] = $r["user_id"];
							$userData["EMAIL"] = $r["email"];
							$userData["FULL_NAME"] = $r["full_name"];

							$_SESSION[__SESSION_KEY_USER_DATA]=$userData;

							$retArr["FULL_NAME"] = $r["full_name"];
							$retArr["STATUS"] = "SUCCESS";
							
							$userDataCount++;
						}
					}
					if($userDataCount!=1){
						$retArr["STATUS"] = "INVALID_EMAIL_PASSWORD";
					}
						
			}else{
				$retArr["STATUS"] = "INVALID_EMAIL";
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
