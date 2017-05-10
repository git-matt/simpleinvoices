{*
/*
 * Script: ./extensions/matts_luxury_pack/templates/default/products/manage.tpl
 * 	Products manage template
 *
 * Authors:
 *	 yumatechnical@gmail.com
 *
 * Last edited:
 * 	 2016-08-31
 *
 * License:
 *	 GPL v2 or above
 *
 * Website:
 * 	http://www.simpleinvoices.org
 */
*}
<!--./extensions/matts_luxury_pack/templates/default/products/manage.tpl-->
	<div class="si_toolbar si_toolbar_top">
		<a href="./index.php?module=products&amp;view=add" class="">
			<img src="./images/famfam/add.png" alt="add product button" />
			{$LANG.add_new_product}
		</a>

{if $number_of_rows == 0}

	</div>
	<div class="si_message">{$LANG.no_products}</div>

{else}

		<span style="float: right;">
			<span class="si_filters_title">{$LANG.rows_per_page}:</span>
			<select id="selectrp" name="rp" onchange="location.href+='&amp;rp='+this.value">{*./index.php?module=products&amp;view=manage*}
{foreach from=$array item=v}
				<option value="{$v}"{if $smarty.get.rp==$v || ($smarty.get.rp=='' && $defaults.default_nrows==$v)} selected="selected"{/if}>{$v}</option>
{/foreach}
			</select>
		</span>
	</div>

	<table id="manageGrid" style="display:none"></table>
{*assign var=pos value=$smarty.template|strrpos:'/'}
{assign var=inc value=$smarty.template|substr:0:$pos}
{include file=$inc|cat:"/manage.js.php"*}
{include file=$path|cat:"manage.js.tpl"}
{*include file=$here|cat:"/manage.js.php"}<!--include file={$here|cat:"/manage.js.php"}-->*}
{*include file=$inc|cat:"/../../../modules/products/manage.js.php"*}
{*include file='../extensions/product_add_LxWxH_weight/templates/default/products/manage.js.php'*}
	{*include file='../modules/products/manage.js.php'*}

<script type="text/javascript"><!--{literal}
//	var len = '{/literal}{$LANG.makepenabled}{literal}';
//	var ldis = '{/literal}{$LANG.makepdisabled}{literal}';
//	var img_tick = '<img src="images/common/tick.png" alt="tick" />';
//	var img_cross = '<img src="images/common/cross.png" alt="cross" />';
	$('.makepdisabled').livequery('click',function () {
//		var id = $(this).attr("data-id");
/*		$.ajax({
			type: 'GET',
			url: './index.php?module=products&view=disable&id='+id,
			data: "id: "+id,
			dataType: "json",
			success: function(data){
			}
		});*/
//		this.className = 'makepenabled';
//		this.title = len;
//		this.innerHTML = img_cross;
alert('works!');
	});
	$('.makepenabled').livequery('click',function () {
//		var id = $(this).attr("data-id");
/*		$.ajax({
			type: 'GET',
			url: './index.php?module=products&view=enable&id='+id,
			data: "id: "+id,
			dataType: "json",
			success: function(data){
			}
		});*/
//		this.className = 'makepdisabled';
//		this.title = ldis;
//		this.innerHTML = img_tick;
alert('works!');
	});
//--></script>{/literal}
{/if}
