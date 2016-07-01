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

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Device Management | MDM</title>

<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="assets/css/main_2.css" />
<link rel="stylesheet" href="assets/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- jQuery -->
<script src="assets/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<style>

/* dropdown */
select.icon-menu option {
	background-repeat: no-repeat;
	background-position: bottom left;
	padding-left: 30px;
}

.styled-select {
	background: url(assets/img/15xvbd5.png) no-repeat 96% 0;
	height: 31.5px;
	overflow: hidden;
	width: 240px;
	float: right;
	margin-right: 8px;
}

.styled-select select {
	background: transparent;
	border: none;
	font-size: 14px;
	height: 31.5px;
	padding: 5px;
	width: 268px;
}

.semi-square {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

.blue {
	background-color: #428bca;
}

.blue select {
	color: #fff;
}
/* end dropdown */

/* button */
.disable-button {
	color: #c5c5c5;
}
/* end button */

/* footer */
.footer {
	width: 100%;
	background: #E0E0E0;
}

.footer .link_area {
	background: #F0F0F0;
	text-align: right;
	padding: 30px 0;
}

.footer .link_area .link_group {
	display: inline-block;
	vertical-align: top;
	margin: 10px 25px;
}

.footer .link_area .link_group .link {
	text-align: left;
	line-height: 1em;
}

.footer .link_area .link_group .link a {
	color: #000;
}

.footer .link_area .link_group .link a:hover {
	text-decoration: underline;
}

.footer .copyright_area {
	text-align: right;
	margin-right: 20px;
	height: 40px;
	line-height: 60px;
	color: #9D9D9D;
}
/* end footer */

/* device list */
.device-btn {
	position: relative;
	display: inline-block;
	width: 200px;
	height: 200px;
	padding-top: 16px;
	margin: 10px;
	color: #444444;
	text-align: center;
	text-decoration: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.6);
	-webkit-box-shadow: 0 0 0 1px #F8F8F8 inset, 0 0 0 1px #CCCCCC;
	box-shadow: 0 0 0 1px #F8F8F8 inset, 0 0 0 1px #CCCCCC;
}
/* End device list */
</style>
</head>

<body class="padTop53 ">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top "
				style="padding-top: 10px;">

				<!-- LOGO SECTION -->
				<header class="navbar-header">
					<div>
						<a href="group_management.html" class="navbar-brand"> <img
							width="100" style="padding-bottom: 5px;"
							src="assets/img/more.png" alt="" />
						</a>
					</div>
				</header>
				<!-- END LOGO SECTION -->

				<!-- GROUP SELECT -->
				<%
				    request.setCharacterEncoding("UTF-8");
				%>
				<%@include file="groupBar.jsp"%>

			</nav>
		</div>
		<!--END GROUP SELECT -->







	</div>
	<!--END MAIN WRAPPER -->
	<%
	    mdm.closeTypeDB(0);
				mdm.closeDB();
				mdm = null;
	%>

	<!-- GLOBAL SCRIPTS -->
	<script src="assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPT-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script
		src="assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="assets/plugins/daterangepicker/moment.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
	<script
		src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
	<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="assets/js/formsInit.js"></script>
	<script>
		$(function() {
			formInit();
		});
	</script>
	<SCRIPT type="text/javascript">
		changeBtn();
		showBtnV();
	</SCRIPT>
	<!--END PAGE LEVEL SCRIPT-->

</body>
</html>