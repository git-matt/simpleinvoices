{*
/*
 * Script: ./extensions/matts_luxury_pack/templates/default/hooks.tpl
 * 	Put code into sections via code hooks
 *
 * Authors:
 *	git0matt@gmail.com
 *
 * Last edited:
 * 	2017-04-26
 *
 * License:
 *	GPL v2 or above
 *
 * Website:
 * 	http://www.simpleinvoices.org
 */
*}
{strip}

{*common captures*}

{/strip}{capture name="table_top"}
			<span class="si_filters_title">{$LANG.rows_per_page}:</span>
			<script>
			function change_rp(rp){literal}
			{
				var loc = location.href;
				if (loc[loc.length-1]=='/')
				{
					location.href = '{/literal}{$smarty.server.PHP_SELF|cat:'?module='|cat:$module|cat:'&view=manage&rp='}{literal}' + rp;
				} else
				{
					location.href += '&rp='+ rp;
				}
			}
			</script>{/literal}
			<select id="selectrp" name="rp" onchange="change_rp(this.value){*location.href+='&amp;rp='+this.value*}">{*./index.php?module=customers&amp;view=manage*}
	{foreach from=$pagerows item=v}
				<option value="{$v}"{if $smarty.get.rp==$v || ($smarty.get.rp=='' && $defaults.default_nrows==$v)} selected="selected"{/if}>{$v}</option>
	{/foreach}
			</select>
{/capture}{strip}


{/strip}{capture name="table_end"}
<script type="text/javascript"><!--{literal}
	var img_tick = '<img src="images/common/tick.png" alt="tick" />';
	var img_cross = '<img src="images/common/cross.png" alt="cross" />';
/*	$('.makecenabled').livequery('load',function () {
	});*/
	$('.makecdisabled').livequery('click',function () {
		var id = $(this).attr("data-id");
		$.ajax({
			type: 'GET',
			url: '{/literal}{$disable_url_with_id}{literal}'+id,
			data: "id: "+id,
			dataType: "json",
			success: function(data){
			}
		});
//		this.parentNode.parentNode.parentNode.style.background = '#ccc";
		this.className = 'makecenabled';
/*		this.title = len;*/
		this.innerHTML = img_cross;
	});
	$('.makecenabled').livequery('click',function () {
		var id = $(this).attr("data-id");
		$.ajax({
			type: 'GET',
			url: '{/literal}{$enable_url_with_id}{literal}'+id,
			data: "id: "+id,
			dataType: "json",
			success: function(data){
			}
		});
		this.className = 'makecdisabled';
/*		this.title = ldis;*/
		this.innerHTML = img_tick;
	});
//--></script>{/literal}
{/capture}{strip}


{*include other hooks*}

{assign var=inc value=$mlprel|substr:2|cat:'templates/default/'}
{/strip}
{if file_exists($inc|cat:'auth/hooks.tpl')}{include file=$inc|cat:'auth/hooks.tpl'}{/if}
{if file_exists($inc|cat:'billers/hooks.tpl')}{include file=$inc|cat:'billers/hooks.tpl'}{/if}
{if file_exists($inc|cat:'customers/hooks.tpl')}{include file=$inc|cat:'customers/hooks.tpl'}{/if}
{if file_exists($inc|cat:'index/hooks.tpl')}{include file=$inc|cat:'index/hooks.tpl'}{/if}
{if file_exists($inc|cat:'invoices/hooks.tpl')}{include file=$inc|cat:'invoices/hooks.tpl'}{/if}
{if file_exists($inc|cat:'products/hooks.tpl')}{include file=$inc|cat:'products/hooks.tpl'}{/if}
{if file_exists($inc|cat:'user/hooks.tpl')}{include file=$inc|cat:'user/hooks.tpl'}{/if}
{strip}

{/strip}
