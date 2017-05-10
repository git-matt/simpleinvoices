{*
 * Script: manage.tpl
 *      Products manage template
 *
 * License:
 *     GPL v3 or above
 *}
{if $smarty.capture.hook_products_button_add ne ''}
	{$smarty.capture.hook_products_button_add}
{else}

<div class="si_toolbar si_toolbar_top">
  <a href="index.php?module=products&view=add" class="">
    <img src="images/famfam/add.png" alt=""/>
    {$LANG.add_new_product}
  </a>
</div>

{/if}

{if $number_of_rows == 0 }

	<div class="si_message">{$LANG.no_products}</div>

{else}

	{if $smarty.capture.hook_products_grid_top}{$smarty.capture.hook_products_grid_top}{/if}

	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl'}

	{if $smarty.capture.hook_products_grid_end}{$smarty.capture.hook_products_grid_end}{/if}

{/if}
