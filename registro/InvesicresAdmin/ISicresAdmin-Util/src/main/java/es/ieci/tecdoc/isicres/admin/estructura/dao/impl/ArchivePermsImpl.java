package es.ieci.tecdoc.isicres.admin.estructura.dao.impl;



import org.apache.log4j.Logger;

import es.ieci.tecdoc.isicres.admin.base.collections.IeciTdLongIntegerArrayList;
import es.ieci.tecdoc.isicres.admin.base.dbex.DbConnection;
import es.ieci.tecdoc.isicres.admin.base.dbex.DbDeleteFns;
import es.ieci.tecdoc.isicres.admin.base.dbex.DbInputStatement;
import es.ieci.tecdoc.isicres.admin.base.dbex.DbSelectFns;
import es.ieci.tecdoc.isicres.admin.core.db.DBSessionManager;
import es.ieci.tecdoc.isicres.admin.database.DynamicFns;
import es.ieci.tecdoc.isicres.admin.database.DynamicRow;
import es.ieci.tecdoc.isicres.admin.database.DynamicRows;
import es.ieci.tecdoc.isicres.admin.database.DynamicTable;
import es.ieci.tecdoc.isicres.admin.database.LdapUsersTable;
import es.ieci.tecdoc.isicres.admin.estructura.dao.ArchivePerms;
import es.ieci.tecdoc.isicres.admin.estructura.keys.ISicresAdminArchiveKeys;
import es.ieci.tecdoc.isicres.admin.estructura.keys.ISicresAdminDefsKeys;
import es.ieci.tecdoc.isicres.admin.exception.ISicresAdminBasicException;
import es.ieci.tecdoc.isicres.admin.sbo.acs.std.AcsMdoGenPerms;



public class ArchivePermsImpl implements ArchivePerms
{
   public ArchivePermsImpl()
   {
   }

   /**
    * A�ade los permisos especificados
    *
    * @param destType - destinatario del permiso (departamento, usuario, grupo)
    * @param destId - identificador del destinatario
    * @param acsId - identificador de objeto sobre el que se a�ade el permiso (ej:archivador)
    * @param perms - permisos
    * @throws Exception - errores
    */
   public void addPerms(int destType, int destId, int acsId, int perms, String entidad )
   				throws Exception
   {
      int     dstPerms = 0;
      boolean commit = false;
      boolean inTrans = false;

      if (_logger.isDebugEnabled())
         _logger.debug("addPerms");

      DbConnection dbConn=new DbConnection();
      try
      {
         dbConn.open(DBSessionManager.getSession());

         switch(destType)
         {
         	case ISicresAdminDefsKeys.DESTINATION_USER:
         	{
         	   dstPerms =AcsMdoGenPerms.getUseriDocGenPerms(destId, entidad);
         	   break;
         	}
         	case ISicresAdminDefsKeys.DESTINATION_DEPT:
         	{
         	   dstPerms = AcsMdoGenPerms.getDeptiDocGenPerms(destId, entidad);
         	   break;
         	}
         	case ISicresAdminDefsKeys.DESTINATION_GROUP:
         	{
         	   dstPerms = AcsMdoGenPerms.getGroupiDocGenPerms(destId, entidad);
         	   break;
         	}
         }

	      if ((dstPerms & perms) != 0)
	      {
	         dbConn.beginTransaction();
	         inTrans = true;
	         setPerms(destType,destId,acsId,perms);
	         commit = true;
	      }
	      else
	      {
	         ISicresAdminBasicException.throwException(ISicresAdminArchiveKeys.EC_ARCH_CANNT_PERM);
	      }

      }
      catch(Exception e)
      {
         _logger.error(e);
			throw e;
      }
      finally
      {
         if (inTrans)
            dbConn.endTransaction(commit);

         dbConn.close();
      }

   }

