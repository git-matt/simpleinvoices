<?php
/*
* Script: extensions/matts_luxury_pack/modules/customers/xml.php
* 	Customers list XML page
*
* Authors:
*	 git0matt@gmail.com
*
* Last edited:
* 	 2016-09-10
*
* License:
*	 GPL v2 or above
*
* Website:
* 	http://www.simpleinvoices.org
 */

global $LANG;

header("Content-type: text/xml");

$start = (isset($_POST['start'])    ) ? $_POST['start']     : "0";
$dir   = (isset($_POST['sortorder'])) ? $_POST['sortorder'] : "ASC";
$sort  = (isset($_POST['sortname']) ) ? $_POST['sortname']  : "name";
$rp    = (isset($_POST['rp'])       ) ? $_POST['rp']        : "25";
$page  = (isset($_POST['page'])     ) ? $_POST['page']      : "1";

$customers = mycustomers::sql('', $start, $dir, $sort, $rp, $page);
$count = mycustomers::sql('count', $start, $dir, $sort, $rp, $page);

$xml  = "";
$xml .= "<rows>";
$xml .= "<page>$page</page>";
$xml .= "<total>$count</total>";

$viewcust = $LANG['view'] . ' ' . $LANG['customer'] . ' ';//Matt
$editcust = $LANG['edit'] . ' ' . $LANG['customer'] . ' ';//Matt
foreach ($customers as $row) {
    $vname = $viewcust . $row['name'];
    $ename = $editcust . $row['name'];
    $image = ($row['enabled'] == 0 ? 'images/common/cross.png' : 'images/common/tick.png');
    $xml .= "<row id='".	$row["CID"].	"' style='background: #ccc'>";
//	$xml .= "<cell><![CDATA[" . htmlentities(print_r($row,true)) . "]]></cell>";
    $xml .=
        "<cell name='links'><![CDATA[
          <a class='index_table' title='$vname' href='index.php?module=customers&view=details&id=". $row["CID"]. "&action=view'>
            <img src='images/common/view.png' class='action' />
          </a>
          <a name='index_table' title='$ename' href='index.php?module=customers&view=details&id=". $row["CID"].	"&action=edit'>
            <img src='images/common/edit.png' class='action' />
          </a>
        ]]></cell>";
    $xml .= "<cell name='CID'><![CDATA[" . $row['CID'] . "]]></cell>";
    $xml .= "<cell name='name'><![CDATA[" . $row['name'] . "]]></cell>";
/**/
	$xml .= "<cell name='street_address'><![CDATA[".	$row['street_address'].	"]]></cell>";//Matt
	$xml .= "<cell name='attention'><![CDATA[".	$row['attention'].	"]]></cell>";//Matt
/**/
    $xml .= "<cell name='customer_total'><![CDATA[" . siLocal::number($row['customer_total']) . "]]></cell>";
    $xml .= "<cell name='paid'><![CDATA[" . siLocal::number($row['paid']) . "]]></cell>";
    $xml .= "<cell name='owing'><![CDATA[" . siLocal::number($row['owing']) . "]]></cell>";
//    $xml .= "<cell name='enabled_img'><![CDATA[<img src='$image' alt='" . $row['enabled_txt'] .
//                                         "' title='" . $row['enabled_txt'] . "' />]]></cell>";
	if ($row['enabled']) {//==$LANG['enabled']
		$xml .= "<cell name='enabled_img'><![CDATA[
				<a id='enabled-".$row['CID']."' data-id='$row[CID]' title='$LANG[enabled]' class='makecdisabled'><img src='images/common/tick.png' alt='tick' /></a>
			]]></cell>";
	} else {
		$xml .= "<cell name='enabled_img'><![CDATA[
				<a id='disabled-".$row['CID']."' data-id='$row[CID]' title='$LANG[disabled]' class='makecenabled'><img src='images/common/cross.png' alt='cross' /></a>
			]]></cell>";
	}
    $xml .= "</row>";
}
$xml .= "</rows>";

echo $xml;
