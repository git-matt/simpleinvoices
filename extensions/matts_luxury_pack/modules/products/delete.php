<?php
/*
* Script: ./extensions/matts_luxury_pack/modules/products/delete.php
* 	Do the deletion of a product
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

#get the product id
$product_id = $_GET['id'];
$product = getProduct($product_id);
$defaults = getSystemDefaults();

$smarty -> assign("product",$product);
$smarty -> assign("defaults",$defaults);

/*If delete is disabled - dont allow people to view this page*/
if ($defaults['delete'] == 'N') {
	die('product deletion has been disabled, you are not supposed to be here');
}

if ( ($_GET['stage'] == 2) && ($_POST['doDelete'] == 'y') ) {
	global $dbh;

	$dbh->beginTransaction();
	$error = false;


	//delete the info from the product table
	if ($error || ! delete('products','id',$product_id)) {
		$error = true;
	} 
	if ($error) {
		$dbh->rollBack();
	} else {
		$dbh->commit();
	}
	//TODO - what about the stuff in the products table for the total style products?
	echo "<meta http-equiv='refresh' content='2;URL=index.php?module=products&view=manage' />";
}

$smarty -> assign('pageActive', 'product');
$smarty -> assign('active_tab', '#money');
