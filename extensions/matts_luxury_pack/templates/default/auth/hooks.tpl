{*
/*
 * Script: ./extensions/matts_luxury_pack/templates/default/hooks.tpl
 * 	Put code into sections via code hooks
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

{*available
hook_auth_login_title
*}


{/strip}{capture name="hook_auth_login_hidden"}
	<input type="hidden" name="from" value="{$from}" />
	<input type="hidden" name="changelang" value="" />
{/capture}{strip}


{/strip}{capture name="hook_auth_login_footer"}
		<div class="si_wrap">
			<span id="thanks">{$LANG.thank_you_inv}</span><a href="http://www.simpleinvoices.org">{$LANG.simple_invoices}</a> |&nbsp;
			<a href="http://www.simpleinvoices.org/+"><span id="forum">{$LANG.forum}</span></a> |&nbsp;
			<a href="http://www.simpleinvoices.org/blog"><span id="blog">{$LANG.blog}</span></a> |&nbsp;
			{$version_name|htmlsafe}
		</div>
{/capture}{strip}


{/strip}{capture name="hook_auth_login_top"}
{/capture}{strip}


{/strip}{*capture name="hook_auth_login_end"}
		<div>
			<select class="WASchosen-select"{ * class="dropdown_value"* } name="lang" id="select_1"{ * style="display: none"* }>{ * disabled="disabled"* }
{ *foreach from=$langlist item=langitem}
				<option value="{$langitem.code}"{if isset($langitem.img) && $langitem.img} style="background: url({$langitem.img}) 2px center no-repeat;"{/if}{if ($smarty.get.langitem!=null && $smarty.get.langitem==$langitem.code) || ($langitem.code==$defaults.language)} selected="selected"{/if}>{$langitem.code} - {$langitem.name}{if $langitem.longname} ({$langitem.longname}){/if}</option>
* }
{foreach from=$abc item=langitem}
				<option value="{$langitem->shortname}"{if isset($langitem->img) && $langitem->img} style="background: url({$langitem->img}) 2px center no-repeat;"{/if}{if ($smarty.get.langitem!=null && $smarty.get.langitem==$langitem->shortname) || ($langitem->shortname==$defaults.language)} selected="selected"{/if}>{$langitem->shortname} - {$langitem->name}</option>
{/foreach}
			</select>
		</div>
	<!--<script src="{$mlprel|cat:'include/jquery/chosen.jquery.js'}"></script>-->

	<script>{literal}
/*		function createDropDown(){
			var selects = $("select.dropdown_value");
			var idCounter = 1;
			selects.each(function() {
				var dropID = "dropdown_" + idCounter;
				var source = $(this);
				var selected = source.find("option[selected]");
				var options = $("option", source);
				var image = $("option", source);
				source.after('<dl id="' + dropID + '" class="dropdown"></dl>');
				$("#" + dropID).append('<dt><a href="javascript:void(0)">' + selected.text() + '<span class="value">' + selected.val() + '</span></a></dt>');
				$("#" + dropID).append('<dd><ul></ul></dd>');
				options.each(function() {
					var soption = '<li';
					if ($(this).attr("data-img"))
						soption += ' style="background: url(' + $(this).attr("data-img") + ') no-repeat 5px center"';
					soption += '><a href="javascript:void(0)">' + $(this).text() + '<span class="value">' + $(this).val() + '</span></a></li>';
					$("#" + dropID + " dd ul").append(soption);
				});
				idCounter++;
			});
		}*/
		$(document).ready(function() {
			//$(".chosen-select").chosen();
/*			createDropDown();
			$(".dropdown dt a")
				.click(function(e) {//open myselect
					e.preventDefault();
					var dropID = $(this).parents("dl").eq(0).attr("id");
					//$("#" + dropID).find("ul").toggle();
					$("#" + dropID + " dd ul").animate({opacity: 'show', height: 'show'}, 'fast');
				})
				.blur(function() {//close myselect
					var dropID = $(this).parents("dl").eq(0).attr("id");
					$("#" + dropID + " dd ul").animate({opacity: 'hide', height: 'hide'}, 'fast');
				});
			$(".dropdown dd ul li a")
				.click(function(e) {//make selection
					var dropID = $(this).parents("dl").eq(0).attr("id");
					var text = $(this).html();
					var svalue = $(this).find("span.value").html();
					var source = $(this).parents("dl").eq(0).prev();
					$("#" + dropID + " dt a").html(text);
					//$("#" + dropID + " dd ul").hide();
					$("#" + dropID + " dd ul").animate({opacity: 'hide', height: 'hide'}, 'fast');
					source.val(svalue);
					//alert('selected '+ svalue);
					$('input[name=changelang]').val(svalue);
//					$('#email').val({/literal}{$LANG['email']}{literal});//[svalue]
//					$('#password').val({/literal}{$LANG['password']}{literal});
//					$('#thanks').val({/literal}{$LANG['thanks']}{literal});
//					$('#forum').val({/literal}{$LANG['forum']}{literal});
//					$('#blog').val({/literal}{$LANG['blog']}{literal});
				});
			$("dl[class!=dropdown]")
				.click(function(e) {
					e.preventDefault();
					$(".dropdown dd ul").hide();
				});
*/
		});
/*
		var oSelect = {
			mCurrent : -1,
			mTotal : 0
		}
		$(".dropdown")
			.keyup(function(e) {
				var sKey = e.keyCode || window.event.keyCode;
				var $select = $(this).find("select");
				oSelect.mTotal = $(this).find("select option").length;
				if(sKey == 40 || sKey == 38){
					if( sKey == 38 ){ // keyUp
						if( oSelect.mCurrent == 0 || oSelect.mCurrent == -1 )
							oSelect.mCurrent = oSelect.mTotal-1;
						else {
							oSelect.mCurrent--;
						}
					} else { // keyDown
						if( oSelect.mCurrent == oSelect.mTotal-1 )
							oSelect.mCurrent = 0;
						else {
							oSelect.mCurrent++;
						}
					}
					if( $(this).find("ul:hidden").length > 0 ) {
						$select[0].selectedIndex = oSelect.mCurrent;
						$(this).find('a:first').html( $(this).find(":selected").text() );
	//				} if( $(this).find("ul:visible").length > 0 ) {
					// loop through each result li applying the correct style
						$ul = $(this).find("ul");
						$ul.children().each(function(i) {
							if( i == oSelect.mCurrent ) {
								$select[0].selectedIndex = oSelect.mCurrent;
								$( this ).addClass("selected");
							} else
								$( this ).removeClass("selected");
						});
					}
					return true;
				} else if( sKey == 13 ) {
					if( $(this).find("ul li.selected").text() != "" ) {
						$(this).find('a:first').html( $(this).find("ul li.selected").text() );
						return true;
					}
					return false;
				}
			});
*/
	</script>{/literal}
{/capture*}{strip}


{/strip}
