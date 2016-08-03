function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkControllerId(formname,item) {
	alert('hello');
	var form = document.getElementById(formname);
	alert(formname);
	
	if('1' == item)
		{
		alert('10');
form.ControlId;
		alert('14');
		}
	
	switch (item) {
	case 1:
		form.control_id.value = 1;
		alert('14');
		break;
	case 2:
		form.control_id.value = 2;
		break;
	case 3:
		form.control_id.value = 3;
		break;
	case 4:
		form.control_id.value = 4;
		break;
	case 5:
		form.control_id.value = 5;
		break;
	case 6:
		form.control_id.value = 6;
		break;
	case 7:
		form.control_id.value = 7;
		break;
	case 8:
		form.control_id.value = 8;
		break;
	case 9:
		form.control_id.value = 9;
		break;
	}
	alert('40');
	form.submit();

}