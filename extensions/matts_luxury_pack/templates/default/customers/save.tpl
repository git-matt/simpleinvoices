{*
/*
* Script: extensions/matts_luxury_pack/templates/default/customers/save.tpl
* 	 Save a Customer template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

{if $saved == true}
	{if $smarty.capture.hook_customers_save_saved}
		{$smarty.capture.hook_customers_save_saved}
	{else}
	<div class="si_message_ok">{$LANG.saved_customer}<br />{$LANG.redirect_customers}</div>
	{/if}
{else}
	{if $smarty.capture.hook_customers_save_notsaved}
		{$smarty.capture.hook_customers_save_notsaved}
	{else}
	<div class="si_message_error">{$LANG.save_customer_failure}<br />{$LANG.redirect_customers}</div>
	{/if}
{/if}

	{if $smarty.capture.hook_customers_save_after}
		{$smarty.capture.hook_customers_save_after}
	{else}
{if $smarty.post.cancel == null}
	{if $smarty.capture.hook_customers_save_after_nocancel}
		{$smarty.capture.hook_customers_save_after_nocancel}
	{else}
	<meta http-equiv="refresh" content="2;URL=index.php?module=customers&view=manage" />
	{/if}
{else}
	{if $smarty.capture.hook_customers_save_after_cancel}
		{$smarty.capture.hook_customers_save_after_cancel}
	{else}
	<meta http-equiv="refresh" content="0;URL=index.php?module=customers&view=manage" />
	{/if}
{/if}
	{/if}
