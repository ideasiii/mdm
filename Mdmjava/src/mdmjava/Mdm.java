package mdmjava;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class Mdm
{
	public final static int MDM_JOB_SUCCESS = 1;
	public final static int MDM_JOB_CMMD = 0;
	public final static int MDM_JOB_ERROR = -1;
	
	public static class PermissionData
	{
		public String user_email;
		public String user_id;
		public String permission;
		public String start_time;
		public String end_time;
		public String create_time;
		public String update_time;
	}
	
	public static class GroupData
	{
		public String user_id;
		public String group_id;
		public String group_name;
		public String account;
		public String password;
		public String maximum;
		public String connected;
		public String create_time;
		public String update_time;
	}
	
	sqliteClient sqlite = null;
	Connection conMdmUser = null;
	Connection conMdmAndroid = null;
	Connection conLocation = null;
	
	public boolean conDB()
	{
		sqlite = new sqliteClient();
		boolean bResult = false;
		 try {
			 conMdmUser = sqlite.getConnection(Common.DB_PATH_MDM_USER);
			 conMdmAndroid = sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);
			 conLocation = sqlite.getConnection(Common.DB_PATH_LOCATION);
			bResult = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return bResult;
	}
	
	public void closeDB()
	{
		try {
			conMdmUser.close();
			conMdmAndroid.close();
			conLocation.close();
			sqlite = null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public int queryPermission(String strEmail, ArrayList<PermissionData> listPermission)
	{
		int nCount = 0;

		try
		{
			//sqlite = new sqliteClient();
			//Connection con = sqlite.getConnection(Common.DB_PATH_MDM_USER);
			String strSQL = "select * from user_permission where user_email='"+strEmail+"' order by create_time ;";
			ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
			sqlite.query(conMdmUser, strSQL, Common.listPermissionField, listData);
			//con.close();
			//sqlite = null;

			if (0 < listData.size())
			{
				Iterator<HashMap<String, String>> it = null;
				HashMap<String, String> mapItem;
				it = listData.iterator();
				PermissionData permissionData = null;
				while (it.hasNext())
				{
					permissionData = new PermissionData();
					mapItem = it.next();
					permissionData.user_email = mapItem.get(Common.USER_EMAIL);
					permissionData.user_id = mapItem.get(Common.USER_ID);
					permissionData.permission = mapItem.get(Common.PERMISSION);
					permissionData.start_time = mapItem.get(Common.START_TIME);
					permissionData.end_time = mapItem.get(Common.END_TIME);
					permissionData.create_time = mapItem.get(Common.CREATE_TIME);
					permissionData.update_time = mapItem.get(Common.UPDATE_TIME);
					listPermission.add(permissionData);
					permissionData = null;
				}
				nCount = listPermission.size();
			}
		}
		catch (SQLException e)
		{
			Logs.showError(e.toString());
			e.printStackTrace();
		}

		return nCount;
	}

	public int queryGroup(String strUserId, ArrayList<GroupData> listGroup)
	{
		int nCount = 0;

		try
		{
			//sqliteClient sqlite = new sqliteClient();
			//Connection con = sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);
			String strSQL = "select * from group_info where user_id='"+strUserId+"' order by create_time ;";
			ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
			sqlite.query(conMdmAndroid, strSQL, Common.listGroup, listData);
			//con.close();
			//sqlite = null;

			if (0 < listData.size())
			{
				Iterator<HashMap<String, String>> it = null;
				HashMap<String, String> mapItem;
				it = listData.iterator();
				GroupData groupData = null;
				while (it.hasNext())
				{
					groupData = new GroupData();
					mapItem = it.next();
					groupData.user_id = mapItem.get(Common.USER_ID);
					groupData.group_id = mapItem.get(Common.GROUP_ID);
					groupData.group_name = mapItem.get(Common.GROUP_NAME);
					groupData.account = mapItem.get(Common.ACCOUNT);
					groupData.password = mapItem.get(Common.PASSWORD);
					groupData.maximum = mapItem.get(Common.MAXIMUM);
					groupData.connected = mapItem.get(Common.CONNECTED);
					groupData.create_time = mapItem.get(Common.CREATE_TIME);
					groupData.update_time = mapItem.get(Common.UPDATE_TIME);
					listGroup.add(groupData);
					groupData = null;
				}
				nCount = 	listGroup.size();
			}
		}
		catch (SQLException e)
		{
			Logs.showError(e.toString());
			e.printStackTrace();
		}

		return nCount;
	}
	
}