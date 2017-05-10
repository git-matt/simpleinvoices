<?php

if (!isset($anabs))
{
	define('SI_ABSROOT', dirname(dirname(dirname(dirname(__FILE__)))));
//	$smarty->assign('SI_ABSROOT', SI_ABSROOT);
	$anabs = realpath(dirname(__FILE__));
//	$smarty->assign('mlpabs', $anabs);
	$anrel = str_replace(dirname($_SERVER['PHP_SELF']), ".", dirname(strstr($anabs, dirname($_SERVER['PHP_SELF'])))). '/';
	$smarty->assign('anrel', $anrel);
}