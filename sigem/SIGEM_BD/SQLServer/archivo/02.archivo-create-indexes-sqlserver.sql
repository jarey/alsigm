-------------
-- SISTEMA --
-------------

-- Tabla: AGFORMATO
CREATE UNIQUE INDEX AGFORMATO1 ON AGFORMATO (ID);
CREATE INDEX AGFORMATO2 ON AGFORMATO (VIGENTE);

-- Tabla: AGARCHIVO
CREATE UNIQUE INDEX AGARCHIVO1 ON AGARCHIVO(ID);

-- Tabla: AGNIVELARCHIVO
CREATE UNIQUE INDEX AGNIVELARCHIVO01 ON AGNIVELARCHIVO(ID);
CREATE INDEX AGNIVELARCHIVO02 ON AGNIVELARCHIVO(ORDEN);

-- Tabla: AGOBJBLOQUEO
CREATE UNIQUE INDEX AGOBJBLOQUEO1 ON AGOBJBLOQUEO(TIPOOBJ, IDOBJ, MODULO);

-- Tabla: AGINFOSISTEMA
CREATE UNIQUE INDEX AGINFOSISTEMA1 ON AGINFOSISTEMA(AUTID);

-----------------------
-- CONTROL DE ACCESO --
-----------------------
-- Tabla: ASCAUSUARIO
CREATE UNIQUE INDEX ASCAUSUARIO1 ON ASCAUSUARIO (ID);

-- Tabla: ASCAORGANO
CREATE UNIQUE INDEX ASCAORGANO1 ON ASCAORGANO (ID);
CREATE INDEX ASCAORGANO2 ON ASCAORGANO (CODIGO);
CREATE INDEX ASCAORGANO3 ON ASCAORGANO (SISTEXTGESTOR, IDORGSEXTGESTOR);

-- Tabla: ASCAUSRORG
CREATE INDEX ASCAUSRORG1 ON ASCAUSRORG (IDUSUARIO);

-- Tabla:  ASCAGRUPO
CREATE UNIQUE INDEX ASCAGRUPO1 ON ASCAGRUPO (ID);
CREATE UNIQUE INDEX ASCAGRUPO2 ON ASCAGRUPO (NOMBRE);

-- Tabla: ASCAUSRGRP
CREATE INDEX ASCAUSRGRP1 ON ASCAUSRGRP (IDUSUARIO);
CREATE INDEX ASCAUSRGRP2 ON ASCAUSRGRP (IDGRUPO);

-- Tabla: ASCAROL
CREATE UNIQUE INDEX ASCAROL1 ON ASCAROL (ID);
CREATE UNIQUE INDEX ASCAROL2 ON ASCAROL (NOMBRE);

-- Tabla: ASCAPERMGENROL
CREATE INDEX ASCAPERMGENROL1 ON ASCAPERMGENROL (IDROL);
CREATE INDEX ASCAPERMGENROL2 ON ASCAPERMGENROL (PERM);

-- Tabla: ASCAROLUSR
CREATE INDEX ASCAROLUSR1 ON ASCAROLUSR (IDUSUARIO);
CREATE UNIQUE INDEX ASCAROLUSR2 ON ASCAROLUSR (IDROL, IDUSUARIO);

-- Tabla: ASCALISTCA
CREATE UNIQUE INDEX ASCALISTCA1 ON ASCALISTCA (ID);
CREATE UNIQUE INDEX ASCALISTCA2 ON ASCALISTCA (NOMBRE);

-- Tabla: ASCAPERMLISTCA
CREATE INDEX ASCAPERMLISTCA1 ON ASCAPERMLISTCA (IDLISTCA);
CREATE INDEX ASCAPERMLISTCA2 ON ASCAPERMLISTCA (TIPODEST, IDDEST);
CREATE INDEX ASCAPERMLISTCA3 ON ASCAPERMLISTCA (TIPODEST, IDDEST, IDLISTCA);

--------------------
-- TRANSFERENCIAS --
--------------------

-- Tabla: ASGTPREVISION
CREATE UNIQUE INDEX ASGTPREVISION1	ON ASGTPREVISION (ID);
CREATE INDEX ASGTPREVISION2	ON ASGTPREVISION (TIPOTRANSFERENCIA);
CREATE INDEX ASGTPREVISION3	ON ASGTPREVISION (ESTADO);
CREATE INDEX ASGTPREVISION4	ON ASGTPREVISION (ANO);
CREATE INDEX ASGTPREVISION5	ON ASGTPREVISION (IDUSRGESTOR);

-- Tabla:  ASGTDETALLEPREV
CREATE UNIQUE INDEX ASGTDETALLEPREV1 ON ASGTDETALLEPREV (ID);
CREATE INDEX ASGTDETALLEPREV2 ON ASGTDETALLEPREV (IDPREVISION);

-- Tabla: ASGTRENTREGA
CREATE UNIQUE INDEX ASGTRENTREGA1 ON ASGTRENTREGA (ID);
CREATE INDEX ASGTRENTREGA2 ON ASGTRENTREGA (TIPOTRANSFERENCIA);
CREATE INDEX ASGTRENTREGA3 ON ASGTRENTREGA (ESTADO);
CREATE INDEX ASGTRENTREGA4 ON ASGTRENTREGA (ANO);
CREATE INDEX ASGTRENTREGA5 ON ASGTRENTREGA (IDUSRGESTORREM);
CREATE INDEX ASGTRENTREGA6 ON ASGTRENTREGA (IDUSRGESTORARCHIVOREC);

-- Tabla: ASGTSNSEC
CREATE UNIQUE INDEX ASGTSNSEC1 ON ASGTSNSEC (TIPO, ANO, IDARCHIVO);

