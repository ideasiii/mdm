<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="mdmjava.Mdm"%>


<%
	request.setCharacterEncoding("UTF-8");

	final String strName = request.getParameter("group_name");
	final String strAccount = request.getParameter("account");
	final String strPassword = request.getParameter("password");
	final String strMaximum = request.getParameter("maximum");
	final String str = request.getParameter("");

	Mdm mdm = new Mdm();
	String 
	int nResult = mdm.pGroupAdd(strName, strAccount, strPassword, strMaximum, str, str);
	
	String strResult = "   ";
	
	
	mdm = null;
%>

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
<!-- GLOBAL STYLES -->
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="assets/css/countdown.css" />
<!-- END PAGE LEVEL STYLES -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="col-lg-12 title">
		<h2>
			Our Site Is <span class="">U</span>nder <span class="">C</span>onstruction
		</h2>
		We are done with the backend just front end to go.
	</div>
	<br />
	<br />
	<div class="row">
		<div class="col-lg-12">
			<div class="progress progress-striped active"  rel="tooltip"
				data-placement="bottom" data-original-title="Total Progress">
				<div id="total-bar" class="progress-bar progress-bar-primary"></div>
			</div>
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

</html>