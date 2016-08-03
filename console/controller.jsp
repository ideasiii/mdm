<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="mdmjava.*"%>
<%
    request.setCharacterEncoding("UTF-8");

			final String strGroupId = request.getParameter(Common.GROUP_ID);
			final String strControlId = request.getParameter("control_id");
			final String strCmmdFrom = request.getParameter("cmmd_from");

			Mdm mdm = new Mdm();

			if (!mdm.conTypeDB(0)) {
				response.sendRedirect("error.html"); //insert error page 
				return;
			}

			Mdm.DeviceData deviceData = null;

			ArrayList<Mdm.DeviceData> listDevice = new ArrayList<Mdm.DeviceData>();
			int nDCount = mdm.queryDevice(strGroupId, listDevice);
			int nResult = Mdm.MDM_DB_ERR_FAIL;

			if (0 < nDCount) {
				for (int i = 0; i < listDevice.size(); ++i) {
					deviceData = listDevice.get(i);
					nResult = mdm.insertControllerJob(strControlId, strCmmdFrom, deviceData.mac_address);
					if (Mdm.MDM_DB_ERR_SUCCESS != nResult) {
						break;
					}
				}
			}

		//	String strResult = null;

			mdm.closeTypeDB(0);
			mdm = null;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>MDM PROGRESS</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- JavaScript -->
<script src="js/controller_list.js"></script>

</head>
<body>

	<form action="device_management.jsp" method="post" name="FormHome"
		id="FormHome">
		<input name="<%=Common.GROUP_ID%>" type="hidden"
			value="<%=strGroupId%>" />
	</form>
	<form action="error.jsp" method="post" name="Error" id="Error">
	</form>

	<%
	    if (nResult  == Mdm.MDM_DB_ERR_SUCCESS) {
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	    } else {
	%>
	<script>
		formSubmit('Error');
	</script>
	<%
	    }
	%>
</body>
</html>