-- Tabla: ASGTUNIDADDOCRE
CREATE UNIQUE INDEX ASGTUNIDADDOCRE1 ON ASGTUNIDADDOCRE (ID);
CREATE INDEX ASGTUNIDADDOCRE2 ON ASGTUNIDADDOCRE (IDRELENTREGA);
CREATE INDEX ASGTUNIDADDOCRE3 ON ASGTUNIDADDOCRE (TIPOTRANSFERENCIA, NUMEXP);
CREATE INDEX ASGTUNIDADDOCRE4 ON ASGTUNIDADDOCRE (SINDOCSFISICOS);

--Tabla: ASGTUINSTALACIONRE
CREATE UNIQUE INDEX ASGTUINSTALACIONRE1 ON ASGTUINSTALACIONRE (ID);
CREATE INDEX ASGTUINSTALACIONRE2 ON ASGTUINSTALACIONRE (IDRELENTREGA);

--Tabla: ASGTUINSTALACIONREEA
CREATE INDEX ASGTUINSTALACIONREEA1 ON ASGTUINSTALACIONREEA (IDUIDEPOSITO);
CREATE INDEX ASGTUINSTALACIONREEA2 ON ASGTUINSTALACIONREEA (IDRELENTREGA);

-- Tabla: ASGTUDOCENUI
CREATE INDEX ASGTUDOCENUI1 ON ASGTUDOCENUI (IDRELENTREGA);
CREATE INDEX ASGTUDOCENUI2 ON ASGTUDOCENUI (IDUINSTALACIONRE);
CREATE INDEX ASGTUDOCENUI3 ON ASGTUDOCENUI (IDUNIDADDOC, IDUINSTALACIONRE);

-- Tabla: ASGTUDOCSDF
CREATE UNIQUE INDEX ASGTUDOCSDF1 ON ASGTUDOCSDF (ID);
CREATE UNIQUE INDEX ASGTUDOCSDF2 ON ASGTUDOCSDF (ID, IDRELENTREGA);

--------------
-- DEPOSITO --
--------------

-- Tabla: ASGDTIPOELEMENTO
CREATE UNIQUE INDEX ASGDTIPOELEMENTO1 ON ASGDTIPOELEMENTO (ID);
CREATE UNIQUE INDEX ASGDTIPOELEMENTO2 ON ASGDTIPOELEMENTO (NOMBRE);

-- Tabla: ASGDDEPOSITO
CREATE UNIQUE INDEX ASGDDEPOSITO1 ON ASGDDEPOSITO (ID);
CREATE UNIQUE INDEX ASGDDEPOSITO2 ON ASGDDEPOSITO (NOMBRE);

-- Tabla: ASGDDEPOSITOELECTRONICO
CREATE UNIQUE INDEX ASGDDEPOSITOELECTRONICO1 ON ASGDDEPOSITOELECTRONICO (ID);

-- Tabla: ASGDELEMNOASIG
CREATE UNIQUE INDEX ASGDELEMNOASIG1 ON ASGDELEMNOASIG (ID);
CREATE INDEX ASGDELEMNOASIG2 ON ASGDELEMNOASIG (IDPADRE);
CREATE UNIQUE INDEX ASGDELEMNOASIG3 ON ASGDELEMNOASIG (CODORDEN, IDDEPOSITO);

-- Tabla: ASGDELEMASIG
CREATE UNIQUE INDEX ASGDELEMASIG1 ON ASGDELEMASIG (ID);
CREATE INDEX ASGDELEMASIG2 ON ASGDELEMASIG (IDELEMNAPADRE);
CREATE INDEX ASGDELEMASIG3 ON ASGDELEMASIG (IDDEPOSITO);
CREATE UNIQUE INDEX ASGDELEMASIG4 ON ASGDELEMASIG (CODORDEN, IDDEPOSITO);

-- Tabla: ASGDHUECO
CREATE UNIQUE INDEX ASGDHUECO1 ON ASGDHUECO (IDELEMAPADRE, NUMORDEN);
CREATE INDEX ASGDHUECO2 ON ASGDHUECO (IDELEMAPADRE);
CREATE INDEX ASGDHUECO3 ON ASGDHUECO (IDDEPOSITO);
CREATE INDEX ASGDHUECO4 ON ASGDHUECO (ESTADO);
CREATE INDEX ASGDHUECO5 ON ASGDHUECO (ESTADO, IDDEPOSITO);
CREATE INDEX ASGDHUECO6 ON ASGDHUECO (ESTADO, IDFORMATO);
CREATE INDEX ASGDHUECO7 ON ASGDHUECO (CODORDEN, TIPOORD);
CREATE UNIQUE INDEX ASGDHUECO8 ON ASGDHUECO (CODORDEN, IDDEPOSITO);

-- Tabla: ASGDSIGNUMORDEN
CREATE UNIQUE INDEX ASGDSIGNUMORDEN1 ON ASGDSIGNUMORDEN (IDTIPOELEMPADRE, IDELEMPADRE, IDTIPOELEMENTO);

-- Tabla: ASGDUINSTALACION
CREATE UNIQUE INDEX ASGDUINSTALACION1 ON ASGDUINSTALACION (ID);
CREATE INDEX ASGDUINSTALACION2 ON ASGDUINSTALACION (SIGNATURAUI);
CREATE INDEX ASGDUINSTALACION3 ON ASGDUINSTALACION (IDENTIFICACION);

-- Tabla: ASGDHISTUINSTALACION
CREATE UNIQUE INDEX ASGDHISTUINSTALACION1 ON ASGDHISTUINSTALACION(ID);
CREATE INDEX ASGDHISTUINSTALACION2 ON ASGDHISTUINSTALACION(SIGNATURAUI);
CREATE INDEX ASGDHISTUINSTALACION3 ON ASGDHISTUINSTALACION(ID,FELIMINACION);
CREATE INDEX ASGDHISTUINSTALACION4 ON ASGDHISTUINSTALACION(IDARCHIVO);

