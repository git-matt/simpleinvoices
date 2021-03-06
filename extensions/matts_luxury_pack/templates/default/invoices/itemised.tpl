{*
/*
* Script: /simple/extensions/invoice_add_display_no/templates/default/invoices/itemised.tpl
* 	 Itemised invoice template
*
* License:
*	 GPL v3 or above
*
* Website:
*	http://www.simpleinvoices.org
*/
*}
<form name="frmpost" action="index.php?module=invoices&amp;view=save" method="post" onsubmit="return frmpost_Validator(this)">

{$smarty.capture.hook_loading}

{if $first_run_wizard == true}

	<div class="si_message">
		{$LANG.before_starting}
	</div>

	<table class="buttons" align="center">

{if $billers == null}
		<tr>
			<th>{$LANG.setup_as_biller}</th>
			<td>
				<a href="./index.php?module=billers&amp;view=add" class="positive"><img src="./images/common/user_add.png" alt="add" />{$LANG.add_new_biller}</a>
			</td>
        </tr>
{/if}

{if $customers == null}
		<tr>
			<th>{$LANG.setup_add_customer}</th>
			<td>
				<a href="./index.php?module=customers&amp;view=add" class="positive"><img src="./images/common/vcard_add.png" alt="vcard" />{$LANG.customer_add}</a>
			</td>
		</tr>
{/if}

{if $products == null}
		<tr>
			<th>{$LANG.setup_add_products}</th>
			<td>
				<a href="./index.php?module=products&amp;view=add" class="positive"><img src="./images/common/cart_add.png" alt="cart" />{$LANG.add_new_product}</a>
			</td>
		</tr>

{/if}

{if $taxes == null}
		<tr>
			<th>{$LANG.setup_add_taxrate}</th>
			<td>
				<a href="index.php?module=tax_rates&amp;view=add" class="positive"><img src="./images/common/money_delete.png" alt="delete" />{$LANG.add_new_tax_rate}</a>
			</td>
		</tr>
{/if}

{if $preferences == null}
		<tr>
			<th>{$LANG.setup_add_inv_pref}</th>
			<td>
				</a>
				<a href="./index.php?module=preferences&amp;view=add" class="positive"><img src="./images/common/page_white_edit.png" alt="edit" />{$LANG.add_new_preference}</a>
			</td>
		</tr>
{/if}
	</table>

{else}

	<div style="float: right;">
		<div class="si_toolbar">
			<div class="si_toolbar_form">
				<button type="submit" class="invoice_save" name="submit" value="{$LANG.save}">
					<img class="button_img" src="./images/common/tick.png" alt="tick" />{$LANG.save}</button><br />
			</div>
{if $defaults.use_modal}
		</div>
		<br /><br /><a class="cluetip" href="#" rel="./index.php?module=documentation&amp;view=view&amp;page=help_invoice_Modal" title="{$LANG.Modal}"><img src="./images/common/help-small.png" alt="help" /> {$LANG.Modal}</a>:<br /><br />
		<div class="si_toolbar modal">
			<div class="si_toolbar_inform">
				<a rel="superbox[iframe][1075x600]" href="index.php?module=customers&amp;view=add" class="show-details modal customer_add" title="{$LANG.add_customer}">
					<img class="button_img" src="./images/common/add.png" alt="add" />{$LANG.add_customer}</a><br /><br />
				<a href="javascript:void(false)" id="regenCusts">{$LANG.regenCusts}</a><br /><br />
				<a rel="superbox[iframe][1075x600]" href="index.php?module=products&amp;view=add" class="show-details modal product_add" title="{$LANG.add_product}">
					<img class="button_img" src="./images/common/add.png" alt="add" />{$LANG.add_product}</a>
				<a href="javascript:void(false)" id="regenProds">{$LANG.regenProds}</a><br /><br />
			</div>
{/if}
		</div>
	</div>

	<div class="si_invoice_form">

{include file="$path/header.tpl"}

		<table id="itemtable" class="si_invoice_items">
			<thead>
				<tr>
					<td class=""></td>
					<td class="">{$LANG.quantity}</td>
					<td class="">{$LANG.item}</td>
{section name=tax_header loop=$defaults.tax_per_line_item}
					<td class="">{$LANG.tax} {if $defaults.tax_per_line_item > 1}{$smarty.section.tax_header.index+1|htmlsafe}{/if} </td>
{/section}
					<td class="">{$LANG.unit_price}</td>
				</tr>
			</thead>

