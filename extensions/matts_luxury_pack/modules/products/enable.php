<?php
/*
* Script: ./extensions/matts_luxury_pack/modules/products/enable.php
* 	enable/disable Product page
*
* Authors:
*	 yumatechnical@gmail.com
*
* Last edited:
* 	 2016-08-30
*
* License:
*	 GPL v2 or above
*
* Website:
* 	http://www.simpleinvoices.org
 */
//stop the direct browsing to this file - let index.php handle which files get displayed
checkLogin();
myproduct::enable();

