<?php

class UrlUtil{
	
	
	/**
	 *
	 * the constructor is set to private so
	 * so nobody can create a new instance using new
	 *
	 */
	private function __construct() {
		/*** maybe set the db name here later ***/
	}
	
	/**
	 *
	 * Like the constructor, we make __clone private
	 * so nobody can clone the instance
	 *
	 */
	private function __clone(){
	}
	
	public static function getUrlPattern($name){
		$urlPattern = strtolower(str_replace(" ", "-", $name));
		return $urlPattern;
	}
	
	public static function getNamePattern($urlPattern){
		$name = ucfirst(str_replace("-", " ", $urlPattern));
		return $name;
	}
	
} /*** end of class ***/

?>
