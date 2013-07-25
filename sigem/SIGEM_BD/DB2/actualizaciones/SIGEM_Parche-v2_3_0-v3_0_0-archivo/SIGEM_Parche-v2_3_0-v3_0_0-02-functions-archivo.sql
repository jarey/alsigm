-- Para lanzar este script ejecutar lo siguiente:
-- db2cmd
-- db2 connect to <nombre-bd> user <usuario> using <clave>
-- db2 -td@ -vf SIGEM-Parche-v2_00-v3_00-02-functions-archivo.sql
-- db2 terminate

DROP FUNCTION GREATEST@
DROP FUNCTION LPAD@
DROP FUNCTION TS_FMT@
DROP FUNCTION GETNUMERICPOSITIVE@
DROP FUNCTION ISNUMERIC@
DROP FUNCTION CALCFINCODREFPADRE@
DROP PROCEDURE UPDATECODREF@
DROP FUNCTION GETFINCODREFPADRE@
DROP FUNCTION GETCODREF@
DROP FUNCTION GETHIJOSELEMENTO@


CREATE FUNCTION GREATEST (P1 smallint, P2 smallint)
RETURNS smallint
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
NO EXTERNAL ACTION
RETURN
CASE
WHEN P1 >= P2 THEN P1
ELSE P2
END
@

CREATE FUNCTION LPAD (C1 VarChar(4000), N integer, C2 VarChar(4000))
RETURNS VARCHAR(4000)
LANGUAGE SQL
DETERMINISTIC
CONTAINS SQL
NO EXTERNAL ACTION
RETURN
CASE
WHEN N > length(C1) THEN
substr(repeat(C2,(N-length(C1)+length(C2))/(length(C2)+1-sign(length(C2)))),1,N
-length(C1)) || C1
ELSE substr(C1,1,N)
END@

CREATE FUNCTION TS_FMT (
	TS TIMESTAMP ,
	FMT VARCHAR(30) )
	RETURNS VARCHAR(70)
LANGUAGE SQL
DETERMINISTIC
BEGIN ATOMIC
DECLARE RES VARCHAR(70);
FOR V1 AS SELECT SUBSTR ( DIGITS ( DAY ( TS ) ) , 9 ) AS DD , SUBSTR ( DIGITS ( MONTH ( TS ) ) , 9 ) AS MM , RTRIM ( CHAR ( YEAR ( TS ) ) ) AS YYYY , SUBSTR ( DIGITS ( HOUR ( TS ) ) , 9 ) AS HH , SUBSTR ( DIGITS ( MINUTE ( TS ) ) , 9 ) AS MI , SUBSTR ( DIGITS ( SECOND ( TS ) ) , 9 ) AS SS , RTRIM ( CHAR ( MICROSECOND ( TS ) ) ) AS NNNNNN FROM SYSIBM . SYSDUMMY1 DO
	IF FMT = 'yyyymmdd' THEN
		SET RES = YYYY || MM || DD ;
	ELSEIF FMT = 'yyyy/mm/dd' THEN
		SET RES = YYYY || '/' || MM || '/' || DD ;
	ELSEIF FMT = 'yyyy-mm-dd' THEN
		SET RES = YYYY || '-' || MM || '-' || DD ;
	ELSEIF FMT = 'mm/dd/yyyy' THEN
		SET RES = MM || '/' || DD || '/' || YYYY ;
	ELSEIF FMT = 'dd/mm/yyyy' THEN
		SET RES = DD || '/' || MM || '/' || YYYY ;
	ELSEIF FMT = 'dd/mm/' THEN
		SET RES = DD || '/' || MM || '/' ;
	ELSEIF FMT = 'mm/dd/' THEN
		SET RES = MM || '/' || DD || '/' ;
	ELSEIF FMT = 'yyyy' THEN
		SET RES = YYYY ;
	ELSEIF FMT = 'yyyy/dd/mm hh:mi:ss' THEN
		SET RES = YYYY || '/' || MM || '/' || DD || ' ' || HH || ':' || MI || ':' || SS ;
	ELSEIF FMT = 'dd/mm/yyyy hh:mi:ss' THEN
		SET RES = DD || '/' || MM || '/' || YYYY || ' ' || HH || ':' || MI || ':' || SS ;
	ELSEIF FMT = 'nnnnnn' THEN
		SET RES = NNNNNN ;
	ELSE
		SET RES = 'formato ' || FMT || ' no reconocido.' ;
	END IF ;
