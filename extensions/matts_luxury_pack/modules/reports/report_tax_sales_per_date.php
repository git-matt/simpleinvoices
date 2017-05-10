<?php
/*
* Script: ./extensions/matts_luxury_pack/modules/reports/report_tax_sales_per_date.php
* 	Report for tax of sales page
*
* Authors:
*	 git0matt@gmail.com
*
* Last edited:
* 	 2016-09-14
*
* License:
*	 GPL v2 or above
*
* Website:
* 	http://www.simpleinvoices.org
 */

//stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();

global $mons, $defaults, $months;
$LANG['sales_tax'] = 'Sales Tax';
// @formatter:off
$start_date = isset($_POST['start_date']) 	? 	$_POST['start_date'] 	: 	date("Y-m-d",strtotime("-1 year"));//.strtotime("-1 day"));
$end_date = isset($_POST['end_date']) 		? 	$_POST['end_date'] 		: 	date("Y-m-d");
$sql = 'SET SQL_BIG_SELECTS =1;';
$sth = dbQuery($sql);
//error_log($sql);
$sql = 'SELECT ';
$sql.= '	year( iv.date ) AS iyear, ';
$sql.= '	month( iv.date ) AS imonth, ';
$sql.= '	day( iv.date ) AS iday, ';
$sql.= '	iv.date, ';
$sql.= '	p.description, ';
$sql.= '	p.custom_field1 AS category, ';
$sql.= '	ii.gross_total, ';
$sql.= '	it.tax_amount, ';
$sql.= '	(ii.gross_total + it.tax_amount) AS Total ';
$sql.= 'FROM	'.TB_PREFIX.'invoice_items ii ';
$sql.= 'LEFT OUTER JOIN	'.TB_PREFIX.'invoices iv ';
$sql.= '	ON iv.id 	= ii.invoice_id ';
$sql.= 'LEFT OUTER JOIN '.TB_PREFIX.'invoice_item_tax it ';
$sql.= '	ON ii.id 	= it.invoice_item_id ';
$sql.= 'LEFT OUTER JOIN '.TB_PREFIX.'products p ';
$sql.= '	ON p.id 	= ii.product_id ';
$sql.= 'WHERE 1 ';
//$sql.= '	AND iv.date > '. $start_date. ' AND i.date < '. $end_date. ' ';
$sql.= '	AND iv.date BETWEEN \''. $start_date. '\' AND \''. $end_date. '\' ';
$sql.= '	AND iv.domain_id = '. $auth_session->domain_id. ' ';
//$pdoDb->addSimpleWhere('iv.domain_id', domain_id::get(), 'AND');
$sql.= '	AND ii.domain_id = '. $auth_session->domain_id. ' ';
//$pdoDb->addSimpleWhere('ii.domain_id', domain_id::get(), 'AND');
$sql.= '	AND p.domain_id = '. $auth_session->domain_id. ' ';
//$pdoDb->addSimpleWhere('p.domain_id', domain_id::get(), 'AND');
$sql.= 'ORDER BY iv.date ASC';
//$data = $pdoDb->request("SELECT", "invoice_items ii");
error_log($sql);
$sth = dbQuery($sql);
$data = $sth->fetchAll();
$smarty->assign('start_date', 		$start_date);
$smarty->assign('end_date', 		$end_date);
//error_log(print_r($data,true));
$smarty->assign('months_short',		$mons);
$smarty->assign('months', 			$months);
//error_log('mons:'. print_r($months,true));
$smarty->assign('data', 			$data);
$smarty->assign('usenumeric', 		isset($_POST['usenumeric']) 	? 	$_POST['usenumeric'] 	:	 false);
$smarty->assign('monthtotals', 		isset($_POST['monthtotals']) 	? 	$_POST['monthtotals'] 	:	 true);
$smarty->assign('yeartotals', 		isset($_POST['yeartotals']) 	? 	$_POST['yeartotals'] 	:	 true);
$smarty->assign('pageActive', 		'report');
//$smarty->assign('subPageActive', 	$subPageActive);
$smarty->assign('active_tab', 		'#home');
// @formatter:on
