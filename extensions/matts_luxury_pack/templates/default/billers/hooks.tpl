{*
/*
* Script: extensions/matts_luxury_pack/templates/default/billers/hooks.tpl
* 	Put code into Billers sections via hooks template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}
{*
/*
 * Script: ./extensions/matts_luxury_pack/templates/default/.tpl
 * 	
 *
 * Authors:
 *	git0matt@gmail.com
 *
 * Last edited:
 * 	2016-09-10
 *
 * License:
 *	GPL v2 or above
 *
 * Website:
 * 	http://www.simpleinvoices.org
 */
*}
{strip}
{*available billers hooks:
manage.tpl
hook_billers_button_add
hook_billers_grid_top
hook_billers_grid_end

add.tpl
hook_billers_add_form_top
hook_billers_add_table_top
hook_billers_add_table_end
hook_billers_add_submit
hook_billers_add_cancel
hook_billers_add_hidden
hook_billers_add_form_end

details.tpl
hook_billers_details_form_top
hook_billers_details_hidden
hook_billers_details_form_end

hook_billers_view_table_top
hook_billers_view_table_end
hook_billers_view_button_edit

hook_billers_edit_table_top
hook_billers_edit_table_end
hook_billers_edit_submit
hook_billers_edit_cancel

save.tpl
hook_billers_save_saved
hook_billers_save_notsaved
hook_billers_save_after_nocancel
hook_billers_save_after_cancel
*}


{/strip}{capture name="hook_billers_add_totable"}
		<tr>
			<th>{$LANG.inv_template}</th>
			<td>{html_options name=invoice_template output=$tmpls values=$tmpls selected=$smarty.post.invoice_template}</td>
		</tr>
		<tr>
			<th>{$LANG.delnote_template}</th>
			<td>{html_options name=delnote_template output=$tmpls values=$tmpls selected=$smarty.post.delnote_template}</td>
		</tr>
{/capture}{strip}


{/strip}{capture name="hook_billers_grid_top"}
		<span style="float: right;">
			{$smarty.capture.table_top}
		</span>
{/capture}{strip}


{/strip}{capture name="hook_billers_grid_end"}
	{$smarty.capture.table_end}
{/capture}{strip}


{/strip}{capture name="hook_billers_view_table_end"}
			<tr>
				<th>{$LANG.inv_template}</th>
				<td>{$biller.invoice_template}</td>
			</tr>
			<tr>
				<th>{$LANG.delnote_template}</th>
				<td>{$biller.delnote_template}</td>
			</tr>
{/capture}{strip}


{/strip}{capture name="hook_billers_edit_table_end"}
			<tr>
				<th>{$LANG.inv_template}</th>
				<td>{html_options name=invoice_template output=$tmpls values=$tmpls selected=$biller.invoice_template}</td>
			</tr>
			<tr>
				<th>{$LANG.delnote_template}</th>
				<td>{html_options name=delnote_template output=$tmpls values=$tmpls selected=$biller.delnote_template}</td>
			</tr>
{/capture}{strip}


{/strip}