   /**
    * Elimina los permisos especificador
    *
    * @param destType - destinatario del permiso (departamento, usuario, grupo)
    * @param destId - Identificador del destinatario
    * @param archid - identificador del archivador
    * @param perms - permisos
    * @throws Exception - errores
    */
   public void deletePerms(int destType,int destId, int archId, int perms, String entidad)
    				throws Exception
   {
      boolean commit = false;
      boolean inTrans = false;

      _destType = destType;
      _destId   = destId;
      _id       = archId;
      _typeObj  = ISicresAdminDefsKeys.OBJECT_OWNER_TYPE_ARCHIVE;

      if (_logger.isDebugEnabled())
         _logger.debug("deletePerms");

      DbConnection dbConn=new DbConnection();
      try
      {
	      dbConn.open(DBSessionManager.getSession());
	      dbConn.beginTransaction();
	      inTrans = true;

	      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_QUERY) != 0 )
	      {
	         _perm = ISicresAdminDefsKeys.OBJ_PERM_QUERY;
	         deletePerm(entidad);
	      }
	      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_UPDATE) != 0 )
	      {
	         _perm = ISicresAdminDefsKeys.OBJ_PERM_UPDATE;
	         deletePerm(entidad);
	      }
	      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_CREATION) != 0 )
	      {
	         _perm = ISicresAdminDefsKeys.OBJ_PERM_CREATION;
	         deletePerm(entidad);
	      }
	      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_DELETION) != 0 )
	      {
	         _perm = ISicresAdminDefsKeys.OBJ_PERM_DELETION;
	         deletePerm(entidad);
	      }
	      commit = true;
      }
      catch(Exception e)
      {
         _logger.error(e);
			throw e;
      }
      finally
		{
         if (inTrans)
            dbConn.endTransaction(commit);

			dbConn.close();
		}

   }


   /**
    * Obtiene los permisos
    *
    * @param destType - destinatario del permiso (departamento, usuario, grupo)
    * @param destId - Identificador del destinatario
    * @param archid - identificador del archivador
    * @param perms - permisos
    * @throws Exception - errores
    */
   public int loadPerms(int destType, int destId, int archId, String entidad)
   				throws Exception
	{
      LdapUsersTable             table = new LdapUsersTable();
      int                        perms = ISicresAdminDefsKeys.OBJ_PERM_NONE;
      String                     qual;
      IeciTdLongIntegerArrayList vals;
      int                        objType = ISicresAdminDefsKeys.OBJECT_OWNER_TYPE_ARCHIVE;

      if (_logger.isDebugEnabled())
         _logger.debug("loadPerm");

      DbConnection dbConn=new DbConnection();
      try
      {
	      dbConn.open(DBSessionManager.getSession());

	      vals = new IeciTdLongIntegerArrayList();
	      qual = table.getLoadObjPermsQual(destType,destId,objType,archId);

	      DbSelectFns.select(dbConn, table.getObjPermsTableName(), table.getLoadObjPermColumnName(),
	    		  qual, false, vals);

	      for (int i= 0; i < vals.count(); i++)
	      {
	         perms = perms | vals.get(i);
	      }
      }
      catch(Exception e)
      {
         _logger.error(e);
			throw e;
      }
      finally
		{
			dbConn.close();
		}

      return perms;
	}
   public Integer insertPermValues(DbInputStatement statement, Integer idx)
   				throws Exception
   {
      int index = idx.intValue();

      if (_logger.isDebugEnabled())
         _logger.debug("insertPermValues");

      statement.setLongInteger(index++, _destType);
      statement.setLongInteger(index++, _destId);
      statement.setLongInteger(index++, _acsId);
      statement.setLongInteger(index++, _perm);

      return new Integer(index);
   }


   ////////////////////////////////////////////////////////////////////////////
   //                    private
   ///////////////////////////////////////////////////////////////////////////


   private void setPerms(int destType,int destId, int acsId, int perms)
   				throws Exception
   {

      _destType = destType;
      _destId = destId;
      _acsId = acsId;


      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_QUERY) != 0 )
      {
         _perm = ISicresAdminDefsKeys.OBJ_PERM_QUERY;
         insertPerm();
      }
      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_UPDATE) != 0 )
      {
         _perm = ISicresAdminDefsKeys.OBJ_PERM_UPDATE;
         insertPerm();
      }
      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_CREATION) != 0)
      {
         _perm = ISicresAdminDefsKeys.OBJ_PERM_CREATION;
         insertPerm();
      }
      if ( (perms & ISicresAdminDefsKeys.OBJ_PERM_DELETION) != 0)
      {
         _perm = ISicresAdminDefsKeys.OBJ_PERM_DELETION;
         insertPerm();
      }
   }

   private void insertPerm() throws Exception
   {
      DynamicTable tableInfo = new DynamicTable();
      DynamicRows rowsInfo = new DynamicRows();
      DynamicRow rowInfo = new DynamicRow();
      LdapUsersTable table = new LdapUsersTable();

      if (_logger.isDebugEnabled())
         _logger.debug("insertPerm");

      try
      {
         tableInfo.setTableObject(table);
         tableInfo.setClassName(LdapUsersTable.class.getName());
         tableInfo.setTablesMethod("getObjPermsTableName");
         tableInfo.setColumnsMethod("getInsertObjPermsColumnNames");

         rowInfo.addRow(this);
         rowInfo.setClassName(ArchivePermsImpl.class.getName());
         rowInfo.setValuesMethod("insertPermValues");
         rowsInfo.add(rowInfo);

         DynamicFns.insert(tableInfo, rowsInfo);

      }
      catch (Exception e)
		{
         _logger.error(e);
         throw e;
		}
   }

   private void deletePerm(String entidad) throws Exception
   {

	   DbConnection dbConn=new DbConnection();
	   try{
	      dbConn.open(DBSessionManager.getSession());
	      int typeObj = _typeObj; //archivador

	      LdapUsersTable table = new LdapUsersTable();

		   DbDeleteFns.delete(dbConn, table.getObjPermsTableName(),
		         table.getDeleteObjPermQual(_destType, _destId, _typeObj, _id, _perm));

		   typeObj = ISicresAdminDefsKeys.OBJECT_OWNER_TYPE_FOLDER;
		   DbDeleteFns.delete(dbConn, table.getObjPermsTableName(),
		         table.getDeleteObjPermQual(_destType, _destId, typeObj, _id, _perm));

		   if (_perm == ISicresAdminDefsKeys.OBJ_PERM_QUERY)
		   {
		      typeObj = ISicresAdminDefsKeys.OBJECT_OWNER_TYPE_FORMAT;
		      DbDeleteFns.delete(dbConn, table.getObjPermsTableName(),
		            table.getDeleteObjPermQual(_destType, _destId, typeObj, _id, _perm));

		      typeObj = ISicresAdminDefsKeys.OBJECT_OWNER_TYPE_FORMAT;
		      DbDeleteFns.delete(dbConn, table.getObjPermsTableName(),
		            table.getDeleteObjPermQual(_destType, _destId, typeObj, _id, _perm));
		   }

	   }catch (Exception e) {
		   _logger.error(e);
		   throw e;
	   }finally{
		   dbConn.close();
	   }

   }

   private int _destType;
   private int _destId;
   private int _acsId;
   private int _perm;
   private int _id;
   private int _typeObj;


   private static final Logger _logger = Logger.getLogger(ArchivePermsImpl.class);
}
