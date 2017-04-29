{*
/*
* Script: extensions/matts_luxury_pack/templates/default/customers/add.tpl
* 	 Add a Customer template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

{* if customer is updated or saved.*} 

{if $smarty.post.name != "" && $smarty.post.name != null } 
	{*include file="../templates/default/customers/save.tpl"*}
	{include file=$path|cat:"save.tpl"}

{else}
{* if  name was inserted *} 
{if $smarty.post.id !=null} 
{*
		<div class="validation_alert"><img src="./images/common/important.png" alt="important" />
			You must enter a description for the Customer</div>
		<hr />
*}
{/if}	
	{if $smarty.capture.hook_customers_form_top}	{$smarty.capture.hook_customers_form_top}	{/if}
<form name="frmpost" action="index.php?module=customers&amp;view=add" method="post" id="frmpost" onsubmit="return checkForm(this);">
	<div class="si_form">
		<div id="tabs_customer">
			<ul class="anchors">
				<li><a href="#section-1" target="_top">{$LANG.details}</a></li>
				<li><a href="#section-2" target="_top">{$LANG.credit_card_details}</a></li>
				<li><a href="#section-3" target="_top">{$LANG.custom_fields}</a></li>
				<li><a href="#section-4" target="_top">{$LANG.notes}</a></li>
			</ul>
		</div>
		<div id="section-1" class="fragment">

			<table>
	{if $smarty.capture.hook_customers_add_table1_top}	{$smarty.capture.hook_customers_add_table1_top}	{/if}
				<tr>
					<th>{$LANG.customer_name}
						<a 
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_required_field"
							title="{$LANG.required_field}"
						>
						<img src="./images/common/required-small.png" alt="required" />
						</a>
					</th>
					<td><input type="text" name="name" id="name" value="{$smarty.post.name|htmlsafe}" size="25" class="validate[required]" /></td>
				</tr>
				<tr>
					<th>{$LANG.customer_contact}
						<a
							rel="index.php?module=documentation&amp;view=view&amp;page=help_customer_contact"
							href="#"
							class="cluetip"
							title="{$LANG.customer_contact}"
						>
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="attention" value="{$smarty.post.attention|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.street}</th>
					<td><input type="text" name="street_address" value="{$smarty.post.street_address|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.street2}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_street2"
							title="{$LANG.street2}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="street_address2" value="{$smarty.post.street_address2|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.city}</th>
					<td><input type="text" name="city" value="{$smarty.post.city|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.state}</th>
					<td><input type="text" name="state" value="{$smarty.post.state|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.zip}</th>
					<td><input type="text" name="zip_code" value="{$smarty.post.zip_code|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.country}</th>
					<td><input type="text" name="country" value="{$smarty.post.country|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.phone}</th>
					<td><input type="text" name="phone" value="{$smarty.post.phone|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.mobile_phone}</th>
					<td><input type="text" name="mobile_phone" value="{$smarty.post.mobile_phone|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.fax}</th>
					<td><input type="text" name="fax" value="{$smarty.post.fax|htmlsafe}" size="25" /></td>
				</tr>
				<tr>
					<th>{$LANG.email}</th>
					<td><input type="text" name="email" value="{$smarty.post.email|htmlsafe}" size="25" /></td>
				</tr>
	{if $smarty.capture.hook_customers_add_table1_end}	{$smarty.capture.hook_customers_add_table1_end}	{/if}
			</table>
		</div>

		<div id="section-2" class="fragment">
			<table>
	{if $smarty.capture.hook_customers_add_table2_top}	{$smarty.capture.hook_customers_add_table2_top}	{/if}
				<tr>
					<th>{$LANG.credit_card_holder_name}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_credit_card_name"
							title="{$LANG.credit_card_holder_name}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td>
						<input
							type="text" name="credit_card_holder_name"
							value="{$smarty.post.credit_card_holder_name|htmlsafe}" size="25"
						 />
					</td>
				</tr>
				<tr>
					<th>{$LANG.credit_card_number}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_credit_card_number"
							title="{$LANG.credit_card_number}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td>
						<input
							type="text" name="credit_card_number"
							value="{$smarty.post.credit_card_number|htmlsafe}" size="25"
						 />
					</td>
				</tr>
				<tr>
					<th>{$LANG.credit_card_cvc}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_credit_card_cvc"
							title="{$LANG.credit_card_cvc}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="credit_card_cvc" value="{$smarty.post.credit_card_cvc|htmlsafe}" size="5" /></td>
				</tr>
				<tr>
					<th>{$LANG.credit_card_expiry_month}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_credit_card_expiry_month"
							title="{$LANG.credit_card_expiry_month}"
						> 
							<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td>
						<select name="credit_card_expiry_month">
{foreach from=$cc_months item=mon key=k}
							<option value="{$k}"{if $k==$smarty.post.credit_card_expiry_month} selected="selected"{/if}>{$mon}</option>
{/foreach}
						</select>
						<!--<input
							type="text" name="credit_card_expiry_month"
							value="{$smarty.post.credit_card_expiry_month|htmlsafe}" size="5"
						 />-->
					</td>
				</tr>
				<tr>
					<th>{$LANG.credit_card_expiry_year}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_credit_card_expiry_year"
							title="{$LANG.credit_card_expiry_year}"
						> 
							<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td>
						<select name="credit_card_expiry_year">
{foreach from=$cc_years item=year key=k}
							<option value="{$k}"{if $k==$smarty.post.credit_card_expiry_year} selected="selected"{/if}>{$year}</option>
{/foreach}
						</select>
						<!--<input
							type="text" name="credit_card_expiry_year"
							value="{$smarty.post.credit_card_expiry_year|htmlsafe}" size="5"
						 />-->
					</td>
				</tr>
	{if $smarty.capture.hook_customers_add_table2_end}	{$smarty.capture.hook_customers_add_table2_end}	{/if}
			</table>
		</div>

		<div id="section-3" class="fragment">
			<table>
	{if $smarty.capture.hook_customers_add_table3_top}	{$smarty.capture.hook_customers_add_table3_top}	{/if}
{if $customFieldLabel.customer_cf1}
				<tr>
					<th>{$customFieldLabel.customer_cf1|htmlsafe}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
							title="{$LANG.custom_fields}"
						>
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="custom_field1" value="{$smarty.post.custom_field1|htmlsafe}" size="25" /></td>
				</tr>
{/if}
{if $customFieldLabel.customer_cf2}
				<tr>
					<th>{$customFieldLabel.customer_cf2|htmlsafe}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
							title="{$LANG.custom_fields}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="custom_field2" value="{$smarty.post.custom_field2|htmlsafe}" size="25" /></td> 
				</tr>
{/if}
{if $customFieldLabel.customer_cf3}
				<tr>
					<th>{$customFieldLabel.customer_cf3|htmlsafe}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
							title="{$LANG.custom_fields}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="custom_field3" value="{$smarty.post.custom_field3|htmlsafe}" size="25" /></td>
				</tr>
{/if}
{if $customFieldLabel.customer_cf4}
				<tr>
					<th>{$customFieldLabel.customer_cf4|htmlsafe}
						<a
							class="cluetip"
							href="#"
							rel="index.php?module=documentation&amp;view=view&amp;page=help_custom_fields"
							title="{$LANG.custom_fields}"
						> 
						<img src="./images/common/help-small.png" alt="help" />
						</a>
					</th>
					<td><input type="text" name="custom_field4" value="{$smarty.post.custom_field4|htmlsafe}" size="25" /></td>
				</tr>
{/if}
	{if $smarty.capture.hook_customers_add_table3_end}	{$smarty.capture.hook_customers_add_table3_end}	{/if}
			</table>
		</div>

		<div id="section-4" class="fragment">
			<table>
	{if $smarty.capture.hook_customers_add_table4_top}	{$smarty.capture.hook_customers_add_table4_top}	{/if}
{if $defaults.price_list}
				<tr>
					<th>{$LANG.price_list}</th>
					<td>
						<select name="price_list">
							<option value="0"{if !$customer.price_list} selected="selected"{/if}>1</option>
							<option value="1"{if $customer.price_list==1} selected="selected"{/if}>2</option>
							<option value="2"{if $customer.price_list==2} selected="selected"{/if}>3</option>
							<option value="3"{if $customer.price_list==3} selected="selected"{/if}>4</option>
						</select>
					</td>
				</tr>
{/if}
				<tr>
					<th>{$LANG.notes}</th>
					<td><textarea  name="notes" class="editor" rows="8" cols="50">{$smarty.post.notes|outhtml}</textarea></td>
				</tr>
				<tr>
					<th>{$LANG.enabled}</th>
					<td>
						{html_options name=enabled options=$enabled selected=1}
					</td>
				</tr>
			
			{* 
				{showCustomFields categorieId="2"}
			*}

	{if $smarty.capture.hook_customers_add_table4_end}	{$smarty.capture.hook_customers_add_table4_end}	{/if}
			</table>

		</div>
		<div class="si_toolbar si_toolbar_form">
	{if $smarty.capture.hook_customers_add_submit}
		{$smarty.capture.hook_customers_add_submit}
	{else}
			<button type="submit" class="positive" name="id" value="{$LANG.save}">
				<img class="button_img" src="./images/common/tick.png" alt="tick" /> 
				{$LANG.save}
			</button>
	{/if}
	{if $smarty.capture.hook_customers_add_cancel}
		{$smarty.capture.hook_customers_add_cancel}
	{else}
			<a id="cancelAddCustomer" href="./index.php?module=customers&amp;view=manage" class="negative">
				<img src="./images/common/cross.png" alt="cross" />
				{$LANG.cancel}
			</a>
	{/if}
		</div>
	</div>
	{if $smarty.capture.hook_customers_add_hidden}	{$smarty.capture.hook_customers_add_hidden}	{/if}
	<input type="hidden" name="op" value="insert_customer" />
</form>
	{if $smarty.capture.hook_customers_form_end}	{$smarty.capture.hook_customers_form_end}	{/if}
{/if}
