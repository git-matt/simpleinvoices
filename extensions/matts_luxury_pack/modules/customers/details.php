<?php
/*
* Script: ./extensions/matts_luxury_pack/modules/customers/details.php
* 	Customers details page
*
* Authors:
*	 yumatechnical@gmail.com
*
* Last edited:
* 	 2016-08-29
*
* License:
*	 GPL v2 or above
*
* Website:
* 	http://www.simpleinvoices.org
 */
global $smarty, $LANG, $pdoDb, $config;
global $cc_months, $cc_years;//Matt

//stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();

// @formatter:off
$cid = $_GET['id'];
$domain_id = domain_id::get();

$pdoDb->addSimpleWhere("id", $cid, "AND");
$pdoDb->addSimpleWhere("domain_id", $domain_id);
$rows = $pdoDb->request("SELECT", "customers");
if (!isset($rows[0]))		return false;
$customer = $rows[0];
$customer['wording_for_enabled'] = ($customer['enabled'] == ENABLED ? $LANG['enabled'] : $LANG['disabled']);
if (empty($customer['credit_card_number'])) {
    $customer['credit_card_number_masked'] = "";
} else {
    try {
        $key = $config->encryption->default->key;
        $enc = new Encryption();
        $credit_card_number = $enc->decrypt($key, $customer['credit_card_number']);
        $customer['credit_card_number_masked'] = maskValue($credit_card_number);
    } catch (Exception $e) {
        throw new Exception("details.php - Unable to decrypt credit card for Customer, " .
                            $cid . ". " . $e->getMessage());
    }
}
$invoices = Customer::getCustomerInvoices($cid);

$stuff = array();
$stuff['total'] = Customer::calc_customer_total($customer['id'], true);
$stuff['paid']  = Payment::calc_customer_paid( $customer['id'], true);
$stuff['owing'] = $stuff['total'] - $stuff['paid'];

$customFieldLabel = getCustomFieldLabels('',true);

$dir    =  "DESC";
$sort   =  "id";
//$having = "money_owed";
$rp     = (isset($_POST['rp'])       ? $_POST['rp']       : "25");
$page   = (isset($_POST['page'])     ? $_POST['page']     : "1");
$query  = (isset($_REQUEST['query']) ? $_REQUEST['query'] : "");
$qtype  = (isset($_REQUEST['qtype']) ? $_REQUEST['qtype'] : "");

$type = (getDefaultLargeDataset() == $LANG['enabled'] ? "count" : "");

$pdoDb->setHavings(Invoice::buildHavings("money_owed"));

$invoices_owing = Invoice::select_all($type, $sort, $dir, $rp, $page, $query, $qtype);
$subPageActive  = ($_GET['action'] == "view"  ? "customer_view" : "customer_edit");

$smarty->assign("stuff"           , $stuff);
$smarty->assign('customer'        , $customer);
$smarty->assign('invoices'        , $invoices);
$smarty->assign('invoices_owing'  , $invoices_owing);
$smarty->assign('customFieldLabel', $customFieldLabel);
$smarty->assign('pageActive'      , 'customer');
$smarty->assign('subPageActive'   , $subPageActive);
$smarty->assign('active_tab'      , '#people');
$smarty->assign('cc_months', $cc_months);//Matt
$smarty->assign('cc_years', $cc_years);//Matt
// @formatter:on






/*
$invoice_owing = new invoice();
$invoice_owing->sort       = $sort;
$invoice_owing->having_and = "real";
$invoice_owing->query      = (isset($_REQUEST['query']) ? $_REQUEST['query'] : "");
$invoice_owing->qtype      = (isset($_REQUEST['qtype']) ? $_REQUEST['qtype'] : "");

$large_dataset = getDefaultLargeDataset();
if($large_dataset == $LANG['enabled']) {
  $sth = $invoice_owing->select_all('large_count', $dir, $rp, $page, $having);
} else {
  $sth = $invoice_owing->select_all('', $dir, $rp, $page, $having);
}

$invoices_owing = $sth->fetchAll(PDO::FETCH_ASSOC);
if (isset($_GET['action']))
	$subPageActive  = ($_GET['action'] == "view"  ? "customer_view" : "customer_edit");
*/
// @formatter:on
