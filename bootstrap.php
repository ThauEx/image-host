<?php
//http://krumo.sourceforge.net/
require_once("config/config.php");
#require_once("config/urlMapping.php");


require_once("lib/RainTpl.php");
$config = array( 
	"base_url"	=> null, 
	"tpl_dir"	=> "tpl/",
	"cache_dir"	=> "cache/",
	"debug"		=> true,
	'tpl_ext'	=> 'tpl',
	'base_url'	=> $_CONFIG["domain"],
);
RainTpl::configure( $config );
$tpl = new RainTpl;
require_once("lib/functions.inc.php");

session_start();
?>
