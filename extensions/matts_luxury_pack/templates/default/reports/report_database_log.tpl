<div><!-- style="text-align:left;"-->
	<form action="index.php?module=reports&amp;view=database_log" method="post" style="text-align:center">
		<table class="center">
			<tr>
				<td>{$LANG.start_date}
					<input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="startdate" id="date1" value="{$startdate|htmlsafe}" />
				</td>
				<td>&nbsp;</td>
				<td>{$LANG.end_date}
					<input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="enddate" id="date2" value='{$enddate|htmlsafe}' />   
				</td>
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

	<div id="top">
		<br /><table class="center si_report_table">
			<thead>
				<tr>
					<th>{$LANG.invoices_created}{ if $startdate} {$LANG.period} {$startdate|htmlsafe} {$LANG.to} {$enddate|htmlsafe}{/if}</th>
				</tr>
			</thead>
			<tbody>
{foreach from=$created item=inv}
			<tr class="tr_{cycle values="A,B"}">
				<td class="row"> {$LANG.user} {$inv.user} {$LANG.created} {$LANG.invoice} {$inv.inv} {$LANG.on} {$inv.time} </td>
			</tr>
{/foreach}
			</tbody>
		</table>
		
		<br /><table class="center si_report_table">
			<thead>
				<tr>
					<th>{$LANG.invoices_modified}{ if $startdate} {$LANG.period} {$startdate|htmlsafe} {$LANG.to} {$enddate|htmlsafe}{/if}</th>
				</tr>
			</thead>
			<tbody>
{foreach from=$modified item=inv}
			<tr class="tr_{cycle values="A,B"}">
				<td class="row"> {$LANG.user} {$inv.user} {$LANG.modified} {$LANG.invoice} {$inv.inv} {$LANG.on} {$inv.time}<br /> </td>
			</tr>
{/foreach}
			</tbody>
		</table>
		
		<br /><table class="center si_report_table">
			<thead>
				<tr>
					<th>{$LANG.payment_processed}{ if $startdate} {$LANG.period} {$startdate|htmlsafe} {$LANG.to} {$enddate|htmlsafe}{/if}</th>
				</tr>
			</thead>
			<tbody>
{foreach from=$processed item=pay}
			<tr class="tr_{cycle values="A,B"}">
				<td class="row"> {$LANG.user} {$pay.user} {$LANG.processed} {$LANG.invoice} {$pay.inv} {$LANG.on} {$pay.time} {$LANG.with} {$LANG.amount} ${$pay.amt}<br /> </td>
			</tr>
{/foreach}
			</tbody>
		</table>
		
	</div>
</div>
