<?php
require_once("bootstrap.php");
abstract class Base
{
	var $template = null;
	
	function __construct()
	{
		global $_CONFIG, $tpl;
		$tpl->assign('config', $_CONFIG);
		$this->showTemplate();
	}

	function setTemplate($template)
	{
		$this->template = $template;	
	}

	function getTemplate()
	{
		return $this->template;
	}

	function showTemplate()
	{
		global $tpl;
		echo $tpl->draw($this->getTemplate());
	}
}
?>