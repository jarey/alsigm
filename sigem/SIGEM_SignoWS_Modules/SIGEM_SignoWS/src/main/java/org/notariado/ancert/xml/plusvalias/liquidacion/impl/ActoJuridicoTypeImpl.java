//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v@@BUILD_VERSION@@ 
// 	See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// 	Any modifications to this file will be lost upon recompilation of the source schema. 
// 	Generated on: 2011.07.04 en 12:38:50 CEST 
//


package org.notariado.ancert.xml.plusvalias.liquidacion.impl;

public class ActoJuridicoTypeImpl implements org.notariado.ancert.xml.plusvalias.liquidacion.ActoJuridicoType, com.sun.xml.bind.JAXBObject, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallableObject, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializable, org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.ValidatableObject
{

    protected java.lang.String _DESCRIPCION;
    protected java.lang.String _CODIGO;
    public final static java.lang.Class version = (org.notariado.ancert.xml.plusvalias.liquidacion.impl.JAXBVersion.class);
    private static com.sun.msv.grammar.Grammar schemaFragment;

    private final static java.lang.Class PRIMARY_INTERFACE_CLASS() {
        return (org.notariado.ancert.xml.plusvalias.liquidacion.ActoJuridicoType.class);
    }

    public java.lang.String getDESCRIPCION() {
        return _DESCRIPCION;
    }

    public void setDESCRIPCION(java.lang.String value) {
        _DESCRIPCION = value;
    }

    public java.lang.String getCODIGO() {
        return _CODIGO;
    }

    public void setCODIGO(java.lang.String value) {
        _CODIGO = value;
    }

