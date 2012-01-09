<?php
/**
 * Generates an xsd file for all the content classes present in this eZ Publish instance
 *
 * @version $Id: $
 * @author Gaetano Giunta
 * @copyright (c) 2008,2010 G. Giunta
 * @license code licensed under the GPL License: see README
 */

/// fecth all classes definitions
$classes = eZContentClass::fetchAllClasses();

/// feed them to the template
require_once( "kernel/common/template.php" );
$tpl = templateInit();
$tpl->setVariable( "classes", $classes );

$Result = array();
$Result['pagelayout'] = 'xml_pagelayout.tpl';
$Result['content'] = $tpl->fetch( "design:class/xml_classlist.tpl" );

// this has been left to the template itself
//header('Content-type: text/xml');

?>
