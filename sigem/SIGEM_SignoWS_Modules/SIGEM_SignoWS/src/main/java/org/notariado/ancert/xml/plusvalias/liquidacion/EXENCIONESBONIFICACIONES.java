//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v@@BUILD_VERSION@@ 
// 	See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// 	Any modifications to this file will be lost upon recompilation of the source schema. 
// 	Generated on: 2011.07.04 en 12:38:50 CEST 
//


package org.notariado.ancert.xml.plusvalias.liquidacion;


/**
 * Mensaje de intercambio sincrono que permite obtener las bonificaciones y exenciones disponibles.
 * Java content class for EXENCIONES_BONIFICACIONES element declaration.
 * 	<p>The following schema fragment specifies the expected 	content contained within this java content object. 	(defined at file:/C:/Sun/jwsdp-1.5/jaxb/bin/IIVTNU-WS-Ayto.xsd line 655)
 * <p>
 * <pre>
 * &lt;element name="EXENCIONES_BONIFICACIONES">
 *   &lt;complexType>
 *     &lt;complexContent>
 *       &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *         &lt;sequence>
 *           &lt;choice>
 *             &lt;element name="REQUEST">
 *               &lt;complexType>
 *                 &lt;complexContent>
 *                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                     &lt;sequence>
 *                       &lt;element name="CABECERA" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}CabeceraType"/>
 *                       &lt;element name="INE_MUNICIPIO" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}CODIGO_MUNICIPIOType"/>
 *                       &lt;element name="INE_PROVINCIA" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}CODIGO_PROVINCIAType"/>
 *                     &lt;/sequence>
 *                   &lt;/restriction>
 *                 &lt;/complexContent>
 *               &lt;/complexType>
 *             &lt;/element>
 *             &lt;element name="REPLY">
 *               &lt;complexType>
 *                 &lt;complexContent>
 *                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                     &lt;sequence>
 *                       &lt;element name="CABECERA" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}CabeceraType"/>
 *                       &lt;sequence minOccurs="0">
 *                         &lt;element name="BONIFICACIONES" minOccurs="0">
 *                           &lt;complexType>
 *                             &lt;complexContent>
 *                               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                 &lt;sequence>
 *                                   &lt;element name="BONIFICACION" maxOccurs="unbounded">
 *                                     &lt;complexType>
 *                                       &lt;complexContent>
 *                                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                           &lt;sequence>
 *                                             &lt;element name="PORCENTAJE" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}PORCENTAJEType"/>
 *                                             &lt;element name="CONCEPTO" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                             &lt;element name="DESCRIPCION" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                           &lt;/sequence>
 *                                         &lt;/restriction>
 *                                       &lt;/complexContent>
 *                                     &lt;/complexType>
 *                                   &lt;/element>
 *                                 &lt;/sequence>
 *                               &lt;/restriction>
 *                             &lt;/complexContent>
 *                           &lt;/complexType>
 *                         &lt;/element>
 *                         &lt;element name="EXENCIONES" minOccurs="0">
 *                           &lt;complexType>
 *                             &lt;complexContent>
 *                               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                 &lt;sequence>
 *                                   &lt;element name="EXENCION" maxOccurs="unbounded">
 *                                     &lt;complexType>
 *                                       &lt;complexContent>
 *                                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                           &lt;sequence>
 *                                             &lt;element name="PORCENTAJE" type="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}PORCENTAJEType"/>
 *                                             &lt;element name="CONCEPTO" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                             &lt;element name="DESCRIPCION" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                           &lt;/sequence>
 *                                         &lt;/restriction>
 *                                       &lt;/complexContent>
 *                                     &lt;/complexType>
 *                                   &lt;/element>
 *                                 &lt;/sequence>
 *                               &lt;/restriction>
 *                             &lt;/complexContent>
 *                           &lt;/complexType>
 *                         &lt;/element>
 *                       &lt;/sequence>
 *                       &lt;element name="RESULTADO">
 *                         &lt;complexType>
 *                           &lt;complexContent>
 *                             &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                               &lt;sequence>
 *                                 &lt;element name="RETORNO" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *                                 &lt;element name="ERROR" minOccurs="0">
 *                                   &lt;complexType>
 *                                     &lt;complexContent>
 *                                       &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                         &lt;sequence>
 *                                           &lt;element name="CODIGO">
 *                                             &lt;restriction base="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}STRINGType">
 *                                               &lt;length value="4"/>
 *                                             &lt;/restriction>
 *                                           &lt;/element>
 *                                           &lt;element name="DESCRIPCION">
 *                                             &lt;restriction base="{http://ancert.notariado.org/XML/Plusvalias/Liquidacion}STRINGType">
 *                                               &lt;minLength value="1"/>
 *                                               &lt;maxLength value="255"/>
 *                                             &lt;/restriction>
 *                                           &lt;/element>
 *                                         &lt;/sequence>
 *                                       &lt;/restriction>
 *                                     &lt;/complexContent>
 *                                   &lt;/complexType>
 *                                 &lt;/element>
 *                               &lt;/sequence>
 *                             &lt;/restriction>
 *                           &lt;/complexContent>
 *                         &lt;/complexType>
 *                       &lt;/element>
 *                     &lt;/sequence>
 *                   &lt;/restriction>
 *                 &lt;/complexContent>
 *               &lt;/complexType>
 *             &lt;/element>
 *           &lt;/choice>
 *         &lt;/sequence>
 *       &lt;/restriction>
 *     &lt;/complexContent>
 *   &lt;/complexType>
 * &lt;/element>
 * </pre>
 * 
 */
public interface EXENCIONESBONIFICACIONES
    extends javax.xml.bind.Element, org.notariado.ancert.xml.plusvalias.liquidacion.EXENCIONESBONIFICACIONESType
{


}