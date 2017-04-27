<?php
/*
* Script: ./extensions/matts_luxury_pack/modules/customers/delete.php
* 	Do the deletion of a customer
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

#get the customer id
$customer_id = $_GET['id'];
$customer = getCustomer($customer_id);
$defaults = getSystemDefaults();

$smarty -> assign("customer",$customer);
$smarty -> assign("defaults",$defaults);

/*If delete is disabled - dont allow people to view this page*/
if ($defaults['delete'] == 'N') {
	die('customer deletion has been disabled, you are not supposed to be here');
}

if ( ($_GET['stage'] == 2) && ($_POST['doDelete'] == 'y') ) {
	global $dbh;

	$dbh->beginTransaction();
	$error = false;


	//delete the info from the customer table
	if ($error || ! delete('customers','id',$customer_id)) {
		$error = true;
	} 
	if ($error) {
		$dbh->rollBack();
	} else {
		$dbh->commit();
	}
	//TODO - what about the stuff in the customers table for the total style customers?
	echo "<meta http-equiv='refresh' content='2;URL=index.php?module=customers&view=manage' />";
}

$smarty -> assign('pageActive', 'customer');
$smarty -> assign('active_tab', '#money');
