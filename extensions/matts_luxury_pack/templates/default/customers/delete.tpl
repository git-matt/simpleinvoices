{*
/*
* Script: ./extensions/matts_luxury_pack/templates/default/customers/delete.tpl
* 	 delete customer template
*
* Authors:
*	 git0matt@gmail.com, Justin Kelly, Nicolas Ruflin
*
* Last edited:
* 	 2016-09-14
*
* License:
*	 GPL v2 or above
*
* Website:
*	http://www.simpleinvoices.org
*/
*}

{if $smarty.get.stage == 1}

	<br />
		<div class="si_error_line">{$LANG.confirm_delete}<br />{$LANG.customer} '{$customer.name|htmlsafe}'?</div><!--si_message_error-->
	<br />
	<br />
	<form name="frmpost" action="index.php?module=customers&amp;view=delete&amp;stage=2&amp;id={$smarty.get.id|urlencode}" method="post">
		<input type="hidden" name="doDelete" value="y" />
		<div class="si_toolbar si_toolbar_form">
            <button type="submit" class="negative" name="submit" value="Save">
                <img class="button_img" src="./images/common/tick.png" alt="tick" />
                {$LANG.yes}
            </button>

            <a href="./index.php?module=customers&amp;view=manage" class="positive">
                <img src="./images/common/cross.png" alt="cross" />
                {$LANG.cancel}
            </a>
		</div>
	</form>
	
{/if}

{if $smarty.get.stage == 2 }

	<div id="top"></b></div>
	<br /><br />
		<div class="si_message_ok">{$LANG.customer} '{$customer.name|htmlsafe}' {$LANG.deleted}<br />{$LANG.redirect_customers}</div>
	<br /><br />
{	if $smarty.post.cancel == null}
	<meta http-equiv="refresh" content="2;URL=index.php?module=customers&view=manage" />
{	else}
	<meta http-equiv="refresh" content="0;URL=index.php?module=customers&view=manage" />
{	/if}

{/if}
