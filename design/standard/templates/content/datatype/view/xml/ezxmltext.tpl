{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<{$attribute.contentclass_attribute_identifier}{if is_unset( $nonamespace )} datatypestring="{$attribute.data_type_string|washxml}"{/if}>{$attribute.content.input.input_xml}</{$attribute.contentclass_attribute_identifier}>