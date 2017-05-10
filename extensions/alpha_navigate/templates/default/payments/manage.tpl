{*
/*
* Script: manage.tpl
* 	 Payments manage template
*
*
* Last edited:
* 	 2008-09-01
*
* License:
*	 GPL v3 or above
*
* Website:
*	http://www.simpleinvoices.org
*/
*}

{if $smarty.capture.hook_payments_button_pay ne ''}
	{$smarty.capture.hook_payments_button_pay}
{else}
	<div class="si_toolbar si_toolbar_top">
		<a href="index.php?module=payments&amp;view=process&amp;op=pay_invoice" class="">
			<img src="images/famfam/add.png" alt=""/>
			{$LANG.process_payment}
		</a>
{/if}
 
{if $smarty.get.id}
	{if $smarty.capture.hook_payments_button_pay_selected ne ''}
		{$smarty.capture.hook_payments_button_pay_selected}
	{else}
		<a href="index.php?module=payments&amp;view=process&amp;id={$smarty.get.id|urlencode}&amp;op=pay_selected_invoice" class="">
			<img src="images/famfam/money.png" alt=""/>{$LANG.payments_filtered_invoice}</a>
	</div>
	{/if}
        
	{if $payments == null}
	<div class="si_message">
		{$LANG.no_payments_invoice}
	</div>
	{/if}}        		

{elseif $smarty.get.c_id }

	</div>

	{if $payments == null}
		<div class="si_message">
			{$LANG.no_payments_customer}
		</div>        		
	{/if}

{else}

	</div>

	{if $payments == null}
		<div class="si_message">
			{$LANG.no_payments}
		</div>        		
	{/if}

{/if}

{if isset($payments) && $payments}

	{if $smarty.capture.hook_payments_grid_top}{$smarty.capture.hook_payments_grid_top}{/if}

	<table id="manageGrid" style="display:none"></table>
	{include file=$path|cat:'manage.js.tpl' get=$smarty.get}

	{if $smarty.capture.hook_payments_grid_top}{$smarty.capture.hook_payments_grid_top}{/if}

{/if}

	<div class="si_help_div">
		<a class="cluetip" href="#" rel="index.php?module=documentation&amp;view=view&amp;page=help_wheres_the_edit_button" title="{$LANG.wheres_the_edit_button}">
			<img src="{$help_image_path}help-small.png" alt="" /> Wheres the Edit button?</a>
	</div>
