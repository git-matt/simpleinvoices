{*
/*
* Script: extensions/matts_luxury_pack/templates/default/customers/hooks.tpl
* 	 Put code into Customers sections via hooks template
*
* Last edited by:
* 	git0matt@gmail.com
*/
*}

{strip}
{*available customers hooks:
manage.tpl
hook_customers_button_add
hook_customers_grid_top
hook_customers_grid_end

add.tpl
hook_customers_form_top
hook_customers_add_table1_top
hook_customers_add_table1_end
hook_customers_add_table2_top
hook_customers_add_table2_end
hook_customers_add_table3_top
hook_customers_add_table3_end
hook_customers_add_table4_top
hook_customers_add_table4_end
hook_customers_add_submit
hook_customers_add_cancel
hook_customers_add_hidden
hook_customers_form_end

details.tpl
hook_customers_details_form_top
hook_customers_details_hidden
hook_customers_details_form_end

hook_customers_view_table_top
hook_customers_view_table_end
hook_customers_view_table1_top
hook_customers_view_table1_end
hook_customers_view_table2_top
hook_customers_view_table2_end
hook_customers_view_table3_top
hook_customers_view_table3_end
hook_customers_view_table4_top
hook_customers_view_table4_end
hook_customers_view_button_edit
hook_customers_view_button_delete

hook_customers_edit_table_top
hook_customers_edit_table_end
hook_customers_edit_table1_top
hook_customers_edit_table1_end
hook_customers_edit_table2_top
hook_customers_edit_table2_end
hook_customers_edit_table3_top
hook_customers_edit_table3_end
hook_customers_edit_table4_top
hook_customers_edit_table4_end
hook_customers_edit_submit
hook_customers_edit_cancel

save.tpl
hook_customers_save_saved
hook_customers_save_notsaved
hook_customers_save_after
hook_customers_save_after_cancel
hook_customers_save_after_nocancel

enable.tpl
hook_customers_enable

disable.tpl
hook_customers_disable

delete.tpl
hook_customers_delete_stage1
hook_customers_delete_stage2
*}



{capture name="hook_customers_grid_table_top"}
		<span style="float: right;">
			{$smarty.capture.table_top}
		</span>
{/capture}


{capture name="hook_customers_grid_table_end"}
	{$smarty.capture.table_end}
{/capture}


{capture name="disable_url_with_id"}
'./index.php?module=customers&view=disable&id='
{/capture}


{capture name="enable_url_with_id"}
'./index.php?module=customers&view=enable&id='
{/capture}


{capture name="hook_customers_form_end"}
<script type="text/javascript">
	document.forms['frmpost'].elements['name'].focus();
</script>
{/capture}


{capture name="hook_customers_save_after"}
<script type="text/javascript">
<!--
if (inIframe())
{ldelim}
	document.write('<div class="si_toolbar si_toolbar_form">' +
	'	<table class="center">' +
	'		<tr>' +
	'			<td>&nbsp;</td>' +
	'			<td>' +
	'				<a id="modal_addcustomer" href="./index.php?module=customers&amp;view=add" class="button">' +
	'					<img src="./images/common/add.png" alt="add" />{ $LANG.another }</a>' +
	'			</td>' +
	'			<td>&nbsp;</td>' +
	'		</tr>' +
	'		<tr>' +
	'			<td>' +
	'				<a id="modal_manage_customers" href="./index.php?module=customers&amp;view=manage" class="button">' +
	'					<img src="./images/common/database_table.png" alt="manage" />{ $LANG.manage_customers }</a>' +
	'			</td>' +
	'			<td>&nbsp;</td>' +
/*	'			<td>' +
	'				<a id="cancelAddProduct" href="javascript:void(0)" onclick="top.closeModal();top.regenCusts()" class="button">' +
	'					<img src="./images/common/cog_edit.png" alt="close_reload" />{ $LANG.close }+{ $LANG.regenCusts }</a>' +
	'			</td>' +
*/	'		</tr>' +
	'	</table>' +
	'</div>');
{if $smarty.post.cancel == null}
	document.write('<meta http-equiv="refresh" content="10;URL=index.php?module=customers&view=manage" />');
{else}
	document.write('<meta http-equiv="refresh" content="0;URL=index.php?module=customers&view=manage" />');
{/if}
{rdelim}
	{/if}
else
{ldelim}
{if $smarty.post.cancel == null}
	document.write('<meta http-equiv="refresh" content="2;URL=index.php?module=customers&view=manage" />');
{else}
	document.write('<meta http-equiv="refresh" content="0;URL=index.php?module=customers&view=manage" />');
{/if}
{rdelim}
</script>
{/capture}


{/strip}
