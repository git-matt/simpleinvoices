<script>
{literal}
var columns = 8;
var padding = 10;
var grid_width = $('.col').width();

grid_width = grid_width - (columns * padding);
percentage_width = grid_width / 100;
$('#manageGrid').flexigrid ({
    url: 'index.php?module=customers&view=xml',
    dataType: 'xml',
    colModel : [
        {display: '{/literal}{$LANG.actions}{literal}', name : 'actions'       , width :  7 * percentage_width, sortable : false, align: 'center'},
        {display: '{/literal}{$LANG.id}{literal}'     , name : 'CID'           , width :  7 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.name}{literal}'   , name : 'name'          , width : 40 * percentage_width, sortable : true , align: 'left'  },
        {display: 'Last Invoice'                      , name : 'last_invoice'  , width : 10 * percentage_width, sortable : false, align: 'right' },
        {display: '{/literal}{$LANG.total}{literal}'  , name : 'customer_total', width : 10 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.paid}{literal}'   , name : 'paid'          , width : 10 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.owing}{literal}'  , name : 'owing'         , width : 10 * percentage_width, sortable : true , align: 'right' },
        {display: '{/literal}{$LANG.enabled}{literal}', name : 'enabled'       , width :  6 * percentage_width, sortable : true , align: 'center'}
        ],
    searchitems : [
        {display: '{/literal}{$LANG.id}{literal}'  , name : 'c.id'},
        {display: '{/literal}{$LANG.name}{literal}', name : 'c.name', isdefault: true}
        ],
    sortname: 'name',
    sortorder: 'asc',
    usepager: true,
    pagestat: '{/literal}{$LANG.displaying_items}{literal}',
    procmsg: '{/literal}{$LANG.processing}{literal}',
    nomsg: '{/literal}{$LANG.no_items}{literal}',
    pagemsg: '{/literal}{$LANG.page}{literal}',
    ofmsg: '{/literal}{$LANG.of}{literal}',
    useRp: false,
    rp: 25,
    showToggleBtn: false,
    showTableToggleBtn: false,
    height: 'auto'
});
{/literal}
</script>
