{*
/*
* Script: extensions/matts_luxury_pack/templates/default/customers/enable.tpl
* 	 Enable a Customer template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

	{if $smarty.capture.hook_customers_enable}
		{$smarty.capture.hook_customers_enable}
	{else}
<meta http-equiv="refresh" content="3;URL=index.php?module=customers&view=manage" />
	{/if}
