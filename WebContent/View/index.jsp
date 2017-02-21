<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Management System</title>
<script src="${pageContext.request.contextPath}/js/prototype.js"></script>
</head>
<body>
	<div id="mainContent">
		<table align="center">
			<tr>
				<td><label>Username: </label></td>
				<td><input type="text" id="txtUsername"></td>
			</tr>
			<tr>
				<td><label>Password: </label></td>
				<td><input type="password" id="txtPassword"></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="button" id="btnLogin" value="Login"></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">

var path = "${pageContext.request.contextPath}";
alert(1);
$("btnLogin").observe("click", login);

function login () {
	new Ajax.Request(path + "/index" , {
		method : "post",
		parameters : {
			
		}
	});
}

</script>

</html>