-- Tabla: ASGDUDOCENUI
CREATE INDEX ASGDUDOCENUI1 ON ASGDUDOCENUI (IDENTIFICACION);
CREATE INDEX ASGDUDOCENUI2 ON ASGDUDOCENUI (IDUINSTALACION);
CREATE INDEX ASGDUDOCENUI3 ON ASGDUDOCENUI (IDUNIDADDOC);
CREATE INDEX ASGDUDOCENUI4 ON ASGDUDOCENUI (IDUDOCRE);
CREATE INDEX ASGDUDOCENUI5 ON ASGDUDOCENUI (SIGNATURAUDOC);

-----------------
-- SOLICUTUDES --
-----------------

-- Tabla: ASGPPRESTAMO
CREATE UNIQUE INDEX ASGPPRESTAMO1 ON ASGPPRESTAMO (ID);
CREATE INDEX ASGPPRESTAMO2 ON ASGPPRESTAMO (NUSRSOLICITANTE);
CREATE INDEX ASGPPRESTAMO3 ON ASGPPRESTAMO (IDUSRSOLICITANTE);
CREATE INDEX ASGPPRESTAMO4 ON ASGPPRESTAMO (ESTADO);

-- Tabla: ASGPMTVPRESTAMO
CREATE UNIQUE INDEX ASGPMTVPRESTAMO1 ON ASGPMTVPRESTAMO(ID);

-- Tabla:  ASGPSOLICITUDUDOC
CREATE INDEX ASGPSOLICITUDUDOC1 ON ASGPSOLICITUDUDOC (IDSOLICITUD, TIPOSOLICITUD, IDUDOC, SIGNATURAUDOC);
CREATE INDEX ASGPSOLICITUDUDOC2 ON ASGPSOLICITUDUDOC (IDSOLICITUD, TIPOSOLICITUD);
CREATE INDEX ASGPSOLICITUDUDOC3 ON ASGPSOLICITUDUDOC (IDUDOC);
CREATE INDEX ASGPSOLICITUDUDOC4 ON ASGPSOLICITUDUDOC (SIGNATURAUDOC);
CREATE INDEX ASGPSOLICITUDUDOC5 ON ASGPSOLICITUDUDOC (IDUDOC, ESTADO);

-- Tabla: ASGPSNSEC
CREATE UNIQUE INDEX ASGPSNSEC1 ON ASGPSNSEC (TIPO, ANO);

-- Tabla: ASGPPRORROGA
CREATE INDEX ASGPPRORROGA1 ON ASGPPRORROGA (IDPRESTAMO,ESTADO);


-- Tabla: ASGPCONSULTA
CREATE UNIQUE INDEX ASGPCONSULTA1 ON ASGPCONSULTA (ID);
CREATE INDEX ASGPCONSULTA2 ON ASGPCONSULTA (NUSRCONSULTOR);
CREATE INDEX ASGPCONSULTA3 ON ASGPCONSULTA (IDUSRSOLICITANTE);
CREATE INDEX ASGPCONSULTA4 ON ASGPCONSULTA (ESTADO);
CREATE INDEX ASGPCONSULTA5 ON ASGPCONSULTA (ESTADO) INCLUDE (NUSRCONSULTOR, IDARCHIVO);
CREATE INDEX ASGPCONSULTA6 ON ASGPCONSULTA (ESTADO) INCLUDE (NORGCONSULTOR, IDARCHIVO);

-- Tabla: ASGPMTVCONSULTA
CREATE INDEX ASGPMTVCONSULTA1 ON ASGPMTVCONSULTA (TIPOCONSULTA, TIPOENTIDAD);
CREATE UNIQUE INDEX ASGPMTVCONSULTA2 ON ASGPMTVCONSULTA(ID);

-- Tabla: ASGPMTVRECHAZO
CREATE INDEX ASGPMTVRECHAZO1 ON ASGPMTVRECHAZO (TIPOSOLICITUD);
CREATE UNIQUE INDEX ASGPMTVRECHAZO2 ON ASGPMTVRECHAZO(ID);

-- Tabla: ASGPTEMA
CREATE INDEX ASGPTEMA1 ON ASGPTEMA (TIPOENTIDAD, IDUSUARIO);

-- ASGPREVDOCUDOC
CREATE UNIQUE INDEX ASGPREVDOCUDOC1 ON ASGPREVDOCUDOC (IDREVDOC);
CREATE INDEX ASGPREVDOCUDOC2 ON ASGPREVDOCUDOC (IDUDOC);
CREATE INDEX ASGPREVDOCUDOC3 ON ASGPREVDOCUDOC (IDUDOC, ESTADO);

-----------------
-- DESCRIPCION --
-----------------

-- Tabla: ADAREA
CREATE UNIQUE INDEX ADAREA1 ON ADAREA (ID);
CREATE INDEX ADAREA2 ON ADAREA (TIPONORMA);
CREATE UNIQUE INDEX ADAREA3 ON ADAREA (NOMBRE, TIPONORMA);

-- Tabla: ADCAMPOTBL
CREATE UNIQUE INDEX ADCAMPOTBL1 ON ADCAMPOTBL (ID);
CREATE INDEX ADCAMPOTBL2 ON ADCAMPOTBL (TIPONORMA);
CREATE UNIQUE INDEX ADCAMPOTBL3 ON ADCAMPOTBL (NOMBRE);
CREATE INDEX ADCAMPOTBL4 ON ADCAMPOTBL (IDAREA);
CREATE UNIQUE INDEX ADCAMPOTBL5 ON ADCAMPOTBL (ETIQUETAXML);

-- Tabla: ADCAMPODATO
CREATE UNIQUE INDEX ADCAMPODATO1 ON ADCAMPODATO (ID);
CREATE INDEX ADCAMPODATO2 ON ADCAMPODATO (TIPONORMA);
CREATE UNIQUE INDEX ADCAMPODATO3 ON ADCAMPODATO (NOMBRE);
CREATE INDEX ADCAMPODATO4 ON ADCAMPODATO (IDAREA);
CREATE INDEX ADCAMPODATO5 ON ADCAMPODATO (IDTBLPADRE);
CREATE UNIQUE INDEX ADCAMPODATO6 ON ADCAMPODATO (ETIQUETAXML);

