package mdmjava;

import java.util.ArrayList;
import java.util.Arrays;

public abstract class Common
{
	final public static String UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH = "/uploadfile/android/manage/content";
	final public static String UPLOAD_FILE_ANDROID_MANAGE_APP_PATH = "/uploadfile/android/manage/app";
	final public static String UPLOAD_FILE_ANDROID_DEVICE_APP_PATH = "/uploadfile/android/device/icon"; //Icons for showing device screen & app list
	final public static String DB_PATH_MDM_USER = "/data/sqlite/mdm_user.db";
	final public static String DB_PATH_MDM_ANDROID = "/data/sqlite/mdm_android.db";
	final public static String DB_PATH_LOCATION = "/data/sqlite/location.db";
	
	/**sqlite Common**/
	final public static String USER_ID = "user_id";
	final public static String GROUP_ID = "group_id";
	final public static String START_TIME = "start_time";
	final public static String END_TIME = "end_time";
	final public static String CREATE_TIME = "create_time";
	final public static String UPDATE_TIME = "update_time";
	final public static String FILE_LOCATION = "file_location";
	final public static String APP_ICON = "app_icon";
	final public static String APP_ID  = "app_id";
	final public static String APP_NAME = "app_name";
	final public static String CONTENT_ID  = "content_id";
	final public static String MAC_ADDRESS  = "mac_address";
	final public static String DEVICE_MODEL  = "device_model";
	final public static String DEVICE_IMG  = "device_img";
	
	/**sqlite mdm_user.db 
	 * table: user_permission**/
	final public static String USER_EMAIL = "user_email";
	final public static String PERMISSION = "permission";
	
	final public static ArrayList<String> listPermissionField = new ArrayList<>(Arrays.asList(USER_EMAIL, USER_ID, PERMISSION, START_TIME,END_TIME,CREATE_TIME,UPDATE_TIME)); 
	
	
	/**sqlite mdm_android.db 
	 * table: group_info**/
	final public static String GROUP_NAME = "group_name";
	final public static String ACCOUNT = "account";
	final public static String PASSWORD = "password";
	final public static String MAXIMUM = "maximum";
	final public static String CONNECTED = "connected";
	
	final public static ArrayList<String> listGroup = new ArrayList<>(Arrays.asList(USER_ID, GROUP_ID, GROUP_NAME, ACCOUNT,
			PASSWORD, MAXIMUM, CONNECTED, CREATE_TIME, UPDATE_TIME)); 
	
	/**sqlite mdm_android.db 
	 * table: app_manage**/
	final public static String CATEGORY = "category";
	final public static String  EDITION= "edition";
	final public static String DESCRIBE = "describe";

	/**sqlite mdm_android.db 
	 * table: content_manage**/
	final public static String ALIAS  = "alias";
	final public static String FILE_NAME  = "file_name";
	
	/**sqlite mdm_android.db 
	 * table: device_info**/
	final public static String BATTERY_PERCENT  = "bgattery_percent";
	final public static String TOTAL_SPACE  = "total_sapce";
	final public static String USED_SPACE  = "used_space";



	
	
}
