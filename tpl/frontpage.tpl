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
var intervalID = 0;
$(document).ready(function(e)
{
	$('form').submit(function(e)
	{
		/*if($('#datei1').val() == '' && $('#datei2') == '')
		{
			e.preventDefault(); //Event abbrechen

			return false;
		}*/

		intervalID = setInterval(function()
		{
			$.getJSON('progressStatus.php', function(data)
			{
				if(data)
				{
					var progress = Math.ceil((data.bytes_processed / data.content_length) * 100);
					$('#progress').css('width', progress + "%");
				}
			});
		}, 1000); //Zeitintervall auf 1s setzen
	});

	$('#abbrechen').click(function(e)
	{
		$.ajax("progressStatus.php?cancel=true");
		$('#progress').css('width', "100%");
		clearInterval(intervalID);
	});
});
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
						<li><a href="#">Regeln</a></li>
						<li><a href="#">FAQ</a></li>
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
		<div class="span9">
			<form method="post" enctype="multipart/form-data" action="" class="well form-inline">
				<input name="{$sessionProgressName}" value="image" type="hidden">
				<input name="MAX_FILE_SIZE" value="{$config.max_size}" type="hidden" />
				<input name="refer" value="" type="hidden" />
				<input name="brand" value="" type="hidden" />
				<fieldset>
					<h1>Bilder upload</h1>
					<p>dummy text</p>
					{if="isset($error)"}
					<div class="alert alert-error fade in">
						<a class="close" data-dismiss="alert" href="#">&times;</a>
						{$error}
					</div>
					{/if}
					<label class="control-label" for="userfile">Bild auswählen</label>
					<input name="userfile" type="file" class="asd" id="userfile" accept="image/bmp, image/gif, image/jpeg, mage/pipeg, image/pjpeg, image/png, image/x-png, image/tiff" multiple="multiple" /><br />
					<div>
						<label for="imgSize" class="select">Bildgröße anpassen:</label>
						<select id="imgSize" name="imgSize">
							<option value="100x100">100x75 (Avatar)</option>
							<option value="150x150">150x112 (Miniatur)</option>
							<option value="320x320">320x240 (für Websites und E-Mail)</option>
							<option value="640x640">640x480 (für Message Boards)</option>
							<option value="800x800" selected="selected">800x600 (15-Zoll-Monitor)</option>
							<option value="1024x1024">1024x768 (17-Zoll-Monitor)</option>
							<option value="1280x1280">1280x1024 (19-Zoll-Monitor)</option>
							<option value="1600x1600">1600x1200 (21-Zoll-Monitor)</option>
							<option value="optimize">Optimieren ohne resize</option>
							<option value="resample">Größe nicht verändern</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary" data-loading-text="Hochladen..." id="submitButton">Hochladen!</button>	
				</fieldset>
			</form>
			<h2>Fortschritt:</h2>
			<div>
				<div class="progress progress-striped active">
					<div id="progress" class="bar" style="width: 0%;"></div>
				</div>
			</div>
			<button class="btn btn-info" data-toggle="collapse" data-target="#fileTypes">Erlaubte Dateitypen</button>
			<div id="fileTypes" class="collapse out">
				<p><b>jpg jpeg png gif bmp tif tiff swf</b> &lt; <b>{function="binary_multiples($config["max_size"], false)"}</b></p>
			</div>
		</div><!--/span-->
	</div><!--/row-->

	<hr>

	<footer>
		<p>&copy; {$config.title}  2012</p>
	</footer>

	</div><!--/.fluid-container-->
	<script type="text/javascript">
	$("form").submit(function()
	{
		$("#submitButton").button('loading');
	});	
	</script>
</body>
</html>