-- Tabla: ADFICHA
CREATE UNIQUE INDEX ADFICHA1 ON ADFICHA (ID);
CREATE INDEX ADFICHA2 ON ADFICHA (TIPONORMA);
CREATE INDEX ADFICHA3 ON ADFICHA (TIPONIVEL);

-- Tabla: ADFMTFICHA
CREATE UNIQUE INDEX ADFMTFICHA1 ON ADFMTFICHA (ID);
CREATE INDEX ADFMTFICHA2 ON ADFMTFICHA (IDFICHA, TIPO);

-- Tabla: ADFMTPREF
CREATE INDEX ADFMTPREF1 ON ADFMTPREF (IDFICHA, IDUSUARIO, TIPOFMT);

-- Tabla: ADTEXTTBLVLD
CREATE INDEX ADTEXTTBLVLD1 ON ADTEXTTBLVLD (IDTBLVLD);
CREATE UNIQUE INDEX ADTEXTTBLVLD2 ON ADTEXTTBLVLD (ID);

-- Tabla: ADCTLGLISTAD
CREATE UNIQUE INDEX ADCTLGLISTAD1 ON ADCTLGLISTAD (ID);
CREATE INDEX ADCTLGLISTAD2 ON ADCTLGLISTAD (TIPODESCRIPTOR);

-- Tabla: ADCTLGTBLVLD
CREATE UNIQUE INDEX ADCTLGTBLVLD1 ON ADCTLGTBLVLD (ID);

-- Tabla: ADDESCRIPTOR
CREATE UNIQUE INDEX ADDESCRIPTOR1 ON ADDESCRIPTOR (ID);
CREATE INDEX ADDESCRIPTOR2 ON ADDESCRIPTOR (IDLISTA);
CREATE INDEX ADDESCRIPTOR3 ON ADDESCRIPTOR (TIPO);
CREATE UNIQUE INDEX ADDESCRIPTOR4 ON ADDESCRIPTOR (IDLISTA, NOMBRE);
CREATE INDEX ADDESCRIPTOR5 ON ADDESCRIPTOR (NIVELACCESO);

-- Tabla: ADUSOOBJETO
CREATE UNIQUE INDEX ADUSOOBJETO1 ON ADUSOOBJETO (IDOBJ,TIPOOBJ,IDOBJUSUARIO,TIPOOBJUSUARIO);

-- Tabla: ADVCTEXTCF
CREATE UNIQUE INDEX ADVCTEXTCF1 ON ADVCTEXTCF (IDELEMENTOCF, IDCAMPO, ORDEN);
CREATE INDEX ADVCTEXTCF2  ON ADVCTEXTCF  (IDELEMENTOCF);
CREATE INDEX ADVCTEXTCF3  ON ADVCTEXTCF  (IDCAMPO, VALOR);

-- Tabla: ADVCTEXTLCF
CREATE UNIQUE INDEX ADVCTEXTLCF1 ON ADVCTEXTLCF (IDELEMENTOCF, IDCAMPO, ORDEN);
CREATE INDEX ADVCTEXTLCF2 ON ADVCTEXTLCF (IDELEMENTOCF);

-- Tabla: ADVCNUMCF
CREATE UNIQUE INDEX ADVCNUMCF1 ON ADVCNUMCF (IDELEMENTOCF, IDCAMPO, ORDEN);
CREATE INDEX ADVCNUMCF2   ON ADVCNUMCF   (IDELEMENTOCF);
CREATE INDEX ADVCNUMCF3   ON ADVCNUMCF   (IDCAMPO, VALOR);

-- Tabla: ADVCFECHACF
CREATE UNIQUE INDEX ADVCFECHACF1 ON ADVCFECHACF (IDELEMENTOCF, IDCAMPO, ORDEN);
CREATE INDEX ADVCFECHACF2 ON ADVCFECHACF (IDELEMENTOCF);
CREATE INDEX ADVCFECHACF3 ON ADVCFECHACF (IDCAMPO, FECHAINI );
CREATE INDEX ADVCFECHACF4 ON ADVCFECHACF (IDCAMPO, FECHAFIN);
CREATE INDEX ADVCFECHACF5 ON ADVCFECHACF (IDCAMPO, FECHAINI, FECHAFIN, CALIFICADOR);
CREATE INDEX ADVCFECHACF6 ON ADVCFECHACF (IDCAMPO) INCLUDE (IDELEMENTOCF);
CREATE INDEX ADVCFECHACF7 ON ADVCFECHACF (IDCAMPO) INCLUDE (IDELEMENTOCF, FECHAINI);
CREATE INDEX ADVCFECHACF8 ON ADVCFECHACF (IDCAMPO) INCLUDE (IDELEMENTOCF, FECHAFIN);

-- Tabla: ADVCREFCF
CREATE UNIQUE INDEX ADVCREFCF1 ON ADVCREFCF (IDELEMENTOCF, IDCAMPO, ORDEN);
CREATE INDEX ADVCREFCF2   ON ADVCREFCF (IDELEMENTOCF);
CREATE INDEX ADVCREFCF3   ON ADVCREFCF (TIPOOBJREF, IDOBJREF);
CREATE INDEX ADVCREFCF4   ON ADVCREFCF (IDCAMPO, IDOBJREF );
CREATE INDEX ADVCREFCF5   ON ADVCREFCF (IDOBJREF );

-- Tabla: ADVCTEXTDESCR
CREATE UNIQUE INDEX ADVCTEXTDESCR1 ON ADVCTEXTDESCR (IDDESCR, IDCAMPO, ORDEN);
CREATE INDEX ADVCTEXTDESCR2 ON ADVCTEXTDESCR (IDDESCR);
CREATE INDEX ADVCTEXTDESCR3 ON ADVCTEXTDESCR (IDCAMPO, VALOR);

