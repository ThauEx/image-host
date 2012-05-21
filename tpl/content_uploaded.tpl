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
			<input type="hidden" id="url_image_path" value="{$config.domain}/{$imageName}" />
			<!-- Tags -->
			<input id="sserver" type="hidden" value="{$imageDirInfo.basename}">
			<input id="filename" type="hidden" value="{$imagePathInfo.filename}.{$imagePathInfo.extension}">  

			<!-- Thumb image section -->
  			<div class="userimage-info">
				<div style="width:175px; float:left">
					<div class="main-title" style="margin-bottom:8px">Upload erfolgreich <img src="/static/images/check.png" width="18px" height="13px" /></div>
					<a href="/{$imagePage}/">
						<img width="150px" src="/{$imageThumbName}" style="_float:left"/>
					</a>
				</div>

				<div id="right" class="link" style="_float:left; height:172px; width:250px; overflow:hidden;">
					<div class="main-title">
						<div style="width:250px; word-wrap:break-word;">Name: {$imagePathInfo.filename}.{$imagePathInfo.extension}</div>
						<div>Größe: 82Kb</div>
					</div>
				</div>
  			</div>
 

			<div>
				<div class="main-title">
					Links, um dein Bild anderen zu schicken: 
					<a href="#" id="btnHelp" style="cursor:help" rel="popover" title="Hilfe" data-content="{$config.title} erzeugt für deine Bilder automatisch Links und Code.  Mit diesem Code kannst du auf verschiedene Weise Links zu deinen Dateien herstellen.  Du kannst deine Dateien in Webseiten einbetten oder sie deinen Freunden per E-Mail oder Instant Messenger zeigen.<br /><br />Wenn du diese Links oder Codes verwenden möchtest, klicke in das Codefeld und kopiere den Link-Code mit STRG+C. Der Link-Code befindet sich jetzt im Zwischenspeicher deines Computers, und du kannst ihn überall einfügen. Jetzt kannst du dein Ziel (z. B. ein Messenger-Fenster oder das Eingabefeld eines Forums) öffnen und den Link oder Code dort einfügen.<br /><br />'Link' ist die Zielseite für Bilder und kann in diesem Format leicht per E-Mail oder IM an deine Freunde oder Bekannten geschickt werden.'Direkt' ist der tatsächliche Speicherort des Bildes auf den {$config.title}-Servern.'Kurz' (momentan nur für yfrog...) ist ein über den Kurz-URL-Dienst bit.ly erstellter Kurzlink.">
						<img src="/static/images/help.gif" width="17" height="16" style="vertical-align:middle"/>
					</a>
				</div>
			</div>

			<div class="clear"></div>
			<div id="ImageCodes" style="margin-top:5px">
				<div class="links" style="text-align:left">
					<div id="safari" class="listbox">
						<label for="inputLink"><a href="/{$imagePage}/">Link</a></label>
						<input id="inputLink" onClick="this.select();" readonly="readonly" class="readonly input-xxlarge" value="{$config.domain}/{$imagePage}/"/>
					</div>

					<div class="listbox">
						<label for="inputDirectLink"><a href="#" style="cursor:default;">Direct Link</a></label>
						<input id="inputDirectLink" onClick="this.select();" readonly="readonly" class="readonly input-xxlarge" value="{$config.domain}/{$imageName}" />
					</div> 
				</div>

				<div class="clear"></div>
			</div>

			<div id="LinkCodes" style="margin-top:5px" >
				<div class="links" style="text-align:left">
					<div class="listbox">
						<label>Forum-Code</label>
						<textarea wrap=off onClick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">[URL={$config.domain}/{$imagePage}/][IMG]{$config.domain}/{$imageName}[/IMG][/URL] Uploaded with [URL={$config.domain}]{$config.title}[/URL]</textarea>
					</div>
					<div class="listbox">
					<label>Alt-Forum-Code</label>
					<textarea wrap=off onClick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">[URL={$config.domain}/{$imagePage}/][IMG={$config.domain}/{$imageName}][/IMG][/URL] Uploaded with [URL={$config.domain}]{$config.title}[/URL]</textarea>
					</div>
			
					<div class="listbox">
						<label>HTML-Code</label>
						<textarea wrap=off onClick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">&lt;a target=&#039;_blank&#039; title=&#039;{$config.title} - Image And Video Hosting&#039; href=&#039;{$config.domain}/{$imagePage}/&#039;&gt;&lt;img src=&#039;{$config.domain}/{$imageName}&#039; border=&#039;0&#039;/&gt;&lt;/a&gt;Uploaded with &lt;a target=&#039;_blank&#039; href=&#039;{$config.domain}&#039;&gt;{$config.title}&lt;/a&gt;</textarea>
					</div>
				</div>
				<div class="clear"></div>
			</div>


			<div id="ThumbCodes" style="margin-top:5px" >
				<div class="links" style="text-align:left">

					<div class="listbox">
						<label>Forum-Miniatur</label>
						<textarea wrap=off onClick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">[URL={$config.domain}/{$imagePage}/][IMG]{$config.domain}/{$imageThumbName}[/IMG][/URL] Uploaded with [URL={$config.domain}]{$config.title}[/URL]</textarea>
					</div>

					<div class="listbox">
						<label>Alt-Forum-Miniatur</label>
						<textarea wrap=off onClick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">[URL={$config.domain}/{$imagePage}/][IMG={$config.domain}/{$imageThumbName}][/IMG][/URL] Uploaded with [URL={$config.domain}]{$config.title}[/URL]</textarea>

					</div>
					<div class="listbox">
						<label>HTML-Miniatur</label>
						<textarea wrap="off" onclick="this.select();" readonly="readonly" class="readonly multilinebox input-xxlarge">&lt;a target=&#039;_blank&#039; href=&#039;{$config.domain}/{$imagePage}/&#039;&gt;&lt;img src=&#039;{$config.domain}/{$imageThumbName}&#039; border=&#039;0&#039;/&gt;&lt;/a&gt; Uploaded with &lt;a target=&#039;_blank&#039; href=&#039;{$config.domain}&#039;&gt;{$config.title}&lt;/a&gt;</textarea>
					</div>
				</div>
				<div class="clear"></div>
			</div>

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