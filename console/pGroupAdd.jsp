<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="mdmjava.*"%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>MDM GROUP ADD PROGRESS</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="assets/css/countdown.css" />
<!-- END PAGE LEVEL STYLES -->

<!-- JavaScript -->
<script src="js/formverify.js"></script>
<script type="text/javascript">
	function hideLoading()
	{
		document.getElementById('loading').style.display = "none";
		document.getElementById('result').style.display = "";
	}
</script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="row">
	<div class="col-lg-12 title" >
		<h2>Loading</h2>
		<p>Please Wait...</p>
		<img  src="assets/img/loading.gif" width="600px;">
	</div>
</div>


	<!-- GLOBAL SCRIPTS -->
	<script src="assets/plugins/jquery-2.0.3.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/countdown/jquery.countdown.min.js"></script>

	<script type="text/javascript"
		src="assets/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>

	<script type="text/javascript" src="assets/js/countdown.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>

<%
    request.setCharacterEncoding("UTF-8");

			final String strEmail = request.getParameter(Common.USER_EMAIL);
			final String strName = request.getParameter(Common.GROUP_NAME);
			final String strAccount = request.getParameter(Common.ACCOUNT);
			final String strPassword = request.getParameter(Common.PASSWORD);
			final String strMaximum = request.getParameter(Common.MAXIMUM);
			final String strPermission = request.getParameter(Common.PERMISSION);
			String strUserId = null;
	
			if (null != strPermission && strPermission.trim().equals("android"))
				strUserId = request.getParameter("userId_Android");

			Mdm mdm = new Mdm();

			if (!mdm.conDB())
			{
				response.sendRedirect("error.html"); //insert error page 
				return;
			}
			
			int nResult = mdm.insertpGroupAdd(strName, strAccount, strPassword, strMaximum, strUserId);
			String strResult = null;
			
			mdm.closeDB();
			
			mdm = null;
%>

<!-- Form -->
<form action="group_management.jsp" method="post" name="FormHome"
	id="FormHome">
	<input name="<%=Common.USER_EMAIL%>" type="hidden"
		value="<%=strEmail%>" />
</form>
<%
    if (nResult == Mdm.MDM_DB_ERR_SUCCESS) {
%>
<script>
	formSubmit('FormHome');
</script>
<%
    }
%>
</html>