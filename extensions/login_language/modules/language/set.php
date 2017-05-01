<?php

$id = isset($_GET['id']) ? $_GET['id'] : 'en_US';
$smarty->assign('languagechange', $id);
getLanguageArray($id);
