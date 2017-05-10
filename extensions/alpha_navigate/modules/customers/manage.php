<?php

if (isset($_REQUEST['pick2nd']) && $_REQUEST['pick2nd'])
{
	$query = $_REQUEST['pick2nd'];
	$smarty->assign('pick2nd', $query);
}
else
{
	$pickfrom = array('0-9', 'ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQRS', 'TUV', 'WXYZ');
	if (!isset($_REQUEST['pick1st']))
	{
		$smarty->assign('pickfrom', $pickfrom);
	}
	else
	{
		if (isset($_REQUEST['pickfrom']))
		{
			$pickfrom = $_REQUEST['pickfrom'];
		}
		//$smarty->assign('pick1st', $pickfrom);
/*		if ($_REQUEST['pick1st'])
		{*/
			$pick1st = $_REQUEST['pick1st'];
			$smarty->assign('pick1st', $pick1st);
			$output = str_split($pick1st);
			$smarty->assign('pickfrom', $output);
/*		}*/
	}
}
