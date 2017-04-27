{*
/*
 * Script: ./extensions/matts_luxury_pack/templates/default/customers/manage.tpl
 * 	Customer manage template
 *
 * Authors:
 *	 yumatechnical@gmail.com
 *
 * Last edited:
 * 	 2016-08-31
 *
 * License:
 *	 GPL v2 or above
 *
 * Website:
 * 	http://www.simpleinvoices.org
 */
*}

	<div class="si_toolbar si_toolbar_top">
		<a href="./index.php?module=customers&amp;view=add" class="add">
			<img src="./images/famfam/add.png" alt="add" />
			{$LANG.customer_add}
		</a>
 
{if $number_of_customers == 0}
	</div>
	<div class="si_message">
		{$LANG.no_customers}
	</div>

{else}

{if $smarty.capture.hook_customers_grid_table_top}{$smarty.capture.hook_customers_grid_table_top}{/if}
	</div>
	<!--br /-->
	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:"manage.js.tpl"}
{if $smarty.capture.hook_customers_grid_table_end}{$smarty.capture.hook_customers_grid_table_end}{/if}
{/if}
