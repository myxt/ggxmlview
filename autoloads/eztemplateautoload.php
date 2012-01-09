<?php
/**
 * @version $Id$
 * @author Gaetano Giunta
 * @copyright (c) 2008-2010 G. Giunta
 * @license code licensed under the GPL License: see README
 */

$eZTemplateOperatorArray = array(
    array(
        'script' => 'extension/ggxmlview/autoloads/xmltploperators.php',
        'class' => 'ggXmlTplOperators',
        'operator_names' => array_keys( ggXmlTplOperators::$operators )
    )
);

?>