<?php


if($_GET['id'])
{
	//sleep(2);
	$sql = sprintf('SELECT * FROM si_products WHERE id = %d LIMIT 1', $_GET['id']);
	$states = dbQuery($sql);
	$output = '';
	if($states->rowCount() > 0)
	{	
		$row = $states->fetch();

	//	print_r($row);
	//		$output .= '<input id="state" class="field select two-third addr" value="'.$row['unit_price'].'"/>';
			/*Format with decimal places with precision as defined in config.ini*/
			$output .= siLocal::number_formatted($row['unit_price']);
	//		$output .= $_POST['id'];
		
	}
	else
	{
		$output .= '';
	}
	echo $output;
	
	exit();
} else {

echo "";
}

// Perform teh Queries!
$sql = 'SELECT * FROM si_products';
$country = mysqlQuery($sql) or die('Query Failed:' . mysql_error());


?>