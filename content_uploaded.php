<?php
require_once("base.php");

class contentUploadedPage extends Base
{
  function __construct()
  {
	global $tpl;
	$imagePathInfo = pathinfo($_GET["l"]);
	$imageDirInfo = pathinfo($imagePathInfo["dirname"]);
	$imageName = $imagePathInfo["dirname"] . "/" . $imagePathInfo["filename"] . "." . $imagePathInfo["extension"];
	$imagePage = "photo/my-images/" . $imageDirInfo["basename"] . "/" . $imagePathInfo["filename"] . "." . $imagePathInfo["extension"];
	$imageThumbName = $imagePathInfo["dirname"] . "/" . $imagePathInfo["filename"] . ".th." . $imagePathInfo["extension"];

	$tpl->assign('imagePathInfo', $imagePathInfo);
	$tpl->assign('imageDirInfo', $imageDirInfo);
	$tpl->assign('imageName', $imageName);
	$tpl->assign('imagePage', $imagePage);
	$tpl->assign('imageThumbName', $imageThumbName);

	$this->setTemplate("content_uploaded");
	parent::__construct();
  }
}
new contentUploadedPage();
?>