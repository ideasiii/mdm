<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sdk.ideas.sqliteClient"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@page import=" java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="mdmjava.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		/*try {
			String strID = "GID-ac788c3477220521";
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection("/data/sqlite/mdm_android.db");
			String strSQL = "select * from group_info where group_id ='" + strID+ "'";
			Statement stat = con.createStatement();
			ResultSet rs = stat.executeQuery(strSQL);	
			*/
	%>
	<!--  
	<div>
		<select
			onchange="location.href=this.options[this.selectedIndex].value">
			<option value="group_management.html">Select Group</option>
			<option value="device_management.html"><%//rs.getString("group_name")%></option>
		</select>
	</div>
	-->
	<%
		/*
				rs.close();
				stat.close();
				con.close();
				sqlite = null;
			}
		
			catch (SQLException e) {
				out.println("error: " + e.getMessage());
			}*/
	%>

	<%
		final String strEmail = "juliettechien@iii.org.tw";//request.getParameter(Common.USER_EMAIL);
		Mdm mdm = new Mdm();
		boolean bLogined = false;

		ArrayList<Mdm.PermissionData> listPermission = new ArrayList<Mdm.PermissionData>();
		int nCount = mdm.queryPermission(strEmail, listPermission);
	%>
	<ul>
		<%
			if (0 < nCount) {
				Iterator<Mdm.PermissionData> it = null;
				it = listPermission.iterator();
				Mdm.PermissionData permissionData = null;
				while (it.hasNext()) {
					permissionData = it.next();
		%>
		<li>
			<div>
				<p><%=permissionData.user_email%></p>
				<p><%=permissionData.user_id%></p>
				<p><%=permissionData.permission%></p>
			</div>
		</li>
		<%
		if (permissionData.permission.trim().equals("android"))
		{
			ArrayList<Mdm.UserGroupCateData> listUserGroup = new ArrayList<Mdm.UserGroupCateData>();
			mdm.queryGroup(permissionData.user_id, listUserGroup);
		}
			
		
		//final String strUserId = getParameter(Common.USER_ID);
		
		
		
		%>
		
		
		<%
			} // while
			}
		%>
	</ul>

	<%

	%>

</body>
</html>