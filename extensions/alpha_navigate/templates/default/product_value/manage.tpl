{*
/*
* Script: manage.tpl
* 	 Invoice Product Values manage template
*
* License:
*	 GPL v3 or above
*/
*}
{if $smarty.capture.hook_product_value_button_add ne ''}
	{$smarty.capture.hook_product_value_button_add}
{else}

<div class="si_toolbar si_toolbar_top">
  <a href="index.php?module=product_value&view=add" class="">
    <img src="images/common/add.png" alt="" />
    {$LANG.add_product_value}
  </a>
</div>

{/if}

{if $number_of_rows == 0}

  <div class="si_message">There are no product value records.  Click the 'Add Product Value' button above to create one</div>

{else}

	{if $smarty.capture.hook_product_value_grid_top}{$smarty.capture.hook_product_value_grid_top}{/if}

  <table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl'}

	{if $smarty.capture.hook_product_value_grid_end}{$smarty.capture.hook_product_value_grid_end}{/if}

{/if}
