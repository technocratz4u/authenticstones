<?php
class AdminController extends BaseController {
	public function index() {
		$this->registry->template->show ( 'admin' );
	}
	public function login() {
		$retArr = array ();
		
		try {
			
			if (isset ( $_POST ["login_username"] ) && isset ( $_POST ["login_password"] )) {
				
				$query = " call " . __APP_SCHEMA . ".proc_admin_authentication(:username, :password) ";
				$queryArgs = array (
						":username" => $_POST ["login_username"],
						":password" => $_POST ["login_password"] 
				);
				$stmt = Database_util::fetchStatementForProc ( $this->registry->db, $query, $queryArgs );
				
				$results = $stmt->fetchAll ();

					if (count($results)==0) {
						$retArr ["STATUS"] = "Invalid Login";
					} else {
						foreach ( $results as $r ) {
							
							$adminData = array ();
							
							$adminData ["ADMIN_ID"] = $r ["admin_id"];
							$adminData ["EMAIL"] = $r ["email"];
							$adminData ["USERNAME"] = $r ["username"];
							$adminData ["CONTACT_NO"] = $r ["contact_no"];
							$retArr ["STATUS"] = "SUCCESS";
							
							$_SESSION [__SESSION_KEY_ADMIN_DATA] = $adminData;
						}
					}
				
			}
		} catch ( Exception $e ) {
			$retArr ["STATUS"] = "ERROR";
			trigger_error ( "Error occured during registration", E_USER_ERROR );
		}
		
		if ($retArr ["STATUS"] == "SUCCESS") {
			$this->registry->template->show ( 'admin_dashboard' );
		} else {	
			
			$this->registry->template->model = $retArr;
			$this->registry->template->show ( 'admin' );
		}
	}
	
	public function logout() {
		/*** destroy the current session from which logged out ***/
		session_destroy();
		/*** create a new session ***/
		session_start();
		
		$this->registry->template->show ( 'admin' );
	}
}

?>
