<?php
require_once("bootstrap.php");

if (!empty($_SESSION['imageData']['userfile']['image']))
{
	if ($_SESSION['imageData']['userfile']['size'] > $_CONFIG["max_size"])
	{
		$_SESSION["error"] = "File Size too Big!";
	}

	if ($_SESSION['imageData']['userfile']['type'] == "application/octet-stream") {
		$im = imagecreatefromstring($_SESSION['imageData']['userfile']['image']);
		if ($im !== false) {
			$_SESSION['imageData']['userfile']['type'] = "image/png";
		}
	}

	if (
			($_SESSION['imageData']['userfile']['type'] == "image/gif") || 
			($_SESSION['imageData']['userfile']['type'] == "image/pjpeg") || 
			($_SESSION['imageData']['userfile']['type'] == "image/jpeg") || 
			($_SESSION['imageData']['userfile']['type'] == "image/x-png") || 
			($_SESSION['imageData']['userfile']['type'] == "image/png")
		)
	{
		if (file_exists("./" . $_CONFIG["path"] . $_SESSION['imageData']['userfile']['name']))
		{
			$_SESSION["error"] = "A File with that name exists, please rename your file."; // error to startpage
		}

		//generate random number
		#$randImageFolder = rand(100, 999);
		$randImageFolder = 999;
		$pathinfo = pathinfo($_SERVER["SCRIPT_FILENAME"]);

		if (!is_dir($pathinfo["dirname"] . "/" . $_CONFIG["server"] . "/" . $randImageFolder))
		{
			mkdir($pathinfo["dirname"] . "/" . $_CONFIG["server"] . "/" . $randImageFolder);
		}

		if (isset($_SESSION["formData"]["imgSize"]))
		{
			# code...
		}

		/*if (!move_uploaded_file( $_SESSION['imageData']['userfile']['tmp_name'], $pathinfo["dirname"] . "/" . $_CONFIG["server"] . "/" . $randImageFolder . "/" . $_SESSION['imageData']['userfile']['name'] ))
		{
			$_MESSAGE["error"] = "Upload Failed, please try again";
		}*/
		if (!file_put_contents($pathinfo["dirname"] . "/" . $_CONFIG["server"] . "/" . $randImageFolder . "/" . $_SESSION['imageData']['userfile']['name'], $_SESSION['imageData']['userfile']['image']))
		{
			$_SESSION["error"] = "Upload Failed, please try again";
		}

		else
		{
			//set url variable
			$domst = "";
			$drecks = "/";
			$imgf = $randImageFolder . "/" . $_SESSION['imageData']['userfile']['name'];
			$imageThumbName = pathinfo($_CONFIG["server"] . "/" . $imgf);
			$imageThumbName = $randImageFolder . "/" . $imageThumbName["filename"] . ".th." . $imageThumbName["extension"];
			$thbf = $_CONFIG["tpath"] . $imgf;
			$urlf = $domst . $_CONFIG["domain"] . $drecks . $_CONFIG["path"] . $imgf;

			//create thumbnails
			createthumb($_CONFIG["server"] . "/" . $imgf, $_CONFIG["server"] . "/" . $imageThumbName, $_CONFIG["tsize"], $_CONFIG["tsize"]);
			session_stop();
			header("Location: " . $_CONFIG["domain"] . "/content_uploaded.php?page=done&l=" . $_CONFIG["server"] . "/" . $randImageFolder . "/" . $_SESSION['imageData']['userfile']['name']);
			exit();
		}
	}

	else
	{
		$_SESSION["error"] = "Sorry we dont allow that file type.!";
	}
}

else
{
	#$_SESSION["error"] = "Some kind of error";
}
	header("Location: " . $_CONFIG["domain"]);
	exit();
?>
