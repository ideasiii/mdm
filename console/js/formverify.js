function Trim(x) {
	return x.replace(/^\s+|\s+$/gm, '');
}

function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}

function checkGroupAddData(formName) {
	var form = document.getElementById(formName);
	var errMsg = '';
	re = /\W/;

	if (Trim(form.group_name.value) == '')
		errMsg += "Please enter a group name !!\n";
	else
	{
		if (form.group_name.value.length > 20)
			errMsg += "Group name must be less than 20 characters !!\n";
	}

if (Trim(form.account.value) == '')
	errMsg += "Please enter a login account !!\n";
else
	{
	if (re.test(Trim(form.account.value)))
		{
		errMsg += "Login account must contain only alphanumeric characters !!\n";
		}
else
	{
	if (form.account.value.length > 20)
		errMsg += "Login account must be less than 20 characters !!\n";
	}
	}

if (Trim(form.password.value) == '')
	errMsg += "Please enter a password !!\n";
else
{
if (re.test(Trim(form.password.value)))
	{
	errMsg += "Password must contain only alphanumeric characters !!\n";
	}
else
{
if (form.password.value.length > 20)
	errMsg += "Password must be less than 20 characters !!\n";
}
}

if (errMsg == '') {
	form.submit();
	return true;
}
alert(errMsg);
return false;
}