END FOR;
RETURN RES;

END@

CREATE FUNCTION ISNUMERIC ( SOURCE VARCHAR(40) )
  RETURNS BIGINT
  LANGUAGE SQL
  DETERMINISTIC
  NO EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
RETURN
	CASE WHEN translate(source,'','0123456789.-+') <> '' THEN 0
	WHEN posstr(ltrim(source),'-') > 1	OR posstr(ltrim(source),'+') > 1 THEN 0
	WHEN length(rtrim(ltrim(translate(source,'','0123456789 .')))) > 1	OR length(rtrim(ltrim(translate(source,'','0123456789-+')))) > 1 THEN 0
	WHEN posstr(ltrim(rtrim(translate(source,'','-+'))),' ') > 0 THEN 0
	WHEN translate(source,'','.-+') = '' THEN 0
	ELSE 1
END@

CREATE FUNCTION GETNUMERICPOSITIVE ( SOURCE VARCHAR(40) )
  RETURNS BIGINT
  LANGUAGE SQL
  DETERMINISTIC
  NO EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
RETURN
CASE
WHEN ISNUMERIC(Source)=1 THEN BIGINT(Source)
ELSE -1
END@

CREATE FUNCTION CALCFINCODREFPADRE(
				vCodReferencia VARCHAR(255),
				vCodRefFondo  VARCHAR(255),
				vCodigo VARCHAR(255),
				vFinalCodRefPadreActual VARCHAR(255),
				vDelimitador VARCHAR(255))
				    RETURNS VARCHAR(255)
		LANGUAGE  SQL
		DETERMINISTIC NO EXTERNAL ACTION CONTAINS SQL
		BEGIN ATOMIC
		DECLARE vCodRefSinCodRefFondo	VARCHAR(255);
    DECLARE iNumCars INT;
    DECLARE vReturnValue VARCHAR(255);

		SET vReturnValue = '';

	-- algoritmo: Ej
	-- vCodReferencia			ES/NA/AJRP/CF1/CF2/F1/CS1/CS2/S1/U1
	-- vCodRefFondo				ES/NA/AJRP/CF1/CF2/F1
	-- vCodigo					U1
	-- vFinalCodRefPadreActual	CF1/CF2/F2/CS1/CS2/S1/U1
	-- vDelimitador				/

	-- valor retornado:
	--	sin lanzar excepciones:		CS1/CS2/S1
	--	si algo fala:				CF1/CF2/F2/CS1/CS2/S1/U1

		--reemplazar en la cadena la parte del fondo+delimitador por la cadena vacia
		-- El codigo de referencia del fondo nunca puede llegar nulo, si llega nulo => error

		IF(LENGTH(vCodRefFondo)=0) THEN
			RETURN vFinalCodRefPadreActual;
		END IF;

		-- El codigo de referencia nunca puede llegar nulo, si llega nulo => error
		IF(LENGTH(vCodReferencia)=0) THEN
			RETURN vFinalCodRefPadreActual;
		END IF;

		-- Si el codigo de referencia del fondo no esta contenido ,en el codigo de referencia => error
		IF(LOCATE(vCodRefFondo,vCodReferencia)=0) THEN
			RETURN vFinalCodRefPadreActual;
		END IF;

		-- Quitamos la parte con el codigo de referencia del fondo, del codigo de referencia
		SET vCodRefSinCodRefFondo = REPLACE(vCodReferencia, vCodRefFondo || vDelimitador,'');

		-- codigo vacio
		IF(LENGTH(vCodigo)=0) THEN
			RETURN vCodRefSinCodRefFondo;
		END IF;

		-- quitamos el codigo al final de la cadena y el caracter delimitador
		SET iNumCars=LENGTH(vCodRefSinCodRefFondo)-LENGTH(vCodigo);

		IF (iNumCars>0) THEN
	 		SET vReturnValue=SUBSTR(vCodRefSinCodRefFondo,1,iNumCars-1);
		END IF;

		RETURN vReturnValue;
 END@

