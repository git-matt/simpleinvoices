{*
/*
 * Script: /simple/extensions/matts_luxury_pack/templates/default/payments/manage.tpl
 * 	 Payments manage template
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

{*assign var=pos value=$smarty.template|strrpos:'/'}
{assign var=inc value=$smarty.template|substr:0:$pos*}

	<div class="si_toolbar si_toolbar_top">
		<a href="./index.php?module=payments&amp;view=process&amp;op=pay_invoice" class="process"><img src="./images/famfam/add.png" alt="add"/>{$LANG.process_payment}</a>

		<span style="float: right;">
			<span class="si_filters_title">{$LANG.rows_per_page}:</span>
			<select id="selectrp" name="rp" onchange="location.href+='&amp;rp='+this.value">{*./index.php?module=payments&amp;view=manage*}
{foreach from=$array item=v}
				<option value="{$v}"{if isset($smarty.get.rp) && $smarty.get.rp==$v || (isset($smarty.get.rp) && $smarty.get.rp=='' && isset($defaults.default_nrows) && $defaults.default_nrows==$v)} selected="selected"{/if}>{$v}</option>
{/foreach}
			</select>
		</span>
 
{if isset($smarty.get.id) && $smarty.get.id}
		<a href="./index.php?module=payments&amp;view=process&amp;id={$smarty.get.id|urlencode}&amp;op=pay_selected_invoice" class=""><img src="./images/famfam/money.png" alt=""/>{$LANG.payments_filtered_invoice}</a>
	</div>

{if $payments == null}
	<div class="si_message">
		{$LANG.no_payments_invoice}
	</div>        		
{else}
	<table id="manageGrid" style="display:none"></table>
{*include file='../modules/payments/manage.js.php' get=$smarty.get*}
{*include file=$inc|cat:"/../../../templates/default/payments/manage.js.php"*}
{include file=$path|cat:"manage.js.tpl"}
{*include file='../extensions/payment_rows_per_page/templates/default/payments/manage.js.php'*}
{/if}

{elseif isset($smarty.get.c_id) && $smarty.get.c_id}
	</div>

{if $payments == null}
	<div class="si_message">
		{$LANG.no_payments_customer}
	</div>        		
{else}
	<table id="manageGrid" style="display:none"></table>
{*include file='../modules/payments/manage.js.php' get=$smarty.get*}
{*include file=$inc|cat:"/../../../templates/default/payments/manage.js.php"*}
{include file=$path|cat:"manage.js.tpl"}
{*include file='../extensions/payment_rows_per_page/templates/default/payments/manage.js.php'*}
{/if}

{else}
	</div>

{if $payments == null}
	<div class="si_message">
		{$LANG.no_payments}
	</div>        		
{else}
	<table id="manageGrid" style="display:none"></table>
{*include file='../modules/payments/manage.js.php' get=$smarty.get*}
{*include file=$inc|cat:"/../../../templates/default/payments/manage.js.php"*}
{include file=$path|cat:"manage.js.tpl"}
{*include file='../extensions/payment_rows_per_page/templates/default/payments/manage.js.php'*}
{/if}

{/if}

	<div class="si_help_div">
		<a class="cluetip" href="#" rel="index.php?module=documentation&amp;view=view&amp;page=help_wheres_the_edit_button" title="{$LANG.wheres_the_edit_button}"><img src="./images/common/help-small.png" alt="help" />{$LANG.wheres_the_edit_button}<!--Where's the Edit button?--></a>
	</div>
