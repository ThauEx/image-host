<?php
function createthumb($name, $filename, $new_w, $new_h)
{
	include("lib/class.imagettf.php");
	$imagettf = new imagettf();
	$ext = "";
	$imageSize = getimagesize($name);
	$fileSize = filesize($name);

	$system = explode('.', $name);
	if ($imageSize["mime"] == "image/jpeg")
	{
		$src_img = imagecreatefromjpeg($name);
		$ext = "jpg";
	}

	if ($imageSize["mime"] == "image/png")
	{
		$src_img = imagecreatefrompng($name);
		$ext = "png";
	}

	if ($imageSize["mime"] == "image/gif")
	{
		$src_img = imagecreatefromgif($name);
		$ext = "gif";
	}

	$old_x = imageSX($src_img);
	$old_y = imageSY($src_img);

	/*if ($old_x > $old_y)
	{
		$thumb_w = $new_w;
		$thumb_h = $old_y*($new_h/$old_x);
	}*/

	/*if ($old_x < $old_y)
	{
		$thumb_w = $old_x*($new_w/$old_y);
		$thumb_h = $new_h;
	}*/

	if ($old_x == $old_y)
	{
		$thumb_w = $new_w;
		$thumb_h = $new_h;
	}

	else
	{
		$thumb_w = $new_w;
		$thumb_h = $old_y*($new_h/$old_x);
	}

	$dst_img = ImageCreateTrueColor($thumb_w, $thumb_h);
	imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $thumb_w, $thumb_h, $old_x, $old_y);

	/* Text in Image */
	$white = imagecolorallocate($dst_img, 255,255,255);
	$black = imagecolorallocate($dst_img, 0,0,0);

	$imagettf->textBorder($dst_img, 6, 0, ($new_w/5), ($new_h-5), "static/font/AUROE___.TTF", $old_x . "x" . $old_y . " " . round($fileSize/1024) . "K " . $ext, $white, $black);

	if ($imageSize["mime"] == "image/png")
	{
		imagepng($dst_img, $filename); 
	}

	if ($imageSize["mime"] == "image/gif")
	{
		imagegif($dst_img, $filename);
	}

	else
	{
		imagejpeg($dst_img, $filename); 
	}

	imagedestroy($dst_img); 
	imagedestroy($src_img); 
}

function resizeImage($name, $filename, $new_w, $new_h)
{
	$ext = "";
	$imageSize = getimagesize($name);
	$fileSize = filesize($name);

	$system = explode('.', $name);
	if ($imageSize["mime"] == "image/jpeg")
	{
		$src_img = imagecreatefromjpeg($name);
		$ext = "jpg";
	}

	if ($imageSize["mime"] == "image/png")
	{
		$src_img = imagecreatefrompng($name);
		$ext = "png";
	}

	if ($imageSize["mime"] == "image/gif")
	{
		$src_img = imagecreatefromgif($name);
		$ext = "gif";
	}

	$old_x = imageSX($src_img);
	$old_y = imageSY($src_img);

	if ($old_x > $old_y)
	{
		$thumb_w = $new_w;
		$thumb_h = $old_y*($new_h/$old_x);
	}

	if ($old_x < $old_y)
	{
		$thumb_w = $old_x*($new_w/$old_y);
		$thumb_h = $new_h;
	}

	$dst_img = ImageCreateTrueColor($thumb_w, $thumb_h);
	imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $thumb_w, $thumb_h, $old_x, $old_y);

	/* Text in Image */
	$white = imagecolorallocate($dst_img, 255,255,255);
	$black = imagecolorallocate($dst_img, 0,0,0);

	if ($imageSize["mime"] == "image/png")
	{
		imagepng($dst_img, $filename); 
	}

	if ($imageSize["mime"] == "image/gif")
	{
		imagegif($dst_img, $filename);
	}

	else
	{
		imagejpeg($dst_img, $filename); 
	}

	imagedestroy($dst_img); 
	imagedestroy($src_img); 
}

function binary_multiples($size, $praefix = true, $short = true)
{
	if($praefix === true)
	{
		if($short === true)
		{
			$norm = array(	'B', 'kB', 'MB', 'GB', 'TB', 'PB', 
							'EB', 'ZB', 'YB');
		}
		else
		{
			$norm = array(	'Byte', 
							'Kilobyte', 
							'Megabyte', 
							'Gigabyte', 
							'Terabyte', 
							'Petabyte', 
							'Exabyte', 
							'Zettabyte', 
							'Yottabyte'
						);
		}
		
		$factor = 1000;
	}

	else
	{
		if($short === true)
		{
			$norm = array(	'B', 'KiB', 'MiB', 'GiB', 'TiB', 'PiB', 
							'EiB', 'ZiB', 'YiB');
		}
		else
		{
			$norm = array('Byte', 
						  'Kibibyte', 
						  'Mebibyte', 
						  'Gibibyte', 
						  'Tebibyte', 
						  'Pebibyte', 
						  'Exbibyte', 
						  'Zebibyte', 
						  'Yobibyte'
						 );
		}
		
		$factor = 1024;
		
	}
	
	$count = count($norm) -1;
	
	$x = 0;
	while ($size >= $factor && $x < $count) 
	{ 
		$size /= $factor; 
		$x++;
	}

	$size = sprintf("%01.2f", $size) . ' ' . $norm[$x];

	return $size; 

}

function session_stop() {
	/*$_SESSION = array();

	if (ini_get("session.use_cookies"))
	{
		$params = session_get_cookie_params();
		setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
	}*/

	session_destroy();
	/*unset($_SESSION["formData"]);
	unset($_SESSION["imageData"]);
	unset($_SESSION["error"]);*/
}
?>