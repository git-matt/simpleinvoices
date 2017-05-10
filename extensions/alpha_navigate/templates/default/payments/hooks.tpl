{capture name="hook_payments_grid_top"}{strip}

{/strip}
	<div>
		<div class="si_filters_customers si_buttons_manage_customers">
			<span class='si_filters_title'>{$LANG.filters}:</span>
			<span class='si_filters_linksNO' id="navButtons"></span>
		</div>
	</div>

<script type="text/javascript">{literal}
	function drawHead(params, name)
	{
		$('#navButtons').append('<a href="javascript:void(false)" id="all" class="'+ name+ ' first{/literal}{if $smarty.post.query==''} selected{/if}">{$LANG.all}{literal}<\/a>');
		for(var i=0; i<params.length; i++)
		{
			var str = '<a href="javascript:void(false)" class="'+ name+ '">'+ params[i]+ '<\/a>';
			$('#navButtons').append(str);
		}
	}
	$(document).ready(function(){
		//document.write('width:'+ $(window).width()+ '|');
		if ($(window).width() < 900)
		{
			var str = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"];
			drawHead(str, "pick1st");
		} else
		{
			var str = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
			drawHead(str, "qury");
		}
	});
	$('.pick1st').livequery('click', function(e){
		$('#navButtons').empty();
		$('#navButtons').append('<span class="qury" data-value="..">&#8635;<\/span>');
		drawHead(this.text, "qury");
	});
	var lst = ''; 
	$('.qury').livequery('click', function(e){
		if (lst)
			$(lst).removeClass('selected');
		else
			$('#all').removeClass('selected');
		lst = this;
		$(this).addClass('selected');
		if ($(window).width() < 900 && this.attribute('data-value')=="..")
		{
			$('#navButtons').empty();
			var str = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"];
			//var str = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
			drawHead(str, 'pick1st');
		} else
		{
			//$('.bDiv').css('opacity', '0.1');
			var q = (this.id=='all') ? '' : this.text;
			$('#manageGrid').flexOptions({query: q, qtype: "abc", newp: 1, url: 'index.php?module={/literal}{$module}{literal}&view=xml2'}).flexReload();
			//$('.bDiv').css('opacity', '1');
		}
	});
</script>{/literal}
{strip}

{/capture}
