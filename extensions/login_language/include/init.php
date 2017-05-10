<?php

	$llabs = realpath(dirname(__FILE__));
	$llrel = str_replace(dirname($_SERVER['PHP_SELF']), ".", dirname(strstr($llabs, dirname($_SERVER['PHP_SELF'])))). '/';
	$smarty->assign('mlprel', $llrel);
error_log('loading '. $llrel. 'include/init.php');

	$smarty->assign('abc', getLanguageList());
	error_log('done.');
