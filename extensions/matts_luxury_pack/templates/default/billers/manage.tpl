{*
/*
* Script: manage.tpl
* 	Biller manage template
*
*
* License:
*	 GPL v3 or above
*/
*}
	<div class="si_toolbar si_toolbar_top">
            <a href="./index.php?module=billers&amp;view=add" class="">
                <img src="./images/famfam/add.png" alt="" />
                {$LANG.add_new_biller}
            </a>

{if $number_of_rows.count == 0}

	</div>
	<div class="si_message">{$LANG.no_billers}</div>

{else}

{if $smarty.capture.hook_billers_grid_table_top}{$smarty.capture.hook_billers_grid_table_top}{/if}
	</div>
	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl' LANG=$LANG}
{if $smarty.capture.hook_billers_grid_table_end}{$smarty.capture.hook_billers_grid_table_end}{/if}

{/if}