-- Tabla: ADVCTEXTLDESCR
CREATE UNIQUE INDEX ADVCTEXTLDESCR1 ON ADVCTEXTLDESCR (IDDESCR, IDCAMPO, ORDEN);
CREATE INDEX ADVCTEXTLDESCR2 ON ADVCTEXTLDESCR (IDDESCR);

-- Tabla: ADVCNUMDESCR
CREATE UNIQUE INDEX ADVCNUMDESCR1 ON ADVCNUMDESCR (IDDESCR, IDCAMPO, ORDEN);
CREATE INDEX ADVCNUMDESCR2 ON ADVCNUMDESCR (IDDESCR);
CREATE INDEX ADVCNUMDESCR3 ON ADVCNUMDESCR (IDCAMPO, VALOR);

-- Tabla: ADVCFECHADESCR
CREATE UNIQUE INDEX ADVCFECHADESCR1 ON ADVCFECHADESCR (IDDESCR, IDCAMPO, ORDEN);
CREATE INDEX ADVCFECHADESCR2 ON ADVCFECHADESCR (IDDESCR);
CREATE INDEX ADVCFECHADESCR3 ON ADVCFECHADESCR (IDCAMPO, FECHAINI );
CREATE INDEX ADVCFECHADESCR4 ON ADVCFECHADESCR (IDCAMPO, FECHAFIN);
CREATE INDEX ADVCFECHADESCR5 ON ADVCFECHADESCR (IDCAMPO, FECHAINI, FECHAFIN, CALIFICADOR);

-- Tabla: ADVCREFDESCR
CREATE UNIQUE INDEX ADVCREFDESCR1 ON ADVCREFDESCR (IDDESCR, IDCAMPO, ORDEN);
CREATE INDEX ADVCREFDESCR2 ON ADVCREFDESCR (IDDESCR);
CREATE INDEX ADVCREFDESCR3 ON ADVCREFDESCR (TIPOOBJREF, IDOBJREF);
CREATE INDEX ADVCREFDESCR4 ON ADVCREFDESCR (IDCAMPO, IDOBJREF );

-- Tabla: ASGTMAPDESCRUDOC
CREATE UNIQUE INDEX ASGTMAPDESCRUDOC1 ON ASGTMAPDESCRUDOC (IDFICHA);

------------
-- FONDOS --
------------

--Tabla: ASGFNIVELCF
CREATE UNIQUE INDEX ASGFNIVELCF1 ON ASGFNIVELCF (ID);
CREATE INDEX ASGFNIVELCF2 ON ASGFNIVELCF (TIPO);

-- Tabla: ASGFESTRUCTJNIVCF
CREATE UNIQUE INDEX ASGFESTRUCTJNIVCF1 ON ASGFESTRUCTJNIVCF (IDNIVELPADRE, IDNIVELHIJO);
CREATE INDEX ASGFESTRUCTJNIVCF2 ON ASGFESTRUCTJNIVCF (IDNIVELPADRE);

-- Tabla: ASGFELEMENTOCF
CREATE UNIQUE INDEX ASGFELEMENTOCF1 ON ASGFELEMENTOCF (ID);
CREATE UNIQUE INDEX ASGFELEMENTOCF2 ON ASGFELEMENTOCF (ID, TIPO);
CREATE INDEX ASGFELEMENTOCF3 ON ASGFELEMENTOCF (IDPADRE);
CREATE INDEX ASGFELEMENTOCF4 ON ASGFELEMENTOCF (ESTADO);
CREATE INDEX ASGFELEMENTOCF5 ON ASGFELEMENTOCF (IDFONDO);
CREATE INDEX ASGFELEMENTOCF6 ON ASGFELEMENTOCF (IDNIVEL);
CREATE INDEX ASGFELEMENTOCF7 ON ASGFELEMENTOCF (NIVELACCESO, IDARCHIVO, IDLCA);
CREATE INDEX ASGFELEMENTOCF8 ON ASGFELEMENTOCF (CODIGO);
CREATE INDEX ASGFELEMENTOCF9 ON ASGFELEMENTOCF (ESTADO, IDNIVEL) INCLUDE (ID, CODREFERENCIA);
CREATE INDEX ASGFELEMENTOCF10 ON ASGFELEMENTOCF (IDNIVEL, ESTADO) INCLUDE (ID, CODREFERENCIA);
CREATE INDEX ASGFELEMENTOCF11 ON ASGFELEMENTOCF (IDNIVEL, IDPADRE, ESTADO) INCLUDE (ID);
CREATE INDEX ASGFELEMENTOCF12 ON ASGFELEMENTOCF (IDPADRE, ESTADO) INCLUDE (ID, IDNIVEL);
CREATE INDEX ASGFELEMENTOCF13 ON ASGFELEMENTOCF (IDNIVEL, IDPADRE, ESTADO) INCLUDE (ID, TIPO, CODIGO, TITULO, IDFONDO, CODREFFONDO, FINALCODREFPADRE, CODREFERENCIA, IDELIMINACION, IDFICHADESCR, TIENEDESCR, EDITCLFDOCS, IDREPECM, IDARCHIVO, NIVELACCESO, IDLCA, SUBTIPO, ORDPOS);
CREATE INDEX ASGFELEMENTOCF14 ON ASGFELEMENTOCF (IDPADRE, ESTADO) INCLUDE (ID, TIPO, IDNIVEL, CODIGO, TITULO, IDFONDO, CODREFFONDO, FINALCODREFPADRE, CODREFERENCIA, IDELIMINACION, IDFICHADESCR, TIENEDESCR, EDITCLFDOCS, IDREPECM, IDARCHIVO, NIVELACCESO, IDLCA, SUBTIPO, ORDPOS);

