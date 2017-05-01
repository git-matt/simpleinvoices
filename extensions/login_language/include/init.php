<?php

	$llabs = realpath(dirname(__FILE__));
//	$smarty->assign('mlpabs', $llabs);
	$llrel = str_replace(dirname($_SERVER['PHP_SELF']), ".", dirname(strstr($llabs, dirname($_SERVER['PHP_SELF'])))). '/';
//	$smarty->assign('mlprel', $llrel);
error_log('loading '. $llrel. 'include/init.php');

	$smarty->assign('abc', getLanguageList());
	error_log('done.');
/*		$dir = opendir('lang');
		$list = array();
		while($file = readdir($dir))
			if ($file[0] != '.')// && is_dir($file))
			{
				$inner = "lang/$file/info.xml";
				if (file_exists($inner))
				{
					$xml = simplexml_load_file($inner);
					$list[] = array('code' => $file, 'name' => $xml->name, 'longname' => $xml->englishname, 'img' => $xml->img);
				}
			}
		closedir($dir);
	$smarty->assign('langlist', $list);
*/
