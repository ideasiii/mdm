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
						<a href="group_management.jsp" class="navbar-brand"> <img
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
				<%
				    mdm.closeTypeDB(0);
							mdm.closeDB();
				%>
			</nav>
		</div>
		<!--END GROUP SELECT -->

		<!-- CONTROLLER FORM -->
		<div class="col-lg-12">
			<div class="modal fade" id="con-camera" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Turn Off / On Camera of All
								Devices in This Group</h4>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla pariatur.
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
							officia deserunt mollit anim id est laborum.</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-danger"
								style="margin-right: 60px;" data-dismiss="modal">Off</button>
							<button type="button" class="btn btn-metis-2"
								data-dismiss="modal">On</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-screen" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Turn Off / On Screen Lock of
								All Devices in This Group</h4>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla pariatur.
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
							officia deserunt mollit anim id est laborum.</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-danger"
								style="margin-right: 60px;" data-dismiss="modal">Off</button>
							<button type="button" class="btn btn-metis-2" data-toggle="modal"
								data-target="#screen-on" data-dismiss="modal">On</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="screen-on" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Set a Password to Lock Your
								Screen</h4>
						</div>
						<div class="modal-body">
							<form role="form">
								<div class="form-group">
									<label>Screen Lock Password</label> <input class="form-control" />
									<p class="help-block">(Must be less than 10 letters in
										alphanumeric format.)</p>
								</div>
							</form>
						</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Confirm</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-mute" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Turn Off / On Mute of All
								Devices in This Group</h4>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla pariatur.
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
							officia deserunt mollit anim id est laborum.</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-danger"
								style="margin-right: 60px;" data-dismiss="modal">Off</button>
							<button type="button" class="btn btn-metis-2"
								data-dismiss="modal">On</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-wifi" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Grant Permission for
								Accessing WiFi</h4>
						</div>
						<div class="modal-body">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
							enim ad minim veniam, quis nostrud exercitation ullamco laboris
							nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
							reprehenderit in voluptate velit esse cillum dolore eu fugiat
							nulla pariatur. Excepteur sint occaecat cupidatat non proident,
							sunt in culpa qui officia deserunt mollit anim id est laborum.
							<p></p>
							<form role="form">
								<div class="form-group">
									<label>SSID</label> <input class="form-control" />
									<p class="help-block">1234</p>
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control" />
									<p class="help-block">1234</p>
								</div>
							</form>
						</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Confirm</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-content" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Sent the Content to All
								Devices in This Group</h4>
						</div>
						<div class="modal-body">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
							enim ad minim veniam, quis nostrud exercitation ullamco laboris
							nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
							reprehenderit in voluptate velit esse cillum dolore eu fugiat
							nulla pariatur. Excepteur sint occaecat cupidatat non proident,
							sunt in culpa qui officia deserunt mollit anim id est laborum.
							<p></p>
							<form role="form">
								<div class="form-group">
									<br> <label>Your Content List</label>
									<div class="box">
										<div class="body"
											style="margin-left: 40px; overflow-x: hidden; overflow-y: scroll; height: 180px;">
											<div class="checkbox anim-checkbox" title="filename_demo1">
												<input type="checkbox" id="ch1" class="success" /> <label
													for="ch1">filename_demo1</label>
											</div>
											<span class="sr-only">filename_demo1</span>
											<div class="checkbox anim-checkbox" title="filename_demo2">
												<input type="checkbox" id="ch2" class="success" /> <label
													for="ch2">filename_demo2</label>
											</div>
											<span class="sr-only">filename_demo2</span>
											<div class="checkbox anim-checkbox" title="filename_demo3">
												<input type="checkbox" id="ch3" class="success" /> <label
													for="ch3">filename_demo3</label>
											</div>
											<span class="sr-only">filename_demo3</span>
											<div class="checkbox anim-checkbox" title="filename_demo4">
												<input type="checkbox" id="ch4" class="success" /> <label
													for="ch4">filename_demo4</label>
											</div>
											<span class="sr-only">filename_demo4</span>
											<div class="checkbox anim-checkbox" title="filename_demo5">
												<input type="checkbox" id="ch5" class="success" /> <label
													for="ch5">filename_demo5</label>
											</div>
											<span class="sr-only">filename_demo5</span>
											<div class="checkbox anim-checkbox" title="filename_demo6">
												<input type="checkbox" id="ch6" class="success" /> <label
													for="ch6">filename_demo6</label>
											</div>
											<span class="sr-only">filename_demo6</span>
										</div>
									</div>
									<p class="help-block"></p>
								</div>
							</form>
						</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Confirm</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-app" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Install or Uninstall Apps in
								All Devices in This Group</h4>
						</div>
						<div class="modal-body">
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
							eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
							enim ad minim veniam, quis nostrud exercitation ullamco laboris

							<p></p>
							<div id="div-3" class="accordion-body collapse in body">
								<div class="row">

									<div class="col-lg-5">
										<div class="form-group">
											<div class="input-group"></div>
										</div>
										<div class="form-group">
											<label>Your Application Management List</label> <select
												id="box1View" multiple="multiple" class="form-control"
												size="9">
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501649">Facebook</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501497">Gmail</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501053">Google Maps</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="500001">Line</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501227">Skype</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501610">Todoist</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501514">Twitter</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501656">Word</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501050">Yahoo</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501075">YouTube</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501493">QR Reader</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501562">Messenger</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="500676">Cloud</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="501460">Calendar</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="500004">aNote</option>
												<option
													style="background-image: url(assets/img/Apps-Android-icon-mini.png); background-repeat: no-repeat; background-position: bottom left; padding-left: 30px;"
													value="500336">Dropbox</option>
											</select>
										</div>
									</div>

									<div class="col-lg-2" style="text-align: right;">
										<div class="btn-group" style="white-space: normal;">
											<button id="to2" type="button" class="btn btn-default">
												<i class="icon-plus"></i>
											</button>
											<button id="allTo2" type="button" class="btn btn-default">
												<span>Add all</span>
											</button>
											<button id="to1" type="button" class="btn btn-default">
												<i class=" icon-minus icon-white"></i>
											</button>
											<button id="allTo1" type="button" class="btn btn-default">
												<span>Remove all</span>
											</button>
										</div>
									</div>

									<div class="col-lg-5">
										<div class="form-group">
											<label>Implementation</label> <select id="box2View"
												multiple="multiple" class="form-control" size="5"></select>
										</div>
									</div>
								</div>
							</div>


						</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-primary"
								style="margin-right: 60px;" data-dismiss="modal">Install</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Uninstall</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-record" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Record All Devices in This
								Group</h4>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla pariatur.
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
							officia deserunt mollit anim id est laborum.</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" data-toggle="modal" data-target="#loading">Record</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-restore" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Restore All Devices in This
								Group</h4>
						</div>
						<div class="modal-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniam, quis
							nostrud exercitation ullamco laboris nisi ut aliquip ex ea
							commodo consequat. Duis aute irure dolor in reprehenderit in
							voluptate velit esse cillum dolore eu fugiat nulla pariatur.
							Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
							officia deserunt mollit anim id est laborum.</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" data-toggle="modal" data-target="#loading">Restore</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="con-format" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Format All Devices in This
								Group</h4>
						</div>
						<div class="modal-body">
							<span><i
								class="fa fa-exclamation-triangle fa-4x text-danger fa-pull-left fa-border"></i>Lorem
								ipsum dolor sit amet, consectetur adipisicing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
								enim ad minim veniam, quis nostrud exercitation ullamco laboris
								nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
								in reprehenderit in voluptate velit esse cillum dolore eu fugiat
								nulla pariatur. Excepteur sint occaecat cupidatat non proident,
								sunt in culpa qui officia deserunt mollit anim id est laborum.</span>
						</div>
						<div
							style="border-top: 1px solid #e5e5e5; padding: 15px 15px 15px; text-align: center;">
							<button type="button" class="btn btn-default"
								style="margin-right: 60px;" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" data-toggle="modal" data-target="#loading">Format</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTROLLER FORM -->
		<!-- END HEADER SECTION -->


		<!--PAGE CONTENT -->
		<div id="content">

			<div class="inner" style="min-height: 700px;">
				<div class="row">
					<div class="col-lg-12">
						<h1>Device Management</h1>
					</div>
				</div>
				<hr />

				<!-- CHAT  SECTION -->
				<%
				    if (!mdm.conTypeDB(0)) {
								response.sendRedirect("error.html"); //insert error page 
								return;
							}
							itGD = listGroup.iterator();

							//	    Iterator<Mdm.DeviceData> itDD = null;
							Mdm.DeviceData deviceData = null;

							ArrayList<Mdm.DeviceData> listDevice = new ArrayList<Mdm.DeviceData>();
							int nDCount = mdm.queryDevice(strGroupId, listDevice);
							//out.println(strGroupId);
							//	itDD = listDevice.iterator();

							int nSum;
							int nCountPage;
							int nRemain;
							nSum = listDevice.size();
							nCountPage = nSum / 8;
							nRemain = nSum % 8;

							if (0 < nRemain) {
								nCountPage = nCountPage + 1;
							}
				%>
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">
							<div class="panel-heading">
								Connection status :
								<%
							    out.println(nSum);
							%>
								device(s) connected.
							</div>


							<div class="demo-container">
								<div id="placeholderRT" class="demo-placeholder"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<!--END CHAT SECTION -->

						<br>

						<!--CONTROLLER SECTION -->
						<div class="row">
							<div class="col-lg-12">
								<div style="text-align: center;">
									<%
									    if (nSum == 0) {
									%>
									<a class="quick-btn"> <i
										class="icon-camera icon-2x disable-button"></i> <span
										class="disable-button"> Camera</span> <span
										class="label label-success">device</span>
									</a> <a class="quick-btn"> <i
										class="icon-lock icon-2x disable-button"></i> <span
										class="disable-button">Screen Lock</span> <span
										class="label label-success">device</span>
									</a> <a class="quick-btn"> <i
										class="icon-volume-off icon-2x disable-button"></i> <span
										class="disable-button">Mute</span> <span
										class="label label-success">device</span>
									</a> <a class="quick-btn"> <i
										class="icon-rss icon-2x disable-button"></i> <span
										class="disable-button">Wi-Fi</span> <span
										class="label label-warning">service</span>
									</a> <a class="quick-btn"> <i
										class="icon-file-text icon-2x disable-button"></i> <span
										class="disable-button">Content</span> <span
										class="label label-warning">service</span>
									</a> <a class="quick-btn"> <i
										class="icon-android icon-2x disable-button"></i> <span
										class="disable-button">Application</span> <span
										class="label label-warning">service</span>
									</a> <a class="quick-btn"> <i
										class="icon-signin icon-2x disable-button"></i> <span
										class="disable-button">Record</span> <span
										class="label btn-metis-4">system</span>
									</a> <a class="quick-btn"> <i
										class="icon-exchange icon-2x disable-button"></i> <span
										class="disable-button">Restore</span> <span
										class="label btn-metis-4">system</span>
									</a> <a class="quick-btn"> <i
										class="icon-stop  icon-2x disable-button"></i> <span
										class="disable-button">Format</span> <span
										class="label btn-metis-4">system</span>
									</a> <a class="quick-btn"> <i
										class="icon-cog icon-2x disable-button"></i> <span
										class="disable-button"> New</span> <span
										class="label label-default">coming</span>
									</a> <a class="quick-btn"> <i
										class="icon-map-marker icon-2x disable-button"></i> <span
										class="disable-button"> New</span> <span
										class="label label-default">coming</span>
									</a>
									<%
									    } else {
									%>
									<a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-camera" onclick="checkControllerId('1')"> <i
										class="icon-camera icon-2x"></i> <span> Camera</span> <span
										class="label label-success">device</span>
									</a> <a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-screen" onclick="checkControllerId('2')"> <i
										class="icon-lock icon-2x"></i> <span>Screen Lock</span> <span
										class="label label-success">device</span>
									</a> <a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-mute" onclick="checkControllerId('3')"> <i
										class="icon-volume-off icon-2x"></i> <span>Mute</span> <span
										class="label label-success">device</span>
									</a> <a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-wifi" onclick="checkControllerId('4')"> <i
										class="icon-rss icon-2x"></i> <span>Wi-Fi</span> <span
										class="label label-warning">service</span>
									</a> <a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-content" onclick="checkControllerId('5')"> <i
										class="icon-file-text icon-2x"></i> <span>Content</span> <span
										class="label label-warning">service</span>
									</a> <a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-app" onclick="checkControllerId('6')"> <i
										class="icon-android icon-2x"></i> <span>Application</span> <span
										class="label label-warning">service</span>
									</a><a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-record" onclick="checkControllerId('7')"> <i
										class="icon-signin icon-2x"></i> <span>Record</span> <span
										class="label btn-metis-4">system</span>
									</a><a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-restore" onclick="checkControllerId('8')"> <i
										class="icon-exchange icon-2x"></i> <span>Restore</span> <span
										class="label btn-metis-4">system</span>
									</a><a onmouseover="this.style.cursor='pointer'" class="quick-btn"
										data-toggle="modal" data-target="#con-format" onclick="checkControllerId('9')"> <i
										class="icon-stop  icon-2x"></i> <span>Format</span> <span
										class="label btn-metis-4">system</span>
									</a><a class="quick-btn"> <i
										class="icon-cog icon-2x disable-button"></i> <span
										class="disable-button"> New</span> <span
										class="label label-default">coming</span>
									</a><a class="quick-btn"> <i
										class="icon-map-marker icon-2x disable-button"></i> <span
										class="disable-button"> New</span> <span
										class="label label-default">coming</span>
									</a>
									<%
									    }
									%>
								</div>
							</div>
						</div>
						<!--END CONTROLLER SECTION -->

						<hr />

						<!--DEVICES LIST WINDOW -->
						<div class="row">
							<div class="col-lg-6">
								<div class="box">
									<header>
										<h5>Devices</h5>
										<div class="toolbar">
											<div class="btn-group"></div>
										</div>
									</header>



									<!-- APPlication List -->
									<%
									    if (nSum == 0) {
									%>
									<div class="body" style="height: 300px;">
										<%
										    } else {
										%>
										<div class="body">
											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-default">

														<!-- Display device list-->

														<!--item per slider -->

														<div id="myCarousel" class="carousel slide"
															data-ride="carousel" data-interval="false">

															<!-- Indicators -->
															<ol class="carousel-indicators">
																<%
																    for (int nDot = 0; nDot < nCountPage; ++nDot) {

																					if (nDot == 0) {
																%>
																<li data-target="#myCarousel" data-slide-to="0"
																	class="active"></li>
																<%
																    } else {
																%>
																<li data-target="#myCarousel" data-slide-to="1"></li>

																<%
																    }
																				}
																%>
															</ol>
															<%
															    }
															%>
															<!-- Wrapper for slides -->
															<div class="carousel-inner" role="listbox">
																<%
																    for (int nPage = 0; nPage < nCountPage; ++nPage) {
																				int nStart;
																				int nEnd;
																				nStart = nPage * 8;
																				nEnd = (nPage * 8) + 8;

																				if (0 == nPage) {
																%>
																<div class="item active"
																	style="text-align: center; margin-top: 30px; margin-bottom: 70px; margin-left: 15%; margin-right: 15%;">
																	<div class="span4">
																		<%
																		    } else {
																		%><div class="item text-primary"
																			style="text-align: center; margin-top: 30px; margin-bottom: 70px; margin-left: 15%; margin-right: 15%;">
																			<div class="span4">
																				<%
																				    }
																								for (int i = nStart; i < nEnd; ++i) {
																									deviceData = listDevice.get(i);
																				%>

																				<a class="device-btn panel-heading panel-primary"
																					href="device_controller.html"> <i><img
																						src="assets/img/phone.png" class="img-thumbnail"></i><br>
																					<br> <span><%=deviceData.device_model%></span>
																				</a>

																				<%
																				    }
																								if (0 == nPage) {
																				%>
																			</div>
																		</div>

																		<!-- Controls -->
																		<div></div>
																		<a class="left carousel-control" href="#myCarousel"
																			style="outline: 0;" role="button" data-slide="prev">
																			<span class="glyphicon glyphicon-chevron-left"
																			aria-hidden="true"></span> <span class="sr-only">Previous</span>

																		</a> <a class="right carousel-control" href="#myCarousel"
																			style="outline: 0;" role="button" data-slide="next">
																			<span class="glyphicon glyphicon-chevron-right"
																			aria-hidden="true"></span> <span class="sr-only">Next</span>
																		</a>
																		<%
																		    } else {
																		%>
																	</div>
																</div>
																<%
																    }
																			}
																%>

															</div>
														</div>
														<!--end item per slider -->
														<!-- End Display app list-->

													</div>
												</div>
											</div>
										</div>
										<!-- /.row -->
										<!-- APPlication List -->

									</div>
								</div>
							</div>
						</div>
						<!--END DEVICES LIST WINDOW  -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--END PAGE CONTENT -->

	<!--FOOTER -->
	<footer class="footer">
		<div class="link_area">
			<dl class="link_group">
				<dd class="link">
					<a href="">Document</a>
				</dd>
			</dl>
			<dl class="link_group">
				<dd class="link">
					<a href="">Privacy Policy</a>
				</dd>
			</dl>
			<dl class="link_group">
				<dd class="link">
					<a href="">Contact Us</a>
				</dd>
			</dl>
			<div class="copyright_area">Copyright ©</div>
		</div>
	</footer>

	<!--END FOOTER -->

	<!--END MAIN WRAPPER -->


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


	<!--END PAGE LEVEL SCRIPT-->
</body>

<form action="controller.jsp" method="post" name="ControllerJob" id="ControllerJob" >
<input name="<%=Common.GROUP_ID%>" type="hidden" value="<%=strGroupId%>" />
<input name="control_id" type="hidden" value="" />
<input name="cmmd_from" type="hidden" value="group" />
</form>

</html>
	<%
	    mdm.closeTypeDB(0);

				mdm = null;
	%>