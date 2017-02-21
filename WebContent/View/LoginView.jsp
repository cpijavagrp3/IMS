<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Management System</title>
<script src="${pageContext.request.contextPath}/JS/prototype.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/CSS/MainStyle.css" type="text/css">
</head>
<body>
	<div id="initContent">
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

$("btnLogin").observe("click", login);

function login () {
	new Ajax.Request(path + "/login" , {
		method : "post",
		parameters : {
			action : "login",
			userName : $F("txtUsername"),
			pass : $F("txtPassword")
		},
		onComplete : function(response) {
			$('initContent').update(response.responseText);
		}
	});
}

</script>

</html>