{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{* to avoid loops (we do a full tree traversal), we only print out object id *}
<{$attribute.contentclass_attribute_identifier}{if is_unset( $nonamespace )} datatypestring="{$attribute.data_type_string|washxml}"{/if}>
    {if $attribute.has_content}{$attribute.content.id ){/if}
</{$attribute.contentclass_attribute_identifier}>