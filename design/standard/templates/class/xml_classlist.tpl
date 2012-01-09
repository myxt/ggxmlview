<xsd:schema
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">

<!-- allow both xmlmap and xml views in one single definition -->
<xsd:complexType name="eZPnode">
  <xsd:sequence>
    <xsd:element name="object" type="eZPobject"/>
    <xsd:choice>
      <xsd:element name="children">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name="node" type="eZPnode" maxOccurs="unbounded"/>
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
      <xsd:element name="children_list">
        <xsd:complexType>
          <xsd:sequence>
            <xsd:element name="node" type="eZPlinenode" maxOccurs="unbounded"/>
          </xsd:sequence>
        </xsd:complexType>
      </xsd:element>
    </xsd:choice>
  </xsd:sequence>
  <xsd:attribute name="node_id" type="xsd:positiveInteger"/>
  <xsd:attribute name="parent_node_id" type="xsd:positiveInteger"/>
  <xsd:attribute name="depth" type="xsd:positiveInteger"/>
</xsd:complexType>

<xsd:complexType name="eZPlinenode">
  <xsd:attribute name="node_id" type="xsd:positiveInteger"/>
</xsd:complexType>

<xsd:complexType name="eZPobject">
  <xsd:sequence>
    <!-- data_map is to be defined according to class_name below, or at least depending
    upon classes present in this ezP installation. We should use xsd 2.0 for the
    former, and some namespaced definition and "any" type for the second.
    Instead we renamed data_map with the name of the class to geta  deterministic data model,
    and removed class_name attribute -->
    <!--<xsd:element name="data_map">
      <xsd:complexType>
        <xsd:sequence>-->
          <xsd:choice>
            <!-- <xsd:group ref="Article"/>
            <xsd:group ref="Folder"/>
            <xsd:group ref="Image"/> -->
{foreach $classes as $class}
{*$class|attribute(show)*}
            <xsd:element name="{$class.identifier}" type="eZP{$class.identifier}"/>
{/foreach}

          </xsd:choice>
        </xsd:sequence>
      <!--</xsd:complexType>
    </xsd:element>
  </xsd:sequence>-->
  <xsd:attribute name="id" type="xsd:positiveInteger"/>
  <xsd:attribute name="name" type="xsd:string"/>
  <!--<xsd:attribute name="class_name" type="xsd:string"/>-->
  <xsd:attribute name="current_version" type="xsd:positiveInteger"/>
  <xsd:attribute name="main_node_id" type="xsd:positiveInteger"/>
</xsd:complexType>


<!-- every content class defines a complex type element, corresponding to its data map -->

{foreach $classes as $class}
<xsd:complexType name="eZP{$class.identifier}">
  <xsd:sequence>
{foreach $class.data_map as $key => $attribute}
{*$attribute|attribute(show)*}
    <xsd:element name="{$key}" type="{$attribute.data_type_string}"/>
{/foreach}

  </xsd:sequence>
</xsd:complexType>

{/foreach}


<!-- every attribute type defines a complex type. NB: move these in class/datatype/view/xml/attribute.tpl? -->

<xsd:complexType name="ezboolean">
  <xsd:simpleContent>
    <xsd:extension base="xsd:boolean">
      <xsd:attribute name="datatypestring" fixed="ezboolean"/>
    </xsd:extension>
  </xsd:simpleContent>
</xsd:complexType>

<xsd:complexType name="ezdatetime">
  <xsd:simpleContent>
    <xsd:extension base="xsd:dateTime">
      <xsd:attribute name="datatypestring" fixed="ezdatetime"/>
    </xsd:extension>
  </xsd:simpleContent>
</xsd:complexType>

<xsd:complexType name="ezkeyword">
  <xsd:simpleContent>
    <xsd:extension base="xsd:string">
      <xsd:attribute name="datatypestring" fixed="ezkeyword"/>
    </xsd:extension>
  </xsd:simpleContent>
</xsd:complexType>

<xsd:complexType name="ezstring">
  <xsd:simpleContent>
    <xsd:extension base="xsd:string">
      <xsd:attribute name="datatypestring" fixed="ezstring"/>
    </xsd:extension>
  </xsd:simpleContent>
</xsd:complexType>

<xsd:complexType name="ezxmltext">
  <xsd:sequence>
  <!-- we could be stricter here, since not all xhtml is permitted in an ezxmltext -->
    <xsd:any namespace="http://www.w3.org/1999/xhtml" minOccurs="0" maxOccurs="unbounded"/>
  </xsd:sequence>
  <xsd:attribute name="datatypestring" fixed="ezxmltext"/>
</xsd:complexType>


</xsd:schema>
