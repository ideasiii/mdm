function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkControllerId(item) {
	alert('hello');
	var form = document.getElementById('formControllerJob');
	alert(form);
	
	form.control_id.value =item;
	
//	if('1' == item)
//		{
//		alert('10');
//form.ControlId.value = '1';
//		alert('14');
//		}
//	else if('2' == item){
//		
//		form.ControlId.value = '2';
//		
//	}
		
		
	
	
	alert('40');
	form.submit();

}