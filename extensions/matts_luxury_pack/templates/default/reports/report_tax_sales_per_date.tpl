{*
/*
* Script: ./extensions/matts_luxury_pack/templates/default/reports/report_tax_sales_per_date.tpl
* 	 Report for tax of sales template
*
* Authors:
*	 git0matt@gmail.com, Justin Kelly, Nicolas Ruflin
*
* Last edited:
* 	 2016-10-04
*
* License:
*	 GPL v2 or above
*
* Website:
*	http://www.simpleinvoices.org
*/
*}
{literal}
<style>
tr.monthly {
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
tr.yearly {
	border-top: 3px double black;
	border-bottom: 3px double black;
}
tbody.data {
	color: dark-grey;
}
tr.monthly, tr.yearly {
	font-weight: bold;
}
.date, .description {
	text-align: left !important;
}
</style>
{/literal}
<hr />
<form name="frmpost" action="index.php?module=reports&amp;view=report_tax_sales_per_date" method="post">
	<table class="center">
		<tr>
			<td>{$LANG.start_date}
				<input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="start_date" id="date1" value='{$start_date|htmlsafe}' />   
			</td>
			<td>&nbsp;</td>
			<td>{$LANG.end_date}
				<input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="end_date" id="date2" value='{$end_date|htmlsafe}' />   
			</td>
		</tr>
		<tr>
			<td><br />{$LANG.use_numeric_months}<br /><input type="checkbox" name="usenumeric" {if $usenumeric}checked="checked" {/if} /></td>
			<td><br />{$LANG.show_month_totals}<br /><input type="checkbox" name="monthtotals" {if $monthtotals}checked="checked" {/if} /></td>
			<td><br />{$LANG.show_year_totals}<br /><input type="checkbox" name="yeartotals" {if $yeartotals}checked="checked" {/if} /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<button type="submit" class="positive" name="submit" value="{$LANG.insert_biller}">
					<img class="button_img" src="./images/common/tick.png" alt="tick" />
					{$LANG.run_report}
				</button>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</form>
<br />
<hr />
<h3>{$LANG.sales_tax} ({$start_date} - {$end_date})</h3>
<br />
<table class="si_report_table">
	<thead>
		<tr>
			<th>{$LANG.date}</th>
			<th>{$LANG.description}</th>
			<th>{$LANG.category}</th>
			<th>{$LANG.amount}</th>
			<th>{$LANG.tax}</th>
			<th>{$LANG.total}</th>
		</tr>
	</thead>
{assign var=lastyear value=0}
{assign var=lastmonth value=0}
{assign var=sumsub value=0}
{assign var=sumtax value=0}
{assign var=sumtot value=0}
{assign var=sumyearsub value=0}
{assign var=sumyeartax value=0}
{assign var=sumyeartot value=0}
	<tbody class="data">
{foreach from=$data item=row}
{	if $row.iyear && $row.imonth && $row.iday}
{		if $monthtotals && $lastyear > 0 && $lastmonth > 0 && ($row.iyear > $lastyear || $row.imonth > $lastmonth)}
		<tr class="monthly">
			<td class="date">{$lastyear}-{if !$usenumeric}{$months_short[$mymon]}{else}{if $lastmonth>9	}{	$lastmonth	}{else	}0{$lastmonth	}{/if}{/if}</td>
{			assign var=mymon value=$lastmonth-1}
			<td class="description">{$months[$mymon]} {$LANG.total|htmlsafe}</td>
			<td class="category">&nbsp;</td>
			<td class="sub_total align_center">{$sumsub|siLocal_number:'2'|default:'0'}</td>
			<td class="tax_amount align_center">{$sumtax|siLocal_number:'2'|default:'0'}</td>
			<td class="row_total align_center">{$sumtot|siLocal_number:'2'|default:'0'}</td>
		</tr>
{			assign var=sumsub value=0}
{			assign var=sumtax value=0}
{			assign var=sumtot value=0}
{		/if}

{		if $yeartotals && $lastyear > 0 && $row.iyear > $lastyear}
		<tr class="yearly">
			<td class="date">{$lastyear}</td>
			<td class="description">{$lastyear} {$LANG.total|htmlsafe}</td>
			<td class="category">&nbsp;</td>
			<td class="sub_year_total align_center">{$sumyearsub|siLocal_number:'2'|default:'0'}</td>
			<td class="tax_year_amount align_center">{$sumyeartax|siLocal_number:'2'|default:'0'}</td>
			<td class="row_year_total align_center">{$sumyeartot|siLocal_number:'2'|default:'0'}</td>
		</tr>
{			assign var=sumyearsub value=0}
{			assign var=sumyeartax value=0}
{			assign var=sumyeartot value=0}
{		/if}

		<tr class="datarow">
{		assign var=mymon value=$row.imonth-1}
			<td class="date">{$row.iyear	}-{if !$usenumeric}{$months_short[$mymon]}{else}{if $row.imonth>9	}{	$row.imonth	}{else	}0{$row.imonth	}{/if}{/if}-{if $row.iday>9	}{$row.iday	}{else	}0{$row.iday	}{/if}</td>
			<td class="description">{$row.description|htmlsafe}</td>
			<td class="category">{$row.category|htmlsafe}</td>
			<td class="sub_total align_center">{$row.gross_total|siLocal_number:'2'|default:'0'}</td>
{		capture assign=sumsub		}{$sumsub+$row.gross_total		}{/capture}
{		capture assign=sumyearsub	}{$sumyearsub+$row.gross_total	}{/capture}
			<td class="tax_amount align_center">{$row.tax_amount|siLocal_number:'2'|default:'0'}</td>
{		capture assign=sumtax		}{$sumtax+$row.tax_amount		}{/capture}
{		capture assign=sumyeartax	}{$sumyeartax+$row.tax_amount	}{/capture}
			<td class="row_total align_center">{$row.Total|siLocal_number:'2'|default:'0'}</td>
{		capture assign=sumtot		}{$sumtot+$row.Total			}{/capture}
{		capture assign=sumyeartot	}{$sumyeartot+$row.Total		}{/capture}
{		assign var=lastyear value=$row.iyear}
{		assign var=lastmonth value=$row.imonth}
		</tr>
{	else}
		<tr class="rowerror">
			<td>row error!</td>
			<td>row error!</td>
			<td>row error!</td>
			<td>row error!</td>
			<td>row error!</td>
			<td>row error!</td>
		</tr>
{	/if}
{/foreach}
{if $lastyear >0 && $lastmonth >0}
		<tr class="monthly">
			<td class="date">{$lastyear}-{if $lastmonth>9	}{	$lastmonth	}{else	}0{$lastmonth	}{/if}</td>
{	assign var=mymon value=$lastmonth-1}
			<td class="description">{$months[$mymon]} {$LANG.total|htmlsafe}</td>
			<td class="category">&nbsp;</td>
			<td class="sub_total align_center">{$sumsub|siLocal_number:'2'|default:'0'}</td>
			<td class="tax_amount align_center">{$sumtax|siLocal_number:'2'|default:'0'}</td>
			<td class="row_total align_center">{$sumtot|siLocal_number:'2'|default:'0'}</td>
		</tr>
{/if}
{if $$lastyear >0}
		<tr class="yearly">
			<td class="date">{$lastyear}</td>
			<td class="description">{$lastyear} {$LANG.total|htmlsafe}</td>
			<td class="category">&nbsp;</td>
			<td class="sub_year_total align_center">{$sumyearsub|siLocal_number:'2'|default:'0'}</td>
			<td class="tax_year_amount align_center">{$sumyeartax|siLocal_number:'2'|default:'0'}</td>
			<td class="row_year_total align_center">{$sumyeartot|siLocal_number:'2'|default:'0'}</td>
		</tr>
{/if}
	</tbody>
</table>