CREATE FUNCTION GETHIJOSELEMENTO(IDELEMENTO VARCHAR(32))
  RETURNS TABLE (ID VARCHAR(32), TIPO SMALLINT)
  LANGUAGE SQL

BEGIN ATOMIC
   RETURN WITH CTE_ELEMENTOS (ID, CODIGO, IDPADRE, TIPO) AS
(
	SELECT ID, CODIGO, IDPADRE, TIPO FROM ASGFELEMENTOCF WHERE ID = IDELEMENTO
	UNION ALL
	SELECT A.ID, A.CODIGO, A.IDPADRE, A.TIPO FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
	WHERE A.IDPADRE = CTE.ID
)
SELECT ID, TIPO FROM CTE_ELEMENTOS;
END@

CREATE FUNCTION GETCODREF(IDELEMENTO VARCHAR(32), SEPARATOR VARCHAR(1))
				    RETURNS VARCHAR(1024)
	BEGIN ATOMIC

		DECLARE AUXCODREFERENCIA VARCHAR(1024);
		DECLARE ID VARCHAR(32);
		DECLARE CODIGO_ELEMENTO VARCHAR(128);
		DECLARE IDPADRE VARCHAR(32);
		DECLARE CODPAIS VARCHAR(16);
		DECLARE CODCOMUNIDAD VARCHAR(16);
		DECLARE CODARCHIVO VARCHAR(32);

		SET AUXCODREFERENCIA = '';

		FOR ELEMENTOS as
			WITH CTE_ELEMENTOS (ID, CODIGO, IDPADRE) AS
			(
				SELECT ID, CODIGO, IDPADRE FROM ASGFELEMENTOCF WHERE ID = IDELEMENTO
				UNION ALL
				SELECT A.ID, A.CODIGO, A.IDPADRE FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
				WHERE A.ID = CTE.IDPADRE
			)
			SELECT ID, CODIGO, IDPADRE FROM CTE_ELEMENTOS
    DO
			IF (CODIGO IS NOT NULL) THEN
				IF (LENGTH(CODIGO)>0) THEN
			 		IF (AUXCODREFERENCIA = '') THEN
						SET AUXCODREFERENCIA = CODIGO;
					ELSE
						SET AUXCODREFERENCIA = CODIGO || SEPARATOR || AUXCODREFERENCIA;
					END IF;
			 	END IF;
			END IF;
 		END FOR;


		IF (AUXCODREFERENCIA = '') THEN
			SET AUXCODREFERENCIA=NULL;
		ELSE

			FOR FONDO AS
				SELECT CODPAIS, CODCOMUNIDAD, CODARCHIVO FROM ASGFELEMENTOCF ASGFELEMENTOCF, ASGFFONDO ASGFFONDO
				WHERE	ASGFELEMENTOCF.ID=IDELEMENTO AND
						ASGFELEMENTOCF.IDFONDO=ASGFFONDO.IDELEMENTOCF
				DO
				SET AUXCODREFERENCIA = CODPAIS || SEPARATOR || CODCOMUNIDAD || SEPARATOR || CODARCHIVO || SEPARATOR || AUXCODREFERENCIA;
			END FOR;
		END IF;

    RETURN AUXCODREFERENCIA;
END@