-- Tabla: ASGFSERIE
CREATE UNIQUE INDEX ASGFSERIE1 ON ASGFSERIE (IDELEMENTOCF);
CREATE INDEX ASGFSERIE2 ON ASGFSERIE (IDFONDO);
CREATE INDEX ASGFSERIE3 ON ASGFSERIE (ESTADOSERIE);
CREATE INDEX ASGFSERIE4 ON ASGFSERIE (TIPOPROCEDIMIENTO);
CREATE INDEX ASGFSERIE5 ON ASGFSERIE (IDUSRGESTOR, ESTADOSERIE)

-- Tabla: ASGFVOLUMENSERIE
CREATE UNIQUE INDEX ASGFVOLUMENSERIE1 ON ASGFVOLUMENSERIE (IDSERIE, TIPODOCUMENTAL);

-- Tabla:  ASGFENTPRODUCTORA
CREATE UNIQUE INDEX ASGFENTPRODUCTORA1 ON ASGFENTPRODUCTORA (IDDESCR);

-- Tabla:  ASGFFONDO
CREATE UNIQUE INDEX ASGFFONDO1 ON ASGFFONDO (IDELEMENTOCF);
CREATE UNIQUE INDEX ASGFFONDO2 ON ASGFFONDO(CODARCHIVO,IDENTPRODUCTORA);

-- Tabla: ASGFNUMSECVAL
CREATE INDEX ASGFNUMSECVAL1 ON ASGFNUMSECVAL (IDSERIE);

-- Tabla: ASGFNUMSECSEL
CREATE INDEX ASGFNUMSECSEL1 ON ASGFNUMSECSEL (IDSERIE);

-- Tabla:  ASGFPRODSERIE
CREATE INDEX ASGFPRODSERIE1 ON ASGFPRODSERIE (IDSERIE);
CREATE INDEX ASGFPRODSERIE2 ON ASGFPRODSERIE (IDSERIE, IDPROCEDIMIENTO);

-- Tabla: ASGFUNIDADDOC
CREATE UNIQUE INDEX ASGFUNIDADDOC1 ON ASGFUNIDADDOC (IDELEMENTOCF);
CREATE INDEX ASGFUNIDADDOC2 ON ASGFUNIDADDOC (IDSERIE);
CREATE INDEX ASGFUNIDADDOC3 ON ASGFUNIDADDOC (NUMEXP);
CREATE INDEX ASGFUNIDADDOC4 ON ASGFUNIDADDOC(IDFONDO);

-- Tabla:  ASGFSOLICITUDSERIE
CREATE UNIQUE INDEX ASGFSOLICITUDSERIE1 ON ASGFSOLICITUDSERIE (ID);
CREATE INDEX ASGFSOLICITUDSERIE2 ON ASGFSOLICITUDSERIE (IDSERIE);

-- Tabla: ASGFORGPROD
CREATE UNIQUE INDEX ASGFORGPROD1 ON ASGFORGPROD (IDDESCR);

-- Tabla: ASGFVALSERIE
CREATE UNIQUE INDEX ASGFVALSERIE1 ON ASGFVALSERIE (ID);
CREATE INDEX ASGFVALSERIE2 ON ASGFVALSERIE (ESTADO);
CREATE INDEX ASGFVALSERIE3 ON ASGFVALSERIE (IDSERIE, ESTADO);
CREATE INDEX ASGFVALSERIE4 ON ASGFVALSERIE (IDUSRGESTORSERIE);

-- Tabla: ASGFELIMSERIE
CREATE UNIQUE INDEX ASGFELIMSERIE1 ON ASGFELIMSERIE (ID);
CREATE INDEX ASGFELIMSERIE2 ON ASGFELIMSERIE (ESTADO);

-- Tabla: ASGFELIMSELUDOC
CREATE INDEX ASGFELIMSELUDOC1 ON ASGFELIMSELUDOC (IDELIMINACION);
CREATE INDEX ASGFELIMSELUDOC2 ON ASGFELIMSELUDOC (IDUDOC);

-- Tabla: ASGFELIMUDOCCONS
CREATE INDEX ASGFELIMUDOCCONS1 ON ASGFELIMUDOCCONS (IDELIMINACION);
CREATE INDEX ASGFELIMUDOCCONS2 ON ASGFELIMUDOCCONS (IDUDOC);

-- Tabla: ASGFHISTUDOC
CREATE INDEX ASGFHISTUDOC1 ON ASGFHISTUDOC (IDELIMINACION);
CREATE INDEX ASGFHISTUDOC2 ON ASGFHISTUDOC (IDUDOC);

-- Tabla: ASGFUDOCSDF
CREATE UNIQUE INDEX ASGFUDOCSDF1 ON ASGFUDOCSDF (IDELEMENTOCF);

-----------------------------
-- DOCUMENTOS ELECTRONICOS --
-----------------------------

-- Tabla: ADOCCLASIFCF
CREATE UNIQUE INDEX ADOCCLASIFCF1 ON ADOCCLASIFCF(ID);
CREATE INDEX ADOCCLASIFCF2 ON ADOCCLASIFCF(IDCLFPADRE);
CREATE INDEX ADOCCLASIFCF3 ON ADOCCLASIFCF(IDELEMENTOCF);
CREATE INDEX ADOCCLASIFCF4 ON ADOCCLASIFCF(IDELEMENTOCF, ESTADO);

-- Tabla: ADOCDOCUMENTOCF
CREATE UNIQUE INDEX ADOCDOCUMENTOCF1 ON ADOCDOCUMENTOCF(ID);
CREATE INDEX ADOCDOCUMENTOCF2 ON ADOCDOCUMENTOCF(IDELEMENTOCF, IDCLFPADRE);
CREATE INDEX ADOCDOCUMENTOCF3 ON ADOCDOCUMENTOCF(IDELEMENTOCF, IDCLFPADRE, ESTADO);

