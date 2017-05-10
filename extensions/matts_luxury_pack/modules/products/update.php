<?php

$domain_id = domain_id::get();
//$sql = "UPDATE ". TB_PREFIX. "products SET unit_price = ':unit_price' WHERE id = :id AND domain_id = :domain_id";
$sql = "UPDATE ". TB_PREFIX. "products SET unit_price = '". $_REQUEST['unit_price']. "' WHERE id = ". $_REQUEST['val']. " AND domain_id = $domain_id";
error_log($sql);
dbQuery($sql);
//$sth = dbQuery($sql, ':unit_price', $_REQUEST['unit_price'], ':id', $_REQUEST['val'], ':domain_id', $domain_id);
//$pt = $sth->fetch();
//error_log(print_r($sth,true));
exit();
//UPDATE `si_products` SET `unit_price` = '31' WHERE `id` =41 AND `domain_id` =1 LIMIT 1 ;