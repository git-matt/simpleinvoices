{*
/*
 * Script: ./extensions/matts_luxury_pack/modules/invoices/manage.js.php
 * 	Customer manage template
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
<script type="text/javascript">
{literal}
			var columns = 9;
			var padding = 12;
			var action_menu = 140;
			var grid_width = $('.col').width();
			//var url = 'index.php?module=invoices&view=xml';
			
			grid_width = grid_width - (columns * padding) - action_menu;
			percentage_width = grid_width / 100; 
			
			function test(com,grid)
			{
				if (com=='Delete')
				{
					confirm('Delete ' + $('.trSelected',grid).length + ' items?')
				}
				else if (com=='Add')
				{
					alert('Add New Item');
				}			
			}


		$("#manageGrid").flexigrid({
			url: "{/literal}{$url}{literal}",
			dataType: 'xml',
			colModel : [
				{display: '{/literal}{$LANG.actions}{literal}', name : 'actions', width : action_menu, sortable : false, align: 'center'},
				{display: '{/literal}{$LANG.id}{literal}', name : 'index_id', width : 15 * percentage_width, sortable : true, align: 'right'},
				{display: '{/literal}{$LANG.biller}{literal}', name : 'biller', width : 20 * percentage_width, sortable : true, align: 'left'},
				{display: '{/literal}{$LANG.customer}{literal}', name : 'customer', width : 28 * percentage_width, sortable : true, align: 'left'},
				{display: '{/literal}{$LANG.date_upper}{literal}', name : 'date', width : 10 * percentage_width, sortable : true, align: 'right'},
				{display: '{/literal}{$LANG.total}{literal}', name : 'invoice_total', width : 8 * percentage_width, sortable : true, align: 'right'},
				{display: '{/literal}{$LANG.tax}{literal}', name : 'tax_total', width : 7 * percentage_width, sortable : true, align: 'right'},
				{display: '{/literal}{$LANG.owing}{literal}', name : 'owing', width : 7 * percentage_width, sortable : true, align: 'right'},
				{display: '{/literal}{$LANG.aging}{literal}', name : 'aging', width : 5 * percentage_width, sortable : true, align: 'right'}
				],
				/*
			buttons : [
				{name: 'Add', bclass: 'add', onpress : test},
				{name: 'Delete', bclass: 'delete', onpress : test},
				{separator: true}
				],
			*/
			searchitems : [
				{display: '{/literal}{$LANG.invoice_number}{literal}', name : 'iv.index_id'},
				{display: '{/literal}{$LANG.biller}{literal}', name : 'b.name'},
				{display: '{/literal}{$LANG.customer}{literal}', name : 'c.name', isdefault: true}
				],

			sortname: "{/literal}{$smarty.get.sortname|default:'index_id'}{literal}",
			sortorder: "{/literal}{$smarty.get.sortorder|default:'desc'}{literal}",
			usepager: true,
			/*title: 'Manage Custom Fields',*/
			pagestat: '{/literal}{$LANG.displaying_items}{literal}',
			procmsg: '{/literal}{$LANG.processing}{literal}',
			nomsg: '{/literal}{$LANG.no_items}{literal}',
			pagemsg: '{/literal}{$LANG.page}{literal}',
			ofmsg: '{/literal}{$LANG.of}{literal}',
			useRp: false,
			rp: {/literal}{if $smarty.get.rp}{$smarty.get.rp}{elseif $defaults.default_nrows}{$defaults.default_nrows}{else}15{/if}{literal},
			showToggleBtn: false,
			showTableToggleBtn: false,
			width: 'auto',
			height: 'auto'
		});
{/literal}
</script>