-- Tabla: ADOCCLASIFDESCR
CREATE UNIQUE INDEX ADOCCLASIFDESCR1 ON ADOCCLASIFDESCR(ID);
CREATE INDEX ADOCCLASIFDESCR2 ON ADOCCLASIFDESCR(IDCLFPADRE);
CREATE INDEX ADOCCLASIFDESCR3 ON ADOCCLASIFDESCR(IDDESCR);
CREATE INDEX ADOCCLASIFDESCR4 ON ADOCCLASIFDESCR(IDDESCR, ESTADO);

-- Tabla: ADOCDOCUMENTODESCR
CREATE UNIQUE INDEX ADOCDOCUMENTODESCR1 ON ADOCDOCUMENTODESCR(ID);
CREATE INDEX ADOCDOCUMENTODESCR2 ON ADOCDOCUMENTODESCR(IDDESCR, IDCLFPADRE);
CREATE INDEX ADOCDOCUMENTODESCR3 ON ADOCDOCUMENTODESCR(IDDESCR, IDCLFPADRE, ESTADO);

-- Tabla: ADOCFICHACLF
CREATE UNIQUE INDEX ADOCFICHACLF1 ON ADOCFICHACLF(ID);

-- Tabla: ADOCTCAPTURA
CREATE UNIQUE INDEX ADOCTCAPTURA1 ON ADOCTCAPTURA(ID);
CREATE INDEX ADOCTCAPTURA2 ON ADOCTCAPTURA(IDUSRCAPTURA);
CREATE INDEX ADOCTCAPTURA3 ON ADOCTCAPTURA(ESTADO);

-- Tabla: ADPCDOCUMENTOVIT
CREATE UNIQUE INDEX ADPCDOCUMENTOVIT1 ON ADPCDOCUMENTOVIT(ID);

-- Tabla: ADPCUSODOCVIT
CREATE UNIQUE INDEX ADPCUSODOCVIT1 ON ADPCUSODOCVIT(IDDOCVIT,IDEXP,IDSIST);

-- Tabla: ADPCTIPODOCVIT
CREATE UNIQUE INDEX ADPCTIPODOCVIT1 ON ADPCTIPODOCVIT(ID);

-- Tabla: ADPCTIPODOCPROC
CREATE UNIQUE INDEX ADPCTIPODOCPROC1 ON ADPCTIPODOCPROC(IDTIPODOC,IDPROC);

---------------
-- AUDITORIA --
---------------

-- Tabla: AATRAZA
CREATE UNIQUE INDEX AATRAZA1 ON AATRAZA (ID);
CREATE INDEX AATRAZA2 ON AATRAZA (MODULO);
CREATE INDEX AATRAZA3 ON AATRAZA (TIMESTAMP);

-- Tabla: AADATOSTRAZA
CREATE UNIQUE INDEX AADATOSTRAZA1 ON AADATOSTRAZA (ID);
CREATE INDEX AADATOSTRAZA2 ON AADATOSTRAZA (IDTRAZA);

-- Tabla: AANAUDITUSR
CREATE UNIQUE INDEX AANAUDITUSR1 ON AANAUDITUSR (TIPOAUDITADO, IDAUDITADO);

-- Tabla: AANAUDITACCION
CREATE INDEX AANAUDITACCION1 ON AANAUDITACCION (MODULO, ACCION);

--------------------------
-- �NDICES DOCUMENTALES --
--------------------------

CREATE UNIQUE INDEX ID_ADVCTEXTCF ON ADVCTEXTCF(IDDOCUMENTAL);
CREATE UNIQUE INDEX ID_ADVCTEXTLCF ON ADVCTEXTLCF(IDDOCUMENTAL);
CREATE UNIQUE INDEX ID_ADVCTEXTDESCR ON ADVCTEXTDESCR(IDDOCUMENTAL);
CREATE UNIQUE INDEX ID_ADVCTEXTLDESCR ON ADVCTEXTLDESCR(IDDOCUMENTAL);
CREATE UNIQUE INDEX ID_ADDESCRIPTOR ON ADDESCRIPTOR(IDDOCUMENTAL);

---------------------------------------------------------------------------------------------
-- �ndices de las tablas para almacenar los campos descriptivos de unidades en alta/relaci�n
---------------------------------------------------------------------------------------------
--Tabla: ADVCFECHAUDOCRE
CREATE UNIQUE INDEX ADVCFECHAUDOCRE1 ON ADVCFECHAUDOCRE (IDUDOCRE, IDCAMPO, ORDEN);
CREATE INDEX ADVCFECHAUDOCRE2 ON ADVCFECHAUDOCRE (IDUDOCRE);
CREATE INDEX ADVCFECHAUDOCRE3 ON ADVCFECHAUDOCRE (IDCAMPO, FECHAINI);
CREATE INDEX ADVCFECHAUDOCRE4 ON ADVCFECHAUDOCRE (IDCAMPO, FECHAFIN);
CREATE INDEX ADVCFECHAUDOCRE5 ON ADVCFECHAUDOCRE (IDCAMPO, FECHAINI, FECHAFIN, CALIFICADOR);

--Tabla: ADVCNUMUDOCRE
CREATE UNIQUE INDEX ADVCNUMUDOCRE1 ON ADVCNUMUDOCRE (IDUDOCRE, IDCAMPO, ORDEN);
CREATE INDEX ADVCNUMUDOCRE2 ON ADVCNUMUDOCRE (IDUDOCRE);
CREATE INDEX ADVCNUMUDOCRE3 ON ADVCNUMUDOCRE (IDCAMPO, VALOR);

--Tabla: ADVCREFUDOCRE
CREATE UNIQUE INDEX ADVCREFUDOCRE1 ON ADVCREFUDOCRE (IDUDOCRE, IDCAMPO, ORDEN);
CREATE INDEX ADVCREFUDOCRE2 ON ADVCREFUDOCRE (IDUDOCRE);
CREATE INDEX ADVCREFUDOCRE3 ON ADVCREFUDOCRE (TIPOOBJREF, IDOBJREF);
CREATE INDEX ADVCREFUDOCRE4 ON ADVCREFUDOCRE (IDCAMPO, IDOBJREF);