{section name=line start=0 loop=$dynamic_line_items step=1}
			<tbody class="line_item" id="row{$smarty.section.line.index|htmlsafe}">
{assign var="lineNumber" value=$smarty.section.line.index}
				<tr>
					<td>
{if $smarty.section.line.index == "0"}
						<a href="#" class="trash_link" id="trash_link{$smarty.section.line.index|htmlsafe}" title="{$LANG.cannot_delete_first_row|htmlsafe}" >
							<img id="trash_image{$smarty.section.line.index|htmlsafe}" src="./images/common/blank.gif" height="16" width="16" title="{$LANG.cannot_delete_first_row}" alt="cant" />
						</a>
{/if}

{if $smarty.section.line.index != 0}
						<a id="trash_link{$smarty.section.line.index|htmlsafe}"
							class="trash_link modal" title="{$LANG.delete_row}" 
							rel="{$smarty.section.line.index|htmlsafe}"
							href="#" style="display: inline;"
						>
							<img src="./images/common/delete_item.png" alt="delete" />
						</a>
{/if}
					</td>
					<td>
						<input type="text" 
							class="{if $smarty.section.line.index == "0"}validate[required] {/if}si_right" 
							name="quantity{$smarty.section.line.index|htmlsafe}" 
							id="quantity{$smarty.section.line.index|htmlsafe}" size="5" 
{if $smarty.get.quantity.$lineNumber}
							value="{$smarty.get.quantity.$lineNumber}"
{/if}			/>
					</td>
					<td>
{if $products == null }
					<p><em>{$LANG.no_products}</em></p>
{else}
					<select id="products{$smarty.section.line.index|htmlsafe}"
						name="products{$smarty.section.line.index|htmlsafe}"
						rel="{$smarty.section.line.index|htmlsafe}"
						class="{if $smarty.section.line.index == "0"}validate[required] {/if}changeProduct"
					>
						<option value="">&nbsp;</option>
{foreach from=$products item=product}
						<option 
{if $product.id == $smarty.get.product.$lineNumber} 
								value="{$smarty.get.product.$lineNumber}" 
								selected="selected"
{else}		value="{$product.id|htmlsafe}"
{/if}>
{$product.description|htmlsafe} </option>
{/foreach}
					</select>
{/if}
					</td>
{section name=tax start=0 loop=$defaults.tax_per_line_item step=1}
{assign var="taxNumber" value=$smarty.section.tax.index}
					<td>
						<select id="tax_id[{$smarty.section.line.index|htmlsafe}][{$smarty.section.tax.index|htmlsafe}]"
							name="tax_id[{$smarty.section.line.index|htmlsafe}][{$smarty.section.tax.index|htmlsafe}]">
							<option value="">&nbsp;</option>
{foreach from=$taxes item=tax}
							<option 
{if $tax.tax_id == $smarty.get.tax.$lineNumber.$taxNumber}
								value="{$smarty.get.tax.$lineNumber.$taxNumber}" 
								selected="selected"
{else}
								value="{$tax.tax_id|htmlsafe}"
{/if}	>
{$tax.tax_description|htmlsafe}
							</option>
{/foreach}
						</select>
					</td>
{/section}
					<td>
						<input id="unit_price{$smarty.section.line.index|htmlsafe}" 
							name="unit_price{$smarty.section.line.index|htmlsafe}" size="7"
{if $smarty.get.unit_price.$lineNumber}
							value="{$smarty.get.unit_price.$lineNumber}"
{else}
							value=""
{/if}
							class="{if $smarty.section.line.index == "0"}validate[required] {/if}si_right unit_price" />
					</td>
				</tr>
				<tr class="details si_hide">
					<td></td>
					<td colspan="4">
						<textarea class="detail" name="description{$smarty.section.line.index|htmlsafe}" id="description{$smarty.section.line.index|htmlsafe}" rows="3" cols="3"></textarea>
					</td>
				</tr>
			</tbody>
{/section}
		</table>

		<div class="si_toolbar si_toolbar_inform">
			<a href="#" class="add_line_item"><img src="./images/common/add.png" alt="add" />{$LANG.add_new_row}</a>
			<a href='#' class="show-details" onclick="javascript: $('.details').addClass('si_show').removeClass('si_hide');$('.show-details').addClass('si_hide').removeClass('si_show');"><img src="./images/common/page_white_add.png" title="{$LANG.show_details}" alt="details" />{$LANG.show_details}</a>
			<a href='#' class="details si_hide" onclick="javascript: $('.details').removeClass('si_show').addClass('si_hide');$('.show-details').addClass('si_show').removeClass('si_hide');"><img src="./images/common/page_white_delete.png" title="{$LANG.hide_details}" alt="hide" />{$LANG.hide_details}</a>
		</div>

		<table class="si_invoice_bot">

			{$show_custom_field.1}
			{$show_custom_field.2}
			{$show_custom_field.3}
			{$show_custom_field.4}
			{*
				{showCustomFields categorieId="4" itemId=""}
			*}

			<tr>
				<td class='si_invoice_notes' colspan="2">
					<H5>{$LANG.notes}</H5>
					<textarea class="editor" name="note" rows="5" cols="50">
						{$smarty.get.note}
					</textarea>
				</td>
			</tr>

			<tr>
				<th>
					{$LANG.inv_pref}
				</th>
				<td>
{if $preferences == null }
					<em>{$LANG.no_preferences}</em>
{else}
					<select name="preference_id">
{foreach from=$preferences item=preference}
						<option{if $preference.pref_id == $defaults.preference} selected{/if} value="{$preference.pref_id|htmlsafe}">{$preference.pref_description|htmlsafe}</option>
{/foreach}
					</select>
{/if}
				</td>
			</tr>
		</table>

		<input type="hidden" id="max_items" name="max_items" value="{$smarty.section.line.index|htmlsafe}" />
		<input type="hidden" name="type" value="2" />

		<div class="si_toolbar si_toolbar_form">
			<button type="submit" class="invoice_save" name="submit" value="{$LANG.save}"><img class="button_img" src="./images/common/tick.png" alt="tick" />{$LANG.save}</button>
			<a href="./index.php?module=invoices&amp;view=manage" class="negative"><img src="./images/common/cross.png" alt="cross" />{$LANG.cancel}</a>
		</div>

		<div class="si_help_div">
			<a class="cluetip" href="#" rel="index.php?module=documentation&amp;view=view&amp;page=help_invoice_custom_fields" title="{$LANG.want_more_fields}"><img src="./images/common/help-small.png" alt="help" /> {$LANG.want_more_fields}</a>
		</div>

	</div>

