{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<{$attribute.contentclass_attribute_identifier} datatypestring="{$attribute.data_type_string|washxml}">
{if $attribute.has_content}
   {if is_array( $attribute.content.value )}
       {foreach $attribute.content.value as $country}
           <country>{$country.Name|washxml}</country>
       {/foreach}
   {else}
       <country>{$attribute.content.value|washxml}</country>
   {/if}
{else}
   <country>{'Not specified'|i18n( 'design/standard/content/datatype' )}</country>
{/if}
</{$attribute.contentclass_attribute_identifier}>