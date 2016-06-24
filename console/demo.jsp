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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Management | MDM</title>

<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="assets/css/main_2.css" />
<link rel="stylesheet" href="assets/css/theme.css" />
<link rel="stylesheet" href="assets/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link href="assets/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css" />

<!-- END PAGE LEVEL  STYLES -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<style>

/* dropdown */
.styled-select {
	background: url(assets/img/15xvbd5.png) no-repeat 96% 0;
	height: 31.5px;
	overflow: hidden;
	width: 240px;
	float: right;
}

.styled-select select {
	background: transparent;
	border: none;
	font-size: 14px;
	height: 31.5px;
	padding: 5px;
	width: 268px;
}

.styled-select span {
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

.blue span {
	color: #fff;
}
/* end dropdown */

/* add button */
.button-add {
	background-color: #428bca;
	overflow: hidden;
	border: none;
	float: right;
	margin-left: 6px;
	margin-right: 8px;
}

/* end add button */

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

				<!-- CREATE GROUP -->
				<div>
					<button class="btn btn-info button-add semi-square"
						data-toggle="modal" data-target="#AddGroup"
						title="Create a new group">
						<i class="fa fa-plus fa-lg" aria-hidden="true"></i> <span
							class="sr-only">Create a new group</span>
					</button>
				</div>

				<!--END CREATE GROUP -->

				<!-- GROUP SELECT -->
				<%
					final String strEmail = "juliettechien@iii.org.tw";//request.getParameter(Common.USER_EMAIL);
					Mdm mdm = new Mdm();

					ArrayList<Mdm.PermissionData> listPermission = new ArrayList<Mdm.PermissionData>();
					int nCount = mdm.queryPermission(strEmail, listPermission);
					nCount = 0;
					if (0 < nCount) {
						Iterator<Mdm.PermissionData> itPD = null;
						itPD = listPermission.iterator();
						Mdm.PermissionData permissionData = null;
						while (itPD.hasNext()) {
							permissionData = itPD.next();
							if (permissionData.permission.trim().equals("android")) {

								/********** group info**************/

								Iterator<Mdm.GroupData> itGD = null;
								Mdm.GroupData groupData = null;

								ArrayList<Mdm.GroupData> listGroup = new ArrayList<Mdm.GroupData>();
								int nGCount = mdm.queryGroup(permissionData.user_id, listGroup);
								out.println(nGCount);

								itGD = listGroup.iterator();
				%>
				<div class="styled-select blue semi-square">
					<select
						onchange="location.href=this.options[this.selectedIndex].value">
						<option>Select Group</option>

						<%
							while (itGD.hasNext()) {
											groupData = itGD.next();
						%>

						<option value="device_management.html"><%=groupData.group_name%></option>

						<%
							}
									}
								} // while
								/********* end user group ************/
						%>

					</select>
				</div>

				<%
					} // if
					else {
				%>
				<div class="styled-select blue semi-square">
						<select ><option>Please Create a Group</select>
				</div>
				<%
					}
				%>

			</nav>
		</div>
		<!--END GROUP SELECT -->
		</nav>
	</div>


</body>
</html>