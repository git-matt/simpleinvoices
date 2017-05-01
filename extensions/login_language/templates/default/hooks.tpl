{/strip}{capture name="hook_auth_login_end"}
		<div>
			<select class="WASchosen-select" name="lang" id="select_1">
{foreach from=$abc item=langitem}
				<option value="{$langitem->shortname}"{if isset($langitem->img) && $langitem->img} style="background-image: url({$langitem->img});"{/if}{if ($smarty.request.lang!=null && $smarty.request.lang==$langitem->shortname) || ($langitem->shortname==$defaults.language)} selected="selected"{/if}>{$langitem->shortname} - {$langitem->name}</option>
{/foreach}
			</select>
		</div>
	<!--<script src="{$mlprel|cat:'include/jquery/chosen.jquery.js'}"></script>-->

	<script>{literal}
		$('#select_1').change(function(){
			var form = document.getElementById("frmLogin")
			var svalue = $(this).val();
			$('input[name=lang]').val(svalue);
			form.action='language.php';
			form.submit();
		});
	</script>{/literal}
{/capture}{strip}


{/strip}{capture name="hook_auth_login_hidden"}
			<input type="hidden" name="lang" value="" />
{/capture}{strip}