</form>

{/if}

<script type="text/javascript">
<!--{literal}
//	var latest = 0;
	
	function makeJSONcustXML(xml)
	{
		var output = '[';
		for (var root=0; root<xml.childNodes.length; root++)
		{
			var myroot = xml.childNodes[root];
			for (var c=0; c<myroot.childNodes.length; c++)
			{
				if (myroot.childNodes[c].tagName == 'row')
				{
					var myc = myroot.childNodes[c];
					if (output.slice(-1)=='}')
						output += ',';
					output += '{';
					for (var a=0; a<myc.attributes.length; a++)
					{
						var mya = myc.attributes[a];
					//	if (a > 0)
					//		output += ',';
						output += '"'+ mya.name+ '":"'+ mya.value+'"';
					}
					for (var ac=0; ac<myc.childNodes.length; ac++)
					{
						var myaa = myc.childNodes[ac];
						for (var aa=0; aa<myaa.attributes.length; aa++)
						{
						//	if (ac > 0)
								output += ',';
							output += '"'+ myaa.attributes[aa].value+ '":"'+ myaa.textContent.trim()+'"';
						}
					}
					output += '}';
				}
			}
		}
		return output;
	}

	/* 
	arguments:
		myxml 	= XML data construct
		tag1 	= string -name of primary tagName to find
		tag2 	= string -name of secondary tagName to find
		seled 	= boolean -true = select latest -false select none
	*/
	function optionsParseXML(myxml,tag1,tag2,seled=false)
	{
		//seled = seled || false;
		var rows = myxml.getElementsByTagName("rows")[0];
		if (rows) {
			var items = [],
				nodes = rows.childNodes,
				latest = 0,
				counter = 0,
				selected = 0;
			if (nodes)
			{
				for (var i=0; i<nodes.length; i++)
				{
					var theid = nodes[i].getAttribute(tag1);
					if (theid)
					{
						var cells = nodes[i].childNodes;
						if (seled && parseInt(theid) > parseInt(latest))	// get the latest id
						{
							latest = theid;	// assign total as id if higher
						}
						for (var j=0; j<cells.length; j++)
						{
							if (cells[j].getAttribute("name")==tag2)
							{
								var thename = cells[j].textContent;
								var string = '<option value="'+ theid+ '"';
								if (theid == latest)
								{
//									string += ' selected="selected"';	// select latest
									selected = counter;
								}
								string += '>'+ thename+ '<\/option>'+ "\n";
								items.push (string);
								counter += 1;
								break;
							}
						}
					} else if (seled && nodes[i].nodeName=='total')
					{
						latest = nodes[i].textContent;
					}
				}
			}
		}
		items.unshift (selected);
		return items;
	}

	function regenCustsSuccess(response)
	{
		var items = 				optionsParseXML(response, 'id', 'name', true);
		var latest = 				items[0];
		items.shift();
		var ele = 					$('#customer_id');
		ele[0].options.length = 	0;								// clear previous options
		ele.append(items.join("\n"));								// fill customer list
		ele[0].selectedIndex = 		latest;
		//json_customers = 			$.xml2json(response);//{*/literal}{$customers|@json_encode}{literal*};
		var json_customers = 		makeJSONcustXML(response);
		putAddress(ele[0].options[latest].value, 'customer_street_address');
	{/literal}{if $defaults.use_ship_to}
		items = 					optionsParseXML(response, 'id', 'name');
		items.shift();
		items.unshift('<option value="0" selected="selected">{ $LANG.no_ship_to }<\/option>'+ "\n");
		var ele = 					$('#ship_to_customer_id');
		ele[0].options.length = 	0;
		ele.append(items.join("\n"));								// fill ship-to-customer list
//		putAddress(ele[0].options[latest].value, 'ship_street_address');
	{/if}{literal}
	}

	function regenCusts()
	{
		$('#gmail_loading').show();
		$.ajax({
			url:		'index.php?module=customers&view=xml',							// get output (json) of php script
			type:		'POST',
			data:		'rp=32768',
			success: 	function(response) {	regenCustsSuccess(response);		},
			error: 		function(jqXHR, textStatus, errorThrown)
						{
							console.log('error');	console.log(errorThrown);
							console.log(jqXHR);		$('#gmail_loading').hide();
						},
			complete: 	function() {			$('#gmail_loading').hide();		}
		});
	}

	function regenProdsSuccess(response)
	{
		var allprows = document.getElementsByClassName('changeProduct');
		for (var k=0; k<allprows.length; k++)
		{
			var ele = allprows[k];
			if (ele.selectedIndex>0)
			{
				var answer = confirm('{/literal}{$LANG.regenProds} {$LANG.into} ("' + ele.id + '"), {$LANG.overwrite_product} ("' + ele.options[ele.selectedIndex].text +'"){literal}');
			}
			if (ele.selectedIndex == 0 || typeof ele.selectedIndex === "undefined" || answer)
			{
				var items = optionsParseXML(response, 'id', 'description');
				var latest = items[0];
				items.shift();
				ele.options.length = 0;										// clear previous options
				items.unshift('<option value="">&nbsp;<\/option>'+ "\n");
				$(ele).append(items.join("\n"));							// fill products list
				ele.selectedIndex = latest;
			}
		}
	}

	function regenProds()
	{
		$('#gmail_loading').show();
		$.ajax({
			url: 		'index.php?module=products&view=xml',				// get output (json) of php script//{*	/literal}{$inc|cat:"/mylist.php"}{literal	*}
			type: 		'POST',
			data:		'rp=32768',
			success: 	function(response) {	regenProdsSuccess(response);		},
			error: 		function(jqXHR, textStatus, errorThrown)
						{
							console.log('error');	console.log(errorThrown);
							console.log(jqXHR);		$('#gmail_loading').hide();
						},
			complete: 	function() {			$('#gmail_loading').hide();		}
		});
	}

	$('#regenCusts').click(function () { 						// launch regenCusts() when #regenCusts clicked
		regenCusts();
	});
	$('#regenProds').click(function () { 						// launch regenProds() when #regenProds clicked
		regenProds();
	});

	$('.changeProduct').livequery('change', function () { 		// launch changeProductSelection() when #changeProduct changed
		changeProductSelection(this);
	});

	$('.unit_price').livequery('blur', function (e) {
		e.preventDefault();
		if (document.selection) {
			document.selection.empty();
		} else if (window.getSelection) {
			window.getSelection().removeAllRanges();
		}
		$('#gmail_loading').show();
		var nowval = this.value;
		var row = this.parentElement.parentElement.parentElement.id.substr(3);
		var prodel = document.getElementById('products'+ row);/*$('#products'+ row);*/
		if (prodel.selectedIndex)
		{
			var prod = prodel.options[prodel.selectedIndex].text;
			var valu = prodel.options[prodel.selectedIndex].value;
		}
		if (nowval)
		{
			var answer = confirm('{/literal}{$LANG.update} {$LANG.product} ("'+ prod+ '") {$LANG.with_new_price} ("'+ nowval+'") {$LANG.in} {$LANG.price_list}?{literal}');
		}
		if (answer)
		{
			// save nowval in db product table
			$.ajax({
				url: 		'index.php?module=products&view=update',				// send data to php script
				type: 		'POST',
				data:		'val='+ valu+ '&unit_price=' + nowval,
				/*success: 	function(response) {	alert("{/literal}{$LANG.saved} ('"+ prod+ "' => '"+ nowval+"'){literal}");		},*/
				error: 		function(jqXHR, textStatus, errorThrown)
							{
								console.log('error');	console.log(errorThrown);
								console.log(jqXHR);
							},
				/*complete: 	function() {			$('#gmail_loading').hide();		}*/
			});
		}
		$('#gmail_loading').hide();
	});
//-->{/literal}
</script>
