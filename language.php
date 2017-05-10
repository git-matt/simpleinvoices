<?php

global $LANG;
$id = isset($_REQUEST['lang']) ? $_REQUEST['lang'] : 'en_US';
include_once ('include/language.php');
$LANG = getLanguageArray($id);
?>
<!DOCTYPE html>
<html>
<head></head>
<body>
	<form action="index.php?module=auth&amp;view=login" id="frmLanguage" method="POST">
		<input type="hidden" name="lang" value="<?=$id?>" />
	</form>
<script>
	document.getElementById('frmLanguage').submit();
</script>
</body>
</html>