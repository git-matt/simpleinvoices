{*debug*}
{*
/*
* Script: extensions/matts_luxury_pack/templates/default/customers/manage.tpl
* 	 Grid of Customers template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

	<div class="si_toolbar si_toolbar_top">
{if $smarty.capture.hook_customers_button_add ne ''}
	{$smarty.capture.hook_customers_button_add}
{else}
		<a href="./index.php?module=customers&amp;view=add" class="add">
			<img src="./images/famfam/add.png" alt="add" />
			{$LANG.customer_add}
		</a>
{/if}
 
{if $number_of_customers == 0}
	</div>
	<div class="si_message">
		{$LANG.no_customers}
	</div>

{else}

{if $smarty.capture.hook_customers_grid_top}{$smarty.capture.hook_customers_grid_top}{/if}
	</div>
	<!--br /-->
	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:"manage.js.tpl"}
{if $smarty.capture.hook_customers_grid_end}{$smarty.capture.hook_customers_grid_end}{/if}
{/if}
