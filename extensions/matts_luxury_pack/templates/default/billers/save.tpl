{*
/*
* Script: extensions/matts_luxury_pack/templates/default/billers/save.tpl
* 	 Save a Biller template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

{if $saved == true}
	{if $smarty.capture.hook_biller_save_saved}
		{$smarty.capture.hook_biller_save_saved}
	{else}
	<div class="si_message_ok">{$LANG.save_biller_success}</div>
	{/if}
{else}
	{if $smarty.capture.hook_biller_save_notsaved}
		{$smarty.capture.hook_biller_save_notsaved}
	{else}
	<div class="si_message_error">{$LANG.save_biller_failure}</div>
	{/if}
{/if}

{if $smarty.post.cancel == null}
	{if $smarty.capture.hook_biller_save_after_nocancel}
		{$smarty.capture.hook_biller_save_after_nocancel}
	{else}
	<meta http-equiv="refresh" content="2;URL=index.php?module=billers&amp;view=manage" />
	{/if}
{else}
	{if $smarty.capture.hook_biller_save_after_cancel}
		{$smarty.capture.hook_biller_save_after_cancel}
	{else}
	<meta http-equiv="refresh" content="0;URL=index.php?module=billers&amp;view=manage" />
	{/if}
{/if}
