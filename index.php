<?php
require_once("base.php");

class frontPage extends Base
{
	function __construct()
	{
		if (isset($_GET["kill"])) {
			session_destroy();
			echo "session killed";
		}

		global $tpl;
		$this->checkFile();

		if (isset($_SESSION["error"])) {
			$tpl->assign('error', $_SESSION["error"]);
			session_stop();
		}

		$tpl->assign('sessionProgressName', ini_get("session.upload_progress.name"));
		$this->setTemplate("frontpage");
		parent::__construct();
	}

	private function checkFile() {
		global $_CONFIG;
		if (isset($_FILES['userfile']))
		{
			if (empty($_FILES['userfile']['name']))
			{
				$_SESSION["error"] = "Kein Bild zum hochladen ausgewählt.";
			}

			else
			{
				$_SESSION["formData"] = $_POST;
				$_SESSION["imageData"] = $_FILES;
				if (is_uploaded_file($_SESSION['imageData']['userfile']['tmp_name']))
				{
					$_SESSION["imageData"]['userfile']['image'] = file_get_contents($_SESSION['imageData']['userfile']['tmp_name']);
					header("Location: " . $_CONFIG["domain"] . "/process.php");
					exit();
				}
				$_SESSION["error"] = "Fehler beim hochladen der Datei.";
			}
		}
	}
}
new frontPage();
?>