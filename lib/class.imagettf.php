<?php
/**
 * A simple class to write text on images
 * 
 * @author Thau
 * @version 20111114
*/
class imagettf
{
	/**
	 * Write text with border to the image using imagettftext
	 * @param resource $im An image resource.
	 * @param int $size The font size.
	 * @param int $angle The angle in degrees.
	 * @param int $x The x-ordinate.
	 * @param int $y The y-ordinate.
	 * @param string $font The path to the TrueType font.
	 * @param string $text The text string in UTF-8 encoding.
	 * @param int $textcolor The text color index.
	 * @param int $bordercolor The border color index.
	*/
	function textBorder($im, $size, $angle, $x, $y, $font, $text, $textcolor, $bordercolor)
	{
		imagettftext($im, $size, $angle, $x+1, $y, $bordercolor, $font, $text);
		imagettftext($im, $size, $angle, $x-1, $y, $bordercolor, $font, $text);
		imagettftext($im, $size, $angle, $x, $y-1, $bordercolor, $font, $text);
		imagettftext($im, $size, $angle, $x, $y+1, $bordercolor, $font, $text);
		imagettftext($im, $size, $angle, $x, $y, $textcolor, $font, $text);
	}

	/**
	 * Write text with shadow to the image using imagettftext
	 * @param resource $im An image resource.
	 * @param int $size The font size.
	 * @param int $angle The angle in degrees.
	 * @param int $x The x-ordinate.
	 * @param int $y The y-ordinate.
	 * @param string $font The path to the TrueType font.
	 * @param string $text The text string in UTF-8 encoding.
	 * @param int $width The width of the text shadow.
	 * @param int $frcolor The foreground color index.
	 * @param int $bgcolor The background color index.
	 * @param int $degree The degree of the shadow.
	*/
	function textShadow($im, $size, $angle, $x, $y, $font, $text, $width, $frcolor, $bgcolor = false, $degree = 315)
	{
		$frcolor = imagecolorsforindex($im, $frcolor);
		// gradient
		if ($bgcolor !== false)
		{
			// trouble shooting
			if ($width == 1)
			{
				$width = 2;
			}

			$bgcolor = imagecolorsforindex($im, $bgcolor);

			$steps = array(
				'red' => ($frcolor['red'] - $bgcolor['red']) / ($width-1),
				'green' => ($frcolor['green'] - $bgcolor['green']) / ($width-1),
				'blue' => ($frcolor['blue'] - $bgcolor['blue']) / ($width-1)
			);
		}

		else
		{
			$bgcolor = $frcolor;
		}

		// display shadow
		$cos = cos(deg2rad($degree));
		$sin = sin(deg2rad($degree));
		$x = $x + $width * $cos;
		$y = $y - $width * $sin;
		for ($i = 0; $i < $width; $i++)
		{
			$x -= $cos;
			$y += $sin;
			imagettftext($im, $size, $angle, round($x), round($y), imagecolorallocate($im, $bgcolor['red'], $bgcolor['green'], $bgcolor['blue']), $font, $text);
			$bgcolor = array(
				'red' => $bgcolor['red'] + $steps['red'],
				'green' => $bgcolor['green'] + $steps['green'],
				'blue' => $bgcolor['blue'] + $steps['blue'],
			);
		}
	}
}
?>