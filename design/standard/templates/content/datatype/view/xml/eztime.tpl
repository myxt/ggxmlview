{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<{$attribute.contentclass_attribute_identifier} datatypestring="{$attribute.data_type_string|washxml}">
{section show=$attribute.content.is_valid}{$attribute.content.timestamp|l10n(shorttime)}{/section}
</{$attribute.contentclass_attribute_identifier}>