
<%
    final String strEmail = "juliettechien@iii.org.tw";//request.getParameter(Common.USER_EMAIL);

    String strAccountV = "";

    ArrayList<String> listPermissionName = new ArrayList<String>();

    ArrayList<Mdm.PermissionData> listPermission = new ArrayList<Mdm.PermissionData>();
    Mdm.PermissionData permissionData = null;
    String strUserId_Android = null;

    Mdm mdm = new Mdm();

    if (!mdm.conDB())
    {
		response.sendRedirect("error.html"); //insert error page 
		return;
    }

    int nCount = mdm.queryPermission(strEmail, listPermission);
    //nCount = 0;
    if (0 < nCount)
    {
		Iterator<Mdm.PermissionData> itPD = null;
		itPD = listPermission.iterator();

		while (itPD.hasNext())
		{
		    permissionData = itPD.next();
		    listPermissionName.add(permissionData.permission);
		    if (permissionData.permission.trim().equals("android"))
		    {
			strUserId_Android = permissionData.user_id;

			if (!mdm.conTypeDB(0))
			{
			    response.sendRedirect("error.html"); //insert error page 
			    return;
			}

			/********** group info**************/

			Iterator<Mdm.GroupData> itGD = null;
			Mdm.GroupData groupData = null;

			ArrayList<Mdm.GroupData> listGroup = new ArrayList<Mdm.GroupData>();
			int nGCount = mdm.queryGroup(permissionData.user_id, listGroup);
			//out.println(nGCount);

			itGD = listGroup.iterator();
%>
<div class="styled-select blue semi-square">
	<select onchange="location.href=this.options[this.selectedIndex].value">
		<option>Select Group</option>

		<%
		    while (itGD.hasNext())
					{

					    groupData = itGD.next();
					    strAccountV = strAccountV + groupData.account;
					    if (itGD.hasNext())
					    {
						strAccountV += ',';
					    }
		%>

		<option
			value="device_management.jsp?<%=Common.GROUP_ID%>=<%=groupData.group_id%>&type=android"><%=groupData.group_name%></option>

		<%
		    }
				    }

				    ///add conTpyeBD else type DB

				} // while
				/********* end group info************/
		%>

	</select>
</div>

<%
    } // if
    else
    {
%>
<div class="styled-select blue semi-square">
	<select><option>Please Create a Group</select>
</div>
<%
    }
%>