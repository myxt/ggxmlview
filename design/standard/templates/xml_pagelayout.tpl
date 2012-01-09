{*
 * @version $Id$
 * @author Gaetano Giunta
 * @copyright (c) 2008-2010 G. Giunta
 * @license code licensed under the GPL License: see README
 *
 *}{'Content-Type: text/xml'|httpheader()}<?xml version="1.0" encoding="{httpcharset()|upcase()}"?>
{$module_result.content}
{* try to make sure the eventual debug report does not break xml by encapsulating it in a comment *}
<!-- {"Powered by eZ Publish open source content management system and development framework. http://ez.no"|i18n("design/base",)} -->
<!-- <!--DEBUG_REPORT--> -->