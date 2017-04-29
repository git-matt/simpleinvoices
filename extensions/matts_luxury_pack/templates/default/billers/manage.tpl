{*
/*
* Script: extensions/matts_luxury_pack/templates/default/billers/manage.tpl
* 	Grid of Billers template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

	<div class="si_toolbar si_toolbar_top">
{if $smarty.capture.hook_billers_button_add ne ''}
	{$smarty.capture.hook_billers_button_add}
{else}
		<a href="./index.php?module=billers&amp;view=add" class="">
			<img src="./images/famfam/add.png" alt="" />
			{$LANG.add_new_biller}
		</a>
{/if}

{if $number_of_rows.count == 0}

	</div>
	<div class="si_message">{$LANG.no_billers}</div>

{else}

	{if $smarty.capture.hook_billers_grid_top}{$smarty.capture.hook_billers_grid_top}{/if}
	
	</div>
	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl' LANG=$LANG}
	
	{if $smarty.capture.hook_billers_grid_end}{$smarty.capture.hook_billers_grid_end}{/if}

{/if}
