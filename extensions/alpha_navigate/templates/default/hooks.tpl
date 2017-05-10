{*include other hooks*}

{assign var=inc value=$anrel|substr:2|cat:'templates/default/'}

{if file_exists($inc|cat:'auth/hooks.tpl')}{include file=$inc|cat:'auth/hooks.tpl'}{/if}
{if file_exists($inc|cat:'billers/hooks.tpl')}{include file=$inc|cat:'billers/hooks.tpl'}{/if}
{if file_exists($inc|cat:'customers/hooks.tpl')}{include file=$inc|cat:'customers/hooks.tpl'}{/if}
{if file_exists($inc|cat:'index/hooks.tpl')}{include file=$inc|cat:'index/hooks.tpl'}{/if}
{if file_exists($inc|cat:'invoices/hooks.tpl')}{include file=$inc|cat:'invoices/hooks.tpl'}{/if}
{if file_exists($inc|cat:'products/hooks.tpl')}{include file=$inc|cat:'products/hooks.tpl'}{/if}
{if file_exists($inc|cat:'user/hooks.tpl')}{include file=$inc|cat:'user/hooks.tpl'}{/if}
