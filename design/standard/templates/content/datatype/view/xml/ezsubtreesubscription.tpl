{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<{$attribute.contentclass_attribute_identifier} datatypestring="{$attribute.data_type_string|washxml}">
{$attribute.data_int|choose('No'|i18n( 'design/standard/content/datatype' ), 'Yes'|i18n( 'design/standard/content/datatype' ) )}
</{$attribute.contentclass_attribute_identifier}>