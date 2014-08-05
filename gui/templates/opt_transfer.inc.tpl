{* 
TestLink Open Source Project - http://testlink.sourceforge.net/ 
$Id: opt_transfer.inc.tpl,v 1.10 2010/05/01 19:06:26 franciscom Exp $
Purpose: manage the OptionTransfer.js created by Matt Kruse
         http://www.JavascriptToolbox.com/
         JavaScript Toolbox - Option Transfer - Move Select Box Options Back And Forth

Author: Francisco Mancardi
        Based on Cold Fusion code by Alessandro Lia (alessandro.lia@gruppotesi.com
*}


{if $smarty.request.edit_testsuite == 'Edit'}{$is_edit = true}{/if}

{if $smarty.request.new_testsuite == 'Create'}{$is_edit = false}{/if}

{if $smarty.request.doAction == 'edit'}{$tc_edit = true}{/if}

{if $showit == 'yes'}{$is_edit=true}{/if}
<script>
    $(document).ready(function(){
        {*$('.optionboxselect').dblclick(function(){
            if($(this).find(':selected').val() != '') {
                alert( $(this).find(':selected').val() );
            }
        //alert($(this).text())
        })*}
    })
</script>
<div class="option_transfer_container" {if (!$is_edit)} style="display: none;" {/if}>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
      {if $option_transfer->global_lbl neq ''}
  		<caption style="font-weight:bold;">
  	  {$option_transfer->global_lbl}
    	&nbsp;{$option_transfer->additional_global_lbl|escape}
		  </caption>
		  {/if}

    <tr>
      {*<td align="center" width="50%">
         <div class="labelHolder">{$option_transfer->from->lbl}</div>
         {html_options name=$option_transfer->from->name 
                       id=$option_transfer->from->name
                       class='optionboxselect'
                       size=$option_transfer->size 
                       style=$option_transfer->style 
                       multiple="yes"
                       
                       options=$option_transfer->from->map}
      </td>*}
      {*<td align="center" width="40">
        <img src="{$smarty.const.TL_THEME_IMG_DIR}/ico_all_r.gif" 
              onclick="{$opt_cfg->js_events->all_right_click}"
              alt=">>" style="cursor: pointer;" /><br />
        <img src="{$smarty.const.TL_THEME_IMG_DIR}/ico_l2r.gif" 
              onclick="{$opt_cfg->js_events->left2right_click}"
              alt=">" style="cursor: pointer;" /><br />
        <img src="{$smarty.const.TL_THEME_IMG_DIR}/ico_r2l.gif" 
              onclick="{$opt_cfg->js_events->right2left_click}"
              alt="<" style="cursor: pointer;" /><br />
        <img src="{$smarty.const.TL_THEME_IMG_DIR}/ico_all_l.gif" 
              onclick="{$opt_cfg->js_events->all_left_click}"
              alt="<<" style="cursor: pointer;" />
      </td>*}
      <td align="center" width="100%">
         <div class="labelHolder" >{$option_transfer->to->lbl}</div>
        {if $is_edit == true && $tc_edit != true}
         {html_options name=$option_transfer->to->name 
                       id=$option_transfer->to->name
                       size=$option_transfer->size 
                       onkeypress="content_modified = true" 
                       onchange="content_modified = true"
                       
                       required=""
                       x-moz-errormessage="Please select a keyword, if none exist. Please add from the home page" 
                       value=""
                       title="Please select a keyword. if none exist. Please add from the home page."
                       style=$option_transfer->style 
                       multiple="yes"
                       ondblclick=$opt_cfg->js_events->right2left_click  
                       options=$option_transfer->from->map}
        {/if}
        {if $is_edit != true && $tc_edit != true}
         {html_options name=$option_transfer->to->name 
                       id=$option_transfer->to->name
                       size=$option_transfer->size 
                       onkeypress="content_modified = true" 
                       onchange="content_modified = true"
                       x-moz-errormessage="Please select a keyword, if none exist. Please add from the home page" 
                       value=""
                       title="Please select a keyword. if none exist. Please add from the home page."
                       style=$option_transfer->style 
                       multiple="yes"
                       ondblclick=$opt_cfg->js_events->right2left_click  
                       options=$option_transfer->from->map}
        {/if}
        {if $tc_edit == true}
         {html_options name=$option_transfer->to->name 
                       id=$option_transfer->to->name
                       size=$option_transfer->size 
                       onkeypress="content_modified = true" 
                       onchange="content_modified = true"
                       required=""
                       x-moz-errormessage="Please select a keyword, if none exist. Please add from the home page" 
                       value=""
                       title="Please select a keyword. if none exist. Please add from the home page."
                       style=$option_transfer->style 
                       multiple="yes"                       
                       ondblclick=$opt_cfg->js_events->right2left_click  
                       options=$option_transfer->all->map
                       selected=$option_transfer->selectedme->map}
        {/if}
      </td>
    </tr>
  </table>
  </div>
  <input type="hidden" name="{$opt_cfg->js_ot_name}_removedLeft"  value="" />
  <input type="hidden" name="{$opt_cfg->js_ot_name}_removedRight"  value="" />
  <input type="hidden" name="{$opt_cfg->js_ot_name}_addedLeft"  value="" />
  <input type="hidden" name="{$opt_cfg->js_ot_name}_addedRight"  value="" />
  <input type="hidden" name="{$opt_cfg->js_ot_name}_newLeft"  value="" />
  <input type="hidden" name="{$opt_cfg->js_ot_name}_newRight"  value="" />
