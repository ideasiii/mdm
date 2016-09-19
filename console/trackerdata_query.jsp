<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%@include file="tracker_common.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>TRACKER DATA QUERY</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="assets/css/main_2.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->

<!--  JavaScript -->
<script type="text/javascript">
	function Trim(x) {
		return x.replace(/^\s+|\s+$/gm, '');
	}

	function formSubmit(formName) {
		var form = document.getElementById(formName);
		form.submit();
	}

	function checkInputData(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;
		var errMsg = '';
		var re = /\D/;
		var reDate = new RegExp(/^[0-9]{4}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/);
		var parts = form.start_date.value.split('-');
		var sd = new Date(parts[0],parts[1]-1,parts[2]);
		parts = form.end_date.value.split('-');
		var ed = new Date(parts[0],parts[1]-1,parts[2]);

		if (Trim(form.app_id.value) == '')
			errMsg += "Please enter an app ID !!\n";
		else {
			if (re.test(Trim(form.app_id.value))) {
				errMsg += "App ID must contain only numeric characters !!\n";
			}
		}
		
		
		if (Trim(form.start_date.value) != '') {
			if (!reDate.test(form.start_date.value))
				errMsg += "Wrong date format !!\n";
					else{
						if(sd > ed)
					errMsg += "End date must be after start date !!\n";
				}	
		}

		if (errMsg == '') {
			form.submit();
			return true;
		}

		alert(errMsg);
		return false;
	}
</script>

</head>

<body>


	<div class="row" style="margin: 10%;">
		<div class="col-lg-12" style="padding-left: 25%; padding-right: 25%;">
			<div class="box">
				<header>
					<h5>
						<i class="fa fa-search fa-1x" aria-hidden="true"></i> Raw Data
						Query
					</h5>
					<div class="toolbar">
						<div class="btn-group"></div>
					</div>
				</header>
				<div class="body">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default title"
								style="padding: 30px; padding-left: 15%; padding-right: 15%;">
								<form action="trackerdata_result.jsp" role="form"
									name="formQueryTrackerData" id="formQueryTrackerData">

									<div class="form-group">
										<label>App ID</label> <input class="form-control"
											name="<%=Common.APP_ID%>" />
										<p class="help-block" style="color: #b94a48;">Notification:
											Group name cannot be changed.</p>
									</div>

									<div class="form-group">
										<dl>
											<dd style="text-align: left;">
												<label for="dp3">Start Date</label>
												<div>
													<input type="text" class="form-control"
														name="<%=Common.START_DATE%>"
														data-date-format="yyyy-mm-dd" id="dp3" />
												</div>
											</dd>
										</dl>

										<dl>
											<dd style="text-align: left;">
												<label for="dp4">End Date</label>
												<div>
													<input type="text" class="form-control"
														name="<%=Common.END_DATE%>" data-date-format="yyyy-mm-dd"
														id="dp4" />
												</div>
											</dd>
										</dl>
									</div>
								</form>
								<br>
								<div style="text-align: center;">

									<button type="button" class="btn btn-primary" title="Query"
										onClick="checkInputData('formQueryTrackerData')">
										<span class="sr-only">Query </span>Query
									</button>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>





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
</html>

