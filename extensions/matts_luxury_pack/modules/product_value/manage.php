<?php

//stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();

$pageActive = "product_values";
$smarty->assign('pageActive', $pageActive);
$smarty->assign('active_tab', '#product');
//$smarty->assign("mod_dir", substr(si_web_path (dirname(dirname(__FILE__))), 2). '/'. $module);