    public org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingEventHandler createUnmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context) {
        return new org.notariado.ancert.xml.plusvalias.liquidacion.impl.ActoJuridicoTypeImpl.Unmarshaller(context);
    }

    public void serializeBody(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "CODIGO");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _CODIGO), "CODIGO");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
        context.startElement("http://ancert.notariado.org/XML/Plusvalias/Liquidacion", "DESCRIPCION");
        context.endNamespaceDecls();
        context.endAttributes();
        try {
            context.text(((java.lang.String) _DESCRIPCION), "DESCRIPCION");
        } catch (java.lang.Exception e) {
            org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.Util.handlePrintConversionException(this, e, context);
        }
        context.endElement();
    }

    public void serializeAttributes(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
    }

    public void serializeURIs(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.XMLSerializer context)
        throws org.xml.sax.SAXException
    {
    }

    public java.lang.Class getPrimaryInterface() {
        return (org.notariado.ancert.xml.plusvalias.liquidacion.ActoJuridicoType.class);
    }

    public com.sun.msv.verifier.DocumentDeclaration createRawValidator() {
        if (schemaFragment == null) {
            schemaFragment = com.sun.xml.bind.validator.SchemaDeserializer.deserialize((
 "\u00ac\u00ed\u0000\u0005sr\u0000\u001fcom.sun.msv.grammar.SequenceExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000\u001dcom.su"
+"n.msv.grammar.BinaryExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\u0004exp1t\u0000 Lcom/sun/msv/gra"
+"mmar/Expression;L\u0000\u0004exp2q\u0000~\u0000\u0002xr\u0000\u001ecom.sun.msv.grammar.Expressi"
+"on\u00f8\u0018\u0082\u00e8N5~O\u0002\u0000\u0002L\u0000\u0013epsilonReducibilityt\u0000\u0013Ljava/lang/Boolean;L\u0000\u000b"
+"expandedExpq\u0000~\u0000\u0002xpppsr\u0000\'com.sun.msv.grammar.trex.ElementPatt"
+"ern\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001L\u0000\tnameClasst\u0000\u001fLcom/sun/msv/grammar/NameClass;"
+"xr\u0000\u001ecom.sun.msv.grammar.ElementExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002Z\u0000\u001aignoreUndecl"
+"aredAttributesL\u0000\fcontentModelq\u0000~\u0000\u0002xq\u0000~\u0000\u0003pp\u0000sq\u0000~\u0000\u0000ppsr\u0000\u001bcom.s"
+"un.msv.grammar.DataExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0003L\u0000\u0002dtt\u0000\u001fLorg/relaxng/dataty"
+"pe/Datatype;L\u0000\u0006exceptq\u0000~\u0000\u0002L\u0000\u0004namet\u0000\u001dLcom/sun/msv/util/String"
+"Pair;xq\u0000~\u0000\u0003ppsr\u0000$com.sun.msv.datatype.xsd.LengthFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000"
+"\u0001\u0002\u0000\u0001I\u0000\u0006lengthxr\u00009com.sun.msv.datatype.xsd.DataTypeWithValueC"
+"onstraintFacet\"\u00a7Ro\u00ca\u00c7\u008aT\u0002\u0000\u0000xr\u0000*com.sun.msv.datatype.xsd.DataTy"
+"peWithFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0005Z\u0000\fisFacetFixedZ\u0000\u0012needValueCheckFlagL\u0000"
+"\bbaseTypet\u0000)Lcom/sun/msv/datatype/xsd/XSDatatypeImpl;L\u0000\fconc"
+"reteTypet\u0000\'Lcom/sun/msv/datatype/xsd/ConcreteType;L\u0000\tfacetNa"
+"met\u0000\u0012Ljava/lang/String;xr\u0000\'com.sun.msv.datatype.xsd.XSDataty"
+"peImpl\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0003L\u0000\fnamespaceUriq\u0000~\u0000\u0014L\u0000\btypeNameq\u0000~\u0000\u0014L\u0000\nwhit"
+"eSpacet\u0000.Lcom/sun/msv/datatype/xsd/WhiteSpaceProcessor;xpt\u00006"
+"http://ancert.notariado.org/XML/Plusvalias/Liquidacionpsr\u00005c"
+"om.sun.msv.datatype.xsd.WhiteSpaceProcessor$Preserve\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001"
+"\u0002\u0000\u0000xr\u0000,com.sun.msv.datatype.xsd.WhiteSpaceProcessor\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002"
+"\u0000\u0000xp\u0000\u0000sr\u0000#com.sun.msv.datatype.xsd.StringType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001Z\u0000\ri"
+"sAlwaysValidxr\u0000*com.sun.msv.datatype.xsd.BuiltinAtomicType\u0000\u0000"
+"\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xr\u0000%com.sun.msv.datatype.xsd.ConcreteType\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000"
+"\u0000xq\u0000~\u0000\u0015t\u0000 http://www.w3.org/2001/XMLSchemat\u0000\u0006stringq\u0000~\u0000\u001b\u0001q\u0000~"
+"\u0000\u001ft\u0000\u0006length\u0000\u0000\u0000\u0004sr\u00000com.sun.msv.grammar.Expression$NullSetExp"
+"ression\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0003sr\u0000\u0011java.lang.Boolean\u00cd r\u0080\u00d5\u009c\u00fa\u00ee\u0002\u0000\u0001Z\u0000\u0005v"
+"aluexp\u0000psr\u0000\u001bcom.sun.msv.util.StringPair\u00d0t\u001ejB\u008f\u008d\u00a0\u0002\u0000\u0002L\u0000\tlocalNa"
+"meq\u0000~\u0000\u0014L\u0000\fnamespaceURIq\u0000~\u0000\u0014xpt\u0000\u000estring-derivedq\u0000~\u0000\u0018sr\u0000\u001dcom.s"
+"un.msv.grammar.ChoiceExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0001ppsr\u0000 com.sun.msv.g"
+"rammar.AttributeExp\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\u0003expq\u0000~\u0000\u0002L\u0000\tnameClassq\u0000~\u0000\u0007xq"
+"\u0000~\u0000\u0003q\u0000~\u0000&psq\u0000~\u0000\u000bppsr\u0000\"com.sun.msv.datatype.xsd.QnameType\u0000\u0000\u0000\u0000"
+"\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u001dq\u0000~\u0000 t\u0000\u0005QNamesr\u00005com.sun.msv.datatype.xsd.White"
+"SpaceProcessor$Collapse\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u001aq\u0000~\u0000$sq\u0000~\u0000\'q\u0000~\u00001q\u0000~\u0000"
+" sr\u0000#com.sun.msv.grammar.SimpleNameClass\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0002L\u0000\tlocalN"
+"ameq\u0000~\u0000\u0014L\u0000\fnamespaceURIq\u0000~\u0000\u0014xr\u0000\u001dcom.sun.msv.grammar.NameClas"
+"s\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xpt\u0000\u0004typet\u0000)http://www.w3.org/2001/XMLSchema-ins"
+"tancesr\u00000com.sun.msv.grammar.Expression$EpsilonExpression\u0000\u0000\u0000"
+"\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0000xq\u0000~\u0000\u0003sq\u0000~\u0000%\u0001q\u0000~\u0000;sq\u0000~\u00005t\u0000\u0006CODIGOq\u0000~\u0000\u0018sq\u0000~\u0000\u0006pp\u0000sq\u0000~\u0000"
+"\u0000ppsq\u0000~\u0000\u000bppsr\u0000\'com.sun.msv.datatype.xsd.MaxLengthFacet\u0000\u0000\u0000\u0000\u0000\u0000"
+"\u0000\u0001\u0002\u0000\u0001I\u0000\tmaxLengthxq\u0000~\u0000\u0010q\u0000~\u0000\u0018pq\u0000~\u0000\u001b\u0000\u0001sr\u0000\'com.sun.msv.datatype"
+".xsd.MinLengthFacet\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001I\u0000\tminLengthxq\u0000~\u0000\u0010q\u0000~\u0000\u0018pq\u0000~\u0000\u001b\u0000"
+"\u0000q\u0000~\u0000\u001fq\u0000~\u0000\u001ft\u0000\tminLength\u0000\u0000\u0000\u0001q\u0000~\u0000\u001ft\u0000\tmaxLength\u0000\u0000\u0000\u00ffq\u0000~\u0000$sq\u0000~\u0000\'t"
+"\u0000\u000estring-derivedq\u0000~\u0000\u0018sq\u0000~\u0000*ppsq\u0000~\u0000,q\u0000~\u0000&pq\u0000~\u0000.q\u0000~\u00007q\u0000~\u0000;sq\u0000~"
+"\u00005t\u0000\u000bDESCRIPCIONq\u0000~\u0000\u0018sr\u0000\"com.sun.msv.grammar.ExpressionPool\u0000"
+"\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0002\u0000\u0001L\u0000\bexpTablet\u0000/Lcom/sun/msv/grammar/ExpressionPool$"
+"ClosedHash;xpsr\u0000-com.sun.msv.grammar.ExpressionPool$ClosedHa"
+"sh\u00d7j\u00d0N\u00ef\u00e8\u00ed\u001c\u0003\u0000\u0003I\u0000\u0005countB\u0000\rstreamVersionL\u0000\u0006parentt\u0000$Lcom/sun/ms"
+"v/grammar/ExpressionPool;xp\u0000\u0000\u0000\u0005\u0001pq\u0000~\u0000\u0005q\u0000~\u0000\nq\u0000~\u0000+q\u0000~\u0000Jq\u0000~\u0000@x"));
        }
        return new com.sun.msv.verifier.regexp.REDocumentDeclaration(schemaFragment);
    }

    public class Unmarshaller
        extends org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.AbstractUnmarshallingEventHandlerImpl
    {


        public Unmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context) {
            super(context, "-------");
        }

        protected Unmarshaller(org.notariado.ancert.xml.plusvalias.liquidacion.impl.runtime.UnmarshallingContext context, int startState) {
            this(context);
            state = startState;
        }

        public java.lang.Object owner() {
            return org.notariado.ancert.xml.plusvalias.liquidacion.impl.ActoJuridicoTypeImpl.this;
        }

        public void enterElement(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname, org.xml.sax.Attributes __atts)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  6 :
                        revertToParentFromEnterElement(___uri, ___local, ___qname, __atts);
                        return ;
                    case  3 :
                        if (("DESCRIPCION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 4;
                            return ;
                        }
                        break;
                    case  0 :
                        if (("CODIGO" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.pushAttributes(__atts, true);
                            state = 1;
                            return ;
                        }
                        break;
                }
                super.enterElement(___uri, ___local, ___qname, __atts);
                break;
            }
        }

        public void leaveElement(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  6 :
                        revertToParentFromLeaveElement(___uri, ___local, ___qname);
                        return ;
                    case  5 :
                        if (("DESCRIPCION" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 6;
                            return ;
                        }
                        break;
                    case  2 :
                        if (("CODIGO" == ___local)&&("http://ancert.notariado.org/XML/Plusvalias/Liquidacion" == ___uri)) {
                            context.popAttributes();
                            state = 3;
                            return ;
                        }
                        break;
                }
                super.leaveElement(___uri, ___local, ___qname);
                break;
            }
        }

        public void enterAttribute(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  6 :
                        revertToParentFromEnterAttribute(___uri, ___local, ___qname);
                        return ;
                }
                super.enterAttribute(___uri, ___local, ___qname);
                break;
            }
        }

        public void leaveAttribute(java.lang.String ___uri, java.lang.String ___local, java.lang.String ___qname)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                switch (state) {
                    case  6 :
                        revertToParentFromLeaveAttribute(___uri, ___local, ___qname);
                        return ;
                }
                super.leaveAttribute(___uri, ___local, ___qname);
                break;
            }
        }

        public void handleText(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            int attIdx;
            outer:
            while (true) {
                try {
                    switch (state) {
                        case  1 :
                            eatText1(value);
                            state = 2;
                            return ;
                        case  6 :
                            revertToParentFromText(value);
                            return ;
                        case  4 :
                            eatText2(value);
                            state = 5;
                            return ;
                    }
                } catch (java.lang.RuntimeException e) {
                    handleUnexpectedTextException(value, e);
                }
                break;
            }
        }

        private void eatText1(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _CODIGO = value;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

        private void eatText2(final java.lang.String value)
            throws org.xml.sax.SAXException
        {
            try {
                _DESCRIPCION = value;
            } catch (java.lang.Exception e) {
                handleParseConversionException(e);
            }
        }

    }

}