{*
/*
* Script: manage.tpl
* 	User manage template
*
*
* License:
*	 GPL v3 or above
*/
*}
{if $smarty.capture.hook_users_button_add ne ''}
	{$smarty.capture.hook_users_button_add}
{else}
	<div class="si_toolbar si_toolbar_top">
		<a href="index.php?module=user&view=add" class="">
			<img src="images/common/add.png" alt="" />
			{$LANG.user_add}
		</a>
{/if}

{if $number_of_rows.count == 0}

	</div>
	<div class="si_message">{$LANG.no_users}</div>

{else}
	
	{if $smarty.capture.hook_users_grid_top}{$smarty.capture.hook_users_grid_top}{/if}

	</div>
	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl' LANG=$LANG}

	{if $smarty.capture.hook_users_grid_end}{$smarty.capture.hook_users_grid_end}{/if}
	
{/if}