CREATE FUNCTION GETFINCODREFPADRE(IDELEMENTO VARCHAR(32), SEPARATOR VARCHAR(1))
RETURNS VARCHAR(1024)
BEGIN ATOMIC

	DECLARE AUXFINALCODREFPADRE VARCHAR(1024);
	DECLARE CODIGOREFERENCIAELEMENTOPADRE VARCHAR(1024);
	DECLARE CODIGOREFERENCIAFONDO VARCHAR(1024);
	DECLARE IDFONDO VARCHAR(32);
	DECLARE TIPO SMALLINT;

	SET AUXFINALCODREFPADRE = '';

	IF (IDELEMENTO IS NULL) THEN
		SET AUXFINALCODREFPADRE = NULL;
	ELSE
		SET TIPO = -1;
		FOR ELEMENTOCF AS
			SELECT TIPO
			FROM ASGFELEMENTOCF
			WHERE ID = IDELEMENTO
		DO
			IF (TIPO IN (-1,2,6)) THEN
				SET AUXFINALCODREFPADRE = NULL;
			ELSE
				FOR ELEMENTO AS
					SELECT GETCODREF(IDPADRE, SEPARATOR) CODIGOREFERENCIAELEMENTOPADRE, GETCODREF(IDFONDO, SEPARATOR) CODIGOREFERENCIAFONDO
					FROM ASGFELEMENTOCF
					WHERE ID = IDELEMENTO
				DO
					IF (LENGTH(CODIGOREFERENCIAFONDO)>0) THEN
						SET AUXFINALCODREFPADRE = REPLACE(CODIGOREFERENCIAELEMENTOPADRE,CODIGOREFERENCIAFONDO || SEPARATOR,'');
						SET AUXFINALCODREFPADRE = REPLACE(AUXFINALCODREFPADRE,CODIGOREFERENCIAFONDO,'');
					ELSE
						SET AUXFINALCODREFPADRE = CODIGOREFERENCIAELEMENTOPADRE;
					END IF;
				END FOR;
			END IF;
		END FOR;
	END IF;

	IF (LENGTH(AUXFINALCODREFPADRE)=0) THEN
		SET AUXFINALCODREFPADRE = NULL;
	END IF;

	RETURN AUXFINALCODREFPADRE;
END@