--Tabla: ADVCTEXTLUDOCRE
CREATE UNIQUE INDEX ADVCTEXTLUDOCRE1 ON ADVCTEXTLUDOCRE (IDUDOCRE, IDCAMPO, ORDEN);
CREATE INDEX ADVCTEXTLUDOCRE2 ON ADVCTEXTLUDOCRE (IDUDOCRE);

--Tabla: ADVCTEXTUDOCRE
CREATE UNIQUE INDEX ADVCTEXTUDOCRE1 ON ADVCTEXTUDOCRE (ORDEN, IDCAMPO, IDUDOCRE);
CREATE INDEX ADVCTEXTUDOCRE2 ON ADVCTEXTUDOCRE (IDUDOCRE);


--Tabla: ASGFDIVISIONFS
CREATE UNIQUE INDEX ASGFDIVISIONFS1 ON ASGFDIVISIONFS (IDFS);
CREATE INDEX ASGFDIVISIONFS2 ON ASGFDIVISIONFS (IDUSRGESTOR, ESTADO);

--Tabla: ASGFUDOCENDIVISIONFS
CREATE UNIQUE INDEX ASGFUDOCENDIVISIONFS1 ON ASGFUDOCENDIVISIONFS (IDFS, IDUDOC);
CREATE INDEX ASGFUDOCENDIVISIONFS2 ON ASGFUDOCENDIVISIONFS (IDUDOC);

-- Tabla: ASGDSIGNUMHUECO
CREATE UNIQUE INDEX ASGDSIGNUMHUECO1 ON ASGDSIGNUMHUECO(IDARCHIVO, SIGNUMHUECO);

-- Tabla: ASGSEDIFICIO
CREATE UNIQUE INDEX ASGSEDIFICIO1 ON ASGSEDIFICIO(ID);
CREATE UNIQUE INDEX ASGSEDIFICIO2 ON ASGSEDIFICIO(NOMBRE);

-- Tabla: ASGSSALA
CREATE UNIQUE INDEX ASGSSALA1 ON ASGSSALA(ID);
CREATE UNIQUE INDEX ASGSSALA2 ON ASGSSALA(IDEDIFICIO,NOMBRE);
CREATE INDEX ASGSSALA3 ON ASGSSALA(IDEDIFICIO);

-- Tabla: ASGSMESA
CREATE INDEX ASGSMESA1 ON ASGSMESA(IDSALA);
CREATE UNIQUE INDEX ASGSMESA2 ON ASGSMESA(IDSALA,CODIGO);
CREATE UNIQUE INDEX ASGSMESA3 ON ASGSMESA(IDSALA,NUMORDEN);
CREATE INDEX ASGSMESA4 ON ASGSMESA(ESTADO);

-- Tabla: ASGSUSRCSALA
CREATE UNIQUE INDEX ASGSUSRCSALA1 ON ASGSUSRCSALA(ID);
CREATE INDEX ASGSUSRCSALA2 ON ASGSUSRCSALA(NUMDOCIDENTIFICACION);
CREATE INDEX ASGSUSRCSALA3 ON ASGSUSRCSALA(VIGENTE);

-- Tabla: ASGSUSRCSARCH
CREATE UNIQUE INDEX ASGSUSRCSARCH1 ON ASGSUSRCSARCH(IDUSRCSALA,IDARCHIVO);
CREATE INDEX ASGSUSRCSARCH2 ON ASGSUSRCSARCH(IDUSRCSALA);

-- Tabla: ASGSREGCSALA
CREATE UNIQUE INDEX ASGSREGCSALA1 ON ASGSREGCSALA(ID);
CREATE INDEX ASGSREGCSALA2 ON ASGSREGCSALA(IDUSRCSALA);
CREATE INDEX ASGSREGCSALA3 ON ASGSREGCSALA(NUMDOCIDENTIFICACION);

-- Tabla: ASGTUIREEACR
CREATE UNIQUE INDEX ASGTUIREEACR1 ON ASGTUIREEACR (ID);
CREATE INDEX ASGTUIREEACR2 ON ASGTUIREEACR (IDRELENTREGA);

-- Tabla: ASGTUDOCENUIREEACR
CREATE UNIQUE INDEX ASGTUDOCENUIREEACR1 ON ASGTUDOCENUIREEACR (ID);
CREATE INDEX ASGTUDOCENUIREEACR2 ON ASGTUDOCENUIREEACR (IDUDOCORIGEN);
CREATE INDEX ASGTUDOCENUIREEACR3 ON ASGTUDOCENUIREEACR (IDRELENTREGA);
CREATE INDEX ASGTUDOCENUIREEACR4 ON ASGTUDOCENUIREEACR (IDUNIDADDOC);
CREATE INDEX ASGTUDOCENUIREEACR5 ON ASGTUDOCENUIREEACR (IDUIREEACR);
CREATE INDEX ASGTUDOCENUIREEACR6 ON ASGTUDOCENUIREEACR (IDRELENTREGA,IDUNIDADDOC);

-- Tabla: ASGTUDOCREEACR
CREATE UNIQUE INDEX ASGTUDOCREEACR1 ON ASGTUDOCREEACR (ID);
CREATE INDEX ASGTUDOCREEACR2 ON ASGTUDOCREEACR (IDRELENTREGA);
CREATE INDEX ASGTUDOCREEACR3 ON ASGTUDOCREEACR (IDRELENTREGA,IDUNIDADDOC);

--Tabla: ASGFCTLGTBLTMP
CREATE UNIQUE INDEX ASGFCTLGTBLTMP1 ON ASGFCTLGTBLTMP(ID);
CREATE UNIQUE INDEX ASGFCTLGTBLTMP2 ON ASGFCTLGTBLTMP(NOMBRETABLA);