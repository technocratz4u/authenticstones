<?php

Class TermsconditionsController Extends BaseController {

	public function index() {
		//$_SESSION["currentMenu"] = __MENU_HOME;

		$this->registry->template->show('terms_conditions');
	}
	
}

?>
