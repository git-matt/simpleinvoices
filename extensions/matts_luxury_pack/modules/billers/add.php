<?php
/*
 *  Script: add.php
 *      Billers add page
 *
 *  Authors:
 *      Justin Kelly, Nicolas Ruflin
 *
 *  Last edited:
 *      2016-07-29
 *
 *  License:
 *      GPL v3 or above
 *
 *  Website:
 *      http://www.simpleinvoices.org
 */
global $smarty;

checkLogin();

$files = getLogoList();
$smarty->assign("files", $files);

$customFieldLabel = getCustomFieldLabels('',true);

if (!empty($_POST['name'])) {
    include ("./modules/billers/save.php");
}

$smarty->assign('files', $files);
$smarty->assign('customFieldLabel', $customFieldLabel);

$smarty->assign('pageActive', 'biller');
$smarty->assign('subPageActive', 'biller_add');
$smarty->assign('active_tab', '#people');
/*********************/
$handle 	= opendir("./templates/invoices/");
$files 		= array();
while ($template = readdir($handle)) {
	if ($template != ".."           &&
		$template != "."            &&
		$template != "logos"        &&
		$template != ".svn"         &&
		$template != "template.php" &&
		$template != "template.php~") {
		$files[] = $template;
	}
}
closedir($handle);
//$tmpls = sort($files);
$smarty->assign('tmpls', $files);