CREATE PROCEDURE UPDATECODREF ( IN ROOT VARCHAR(32), SEPARATOR VARCHAR(1), UPDTABLES VARCHAR(1) )
BEGIN ATOMIC

	-- Este procedimiento requiere que se establezca el idpadre antes de llamar
	-- para actualizar los c�digos de referencia y el resto de campos

	IF (ROOT IS NOT NULL) THEN
		FOR ELEMENTO AS
			SELECT TIPO FROM ASGFELEMENTOCF WHERE ID=ROOT
		DO

			IF (TIPO IS NOT NULL) THEN
				IF ((TIPO IN (2,3,4,5,6)) AND (UPDTABLES='S')) THEN
					FOR FONDO AS
						WITH CTE_ELEMENTOS (ID, IDPADRE, TIPO, CODREFERENCIA) AS
						(
							SELECT ID, IDPADRE, TIPO, CODREFERENCIA FROM ASGFELEMENTOCF WHERE ID = ROOT
							UNION ALL
							SELECT A.ID, A.IDPADRE, A.TIPO, A.CODREFERENCIA FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
							WHERE A.ID = CTE.IDPADRE
						)
						SELECT CTE.ID IDFONDO_CALCULADO, GETCODREF(CTE.ID,SEPARATOR) CODREFERENCIAFONDO_CALCULADO
						FROM CTE_ELEMENTOS CTE
						WHERE CTE.TIPO=2
					DO
						-- Actualizar el idfondo a todos sus hijos
						UPDATE ASGFELEMENTOCF SET IDFONDO=IDFONDO_CALCULADO WHERE ID IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS);

						-- Actualizar el idfondo a todas sus series
						UPDATE ASGFSERIE SET IDFONDO=IDFONDO_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=4);

						-- Actualizar el idfondo a todas las unidades documentales
						UPDATE ASGFUNIDADDOC SET IDFONDO=IDFONDO_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);

						-- Actualizar la identificacion a todas las unidades documentales
						UPDATE ASGDUDOCENUI SET IDENTIFICACION=CODREFERENCIAFONDO_CALCULADO || '-' || SIGNATURAUDOC WHERE IDUNIDADDOC IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);

						-- Actualizar la identificacion de las unidades de instalaci�n
						UPDATE ASGDUINSTALACION SET IDENTIFICACION=CODREFERENCIAFONDO_CALCULADO || '.' || SIGNATURAUI WHERE ID IN (SELECT ASGDUDOCENUI.IDUINSTALACION FROM ASGDUDOCENUI ASGDUDOCENUI, TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6 AND HIJOS.ID=ASGDUDOCENUI.IDUNIDADDOC);
					END FOR;
				END IF;

				IF ((TIPO IN (6)) AND (UPDTABLES='S')) THEN
					FOR SERIE AS
						WITH CTE_ELEMENTOS (ID, IDPADRE, TIPO) AS
						(
							SELECT ID, IDPADRE, TIPO FROM ASGFELEMENTOCF WHERE ID = ROOT
							UNION ALL
							SELECT A.ID, A.IDPADRE, A.TIPO FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
							WHERE A.ID = CTE.IDPADRE
						)
						SELECT CTE.ID IDSERIE_CALCULADO
						FROM CTE_ELEMENTOS CTE
						WHERE CTE.TIPO=4
					DO
						UPDATE ASGFUNIDADDOC SET IDSERIE=IDSERIE_CALCULADO WHERE IDELEMENTOCF IN (SELECT ID FROM TABLE(GETHIJOSELEMENTO(ROOT)) AS HIJOS WHERE HIJOS.TIPO=6);
					END FOR;
				END IF;

				FOR ELEMENTOS_NOSERIE AS
					WITH CTE_ELEMENTOS (ID, TIPO, CODIGO, IDPADRE) AS
					(
						SELECT ID, TIPO, CODIGO, IDPADRE FROM ASGFELEMENTOCF WHERE ID = ROOT
						UNION ALL
						SELECT A.ID, A.TIPO, A.CODIGO, A.IDPADRE FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
						WHERE A.IDPADRE = CTE.ID
					)
					SELECT ID IDELEMENTO, TIPO, CODIGO, IDPADRE FROM CTE_ELEMENTOS
					WHERE TIPO NOT IN (4,6)
				DO

					FOR CODSREF AS
						SELECT COALESCE(GETCODREF(IDFONDO, SEPARATOR),NULLIF('1','1')) CODREFFONDO_CALCULADO,
						GETCODREF(IDELEMENTO, SEPARATOR) CODREFERENCIA_CALCULADO,
						GETFINCODREFPADRE(IDELEMENTO, SEPARATOR) FINALCODREFPADRE_CALCULADO
						FROM ASGFELEMENTOCF WHERE ID=IDELEMENTO
					DO
						UPDATE ASGFELEMENTOCF SET CODREFFONDO=CODREFFONDO_CALCULADO, CODREFERENCIA=CODREFERENCIA_CALCULADO, FINALCODREFPADRE=FINALCODREFPADRE_CALCULADO WHERE ID=IDELEMENTO;
					END FOR;
				END FOR;
				FOR ELEMENTOS_SERIE AS
					WITH CTE_ELEMENTOS (ID, TIPO, CODIGO, IDPADRE) AS
					(
						SELECT ID, TIPO, CODIGO, IDPADRE FROM ASGFELEMENTOCF WHERE ID = ROOT
						UNION ALL
						SELECT A.ID, A.TIPO, A.CODIGO, A.IDPADRE FROM ASGFELEMENTOCF A, CTE_ELEMENTOS CTE
						WHERE A.IDPADRE = CTE.ID
					)
					SELECT ID IDELEMENTO, TIPO, CODIGO, IDPADRE FROM CTE_ELEMENTOS
					WHERE TIPO=4
				DO

					FOR CODSREF AS
						SELECT COALESCE(GETCODREF(IDFONDO, SEPARATOR),NULLIF('1','1')) CODREFFONDO_CALCULADO,
						GETCODREF(IDELEMENTO, SEPARATOR) CODREFERENCIA_CALCULADO,
						GETFINCODREFPADRE(IDELEMENTO, SEPARATOR) FINALCODREFPADRE_CALCULADO
						FROM ASGFELEMENTOCF WHERE ID=IDELEMENTO
					DO
						UPDATE ASGFELEMENTOCF SET CODREFFONDO=CODREFFONDO_CALCULADO, CODREFERENCIA=CODREFERENCIA_CALCULADO, FINALCODREFPADRE=FINALCODREFPADRE_CALCULADO WHERE ID=IDELEMENTO;
						UPDATE ASGFELEMENTOCF SET CODREFFONDO=CODREFFONDO_CALCULADO, CODREFERENCIA=CODREFERENCIA_CALCULADO || SEPARATOR || CODIGO, FINALCODREFPADRE=NULL WHERE IDPADRE=IDELEMENTO;
					END FOR;
				END FOR;
			END IF;
		END FOR;
	END IF;
END@
