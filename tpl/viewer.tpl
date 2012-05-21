<!DOCTYPE html>
<html>
<head>
<title>{$config.title} - Photo Hosting</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<link href="/static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="/static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="/static/js/jquery-1.7.2.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var actualWidth = 350;
var actualHeight = 19;

function scaleImg()
{
	if (fitsInWindow())
		return;

	what = document.getElementById('thepic');

	if(what.width==tableWidth())
	{
		what.width=actualWidth;
		what.height=actualHeight;
		displayWarning("none");
	}

	else
	{
		what.style.cursor = "pointer";
		what.width = tableWidth();
		what.height = (actualHeight/actualWidth) * what.width;displayWarning("block");
	}
}

function liveResize()
{
	if (fitsInWindow())
		return;

	what = document.getElementById('thepic');
	if (what.width!=actualWidth)
	{
		what.width = tableWidth();
		what.height = (actualHeight/actualWidth) * what.width;
		displayWarning("block");
	}
}

function setImgWidth()
{
	if (fitsInWindow())
		return;

	document.getElementById('thepic').width = tableWidth();
	displayWarning("block");
}

function fitsInWindow()
{
	if (actualWidth<tableWidth())
	{
		displayWarning("none");
		return true;
	}

	return false;
}

function tableWidth()
{
	return windowWidth()-100;
}

function windowWidth()
{
	if (navigator.appName=="Netscape")
		return window.innerWidth;

	return document.body.offsetWidth;
}

function displayWarning(how)
{
	document.getElementById('scalewarning').style.display = how;
}

function highlight(field)
{
	field.focus();
	field.select();
}

onresize = liveResize;
</script>
</head>
<body>
{include="header"}
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">Sidebar</li>
						<li class="active"><a href="/">Bilder hochladen</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
		<div class="span9">
			<div id="scalewarning" style="display: none;" align="center">
				This image has been scaled down to fit your computer screen. Click on it to show it in the original size.
			</div>
			<table border='0' bgcolor='white' align="center">
				<tr>
					<td>
						<img src='{$config.domain}/{$config.server}/{$folder}/{$image}'>
					</td>
				</tr>
			</table>
			<label>
				<div align="center">
					<input name="textfield" class="input-xxlarge" type="text" value="{$config.domain}/photo/my-images/{$folder}/{$image}/" size="60" />
				</div>
			</label>
			<br>
			<table class="table_decoration" align="center" border="0" cellpadding="5" cellspacing="0" width="720">
				<tbody>
					<tr>
						<td align="center">
							<input value="Free Image Hosting" onClick="window.location='{$config.domain}'" type="button">
							<form method="post" action="basic.php" enctype="multipart/form-data" onSubmit="disableme('butan')">
								<input name="MAX_FILE_SIZE" value="3145728" type="hidden">Upload an image: <input name="refer" value="" type="hidden">
								<input name="userfile" type="file" id="userfile" size="30"> 
								<input name="upload" type="submit" id="butan" style="width: 100px;" value="host it!">
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<table border="0" cellpadding="3" cellspacing="0">
								<tbody>
									<tr>
										<td valign="top"></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--/span-->
	</div><!--/row-->

	<hr>

	<footer>
		<p>&copy; {$config.title}  2012</p>
	</footer>

	</div><!--/.fluid-container-->
	<script type="text/javascript">
	$('#btnHelp').popover({placement: "bottom"});
	</script>
</body>
</html>