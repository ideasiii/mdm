function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkControllerId(item, action) {
	var form = document.getElementById('formControllerJob');
	
	form.control_id.value = item;
	form.action.value = action;

	form.submit();

}

//Screen Lock on
function checkScreenLockInput(item, action){
	var form = document.getElementById('formScreenLock');
	
	form.control_id.value = item;
	form.action.value = action;

	form.submit();
	
}