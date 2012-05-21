<?php
require_once("base.php");

class viewerPage extends Base
{
  function __construct()
  {
	global $tpl;

	$tpl->assign('folder', $_GET["folder"]);
	$tpl->assign('image', $_GET["image"]);

	$this->setTemplate("viewer");
	parent::__construct();
  }
}
new viewerPage();
?>